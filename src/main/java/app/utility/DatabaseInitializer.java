package app.utility;

import app.framework.Cohort12Table;
import app.model.Person;
import app.model.School;
import app.model.Trainer;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Read DB config from context params
        String dbUrl = sce.getServletContext().getInitParameter("db.url");
        String dbUser = sce.getServletContext().getInitParameter("db.user");
        String dbPassword = sce.getServletContext().getInitParameter("db.password");

        if (dbUrl != null && dbUser != null && dbPassword != null) {
            DatabaseUtil.setCredentials(dbUrl, dbUser, dbPassword);
        }

        try {
            createDatabaseIfNotExists();
            createTables();
            System.out.println("Database initialized successfully");
        } catch (Exception e) {
            throw new RuntimeException("Failed to initialize database", e);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Cleanup if needed
    }

    private void createDatabaseIfNotExists() throws SQLException {
        // Connect without specifying DB to create it
        String baseUrl = DatabaseUtil.URL.replace("/cohort12_db", "");
        try (Connection conn = DriverManager.getConnection(baseUrl, DatabaseUtil.USER, DatabaseUtil.PASSWORD);
             Statement stmt = conn.createStatement()) {

            stmt.executeUpdate("CREATE DATABASE IF NOT EXISTS cohort12_db");
        }
    }

    private void createTables() throws SQLException {
        Class<?>[] modelClasses = {Person.class, School.class, Trainer.class};

        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement()) {

            for (Class<?> clazz : modelClasses) {
                if (clazz.isAnnotationPresent(Cohort12Table.class)) {
                    String createTableSql = SqlGenerator.getCreateTableSql(clazz);
                    stmt.executeUpdate(createTableSql);
                    System.out.println("Created table for " + clazz.getSimpleName());
                }
            }
        }
    }
}