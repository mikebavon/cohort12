package app.utility.db;

import app.utility.bootstrap.InitBootstrap;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import jakarta.enterprise.context.ApplicationScoped;

import javax.sql.DataSource;

@InitBootstrap
@ApplicationScoped
public class DataSourceHelper {

    private static HikariDataSource dataSource;

    private static final String HOST = System.getenv("DB_HOST") != null ? System.getenv("DB_HOST") : "localhost";
    private static final int PORT = System.getenv("DB_PORT") != null ? Integer.parseInt(System.getenv("DB_PORT")) : 3306;
    private static final String DB_NAME = System.getenv("DB_NAME") != null ? System.getenv("DB_NAME") : "cohort12_db";
    private static final String USER = System.getenv("DB_USER") != null ? System.getenv("DB_USER") : "root";
    private static final String PASSWORD = System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : "";

    private DataSourceHelper() {}

    public static DataSource getDataSource() {
        if (dataSource == null) {
            synchronized (DataSourceHelper.class) {
                if (dataSource == null) {
                    HikariConfig config = new HikariConfig();

                    config.setJdbcUrl(
                        "jdbc:mysql://" + HOST + ":" + PORT + "/" + DB_NAME +
                        "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
                    );

                    config.setUsername(USER);
                    config.setPassword(PASSWORD);

                    config.setMaximumPoolSize(10);
                    config.setMinimumIdle(2);
                    config.setIdleTimeout(30000);

                    dataSource = new HikariDataSource(config);
                }
            }
        }
        return dataSource;
    }

    public static String getBaseUrlWithoutDB() {
        return "jdbc:mysql://" + HOST + ":" + PORT +
           "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    }

    public static String getDbName() {
        return DB_NAME;
    }

    public static String getUser() {
        return USER;
    }

    public static String getPassword() {
        return PASSWORD;
    }
}