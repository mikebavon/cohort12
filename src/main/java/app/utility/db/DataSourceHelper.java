package app.utility.db;

import app.utility.bootstrap.InitBootstrap;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import jakarta.enterprise.context.ApplicationScoped;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

@InitBootstrap
@ApplicationScoped
public class DataSourceHelper {

    private static volatile HikariDataSource dataSource;

    private final String HOST = "localhost";
    private final int PORT = 3306;
    private final String DB_NAME = "training_app";
    private final String USER = "root";
    private final String PASSWORD = "";

    public DataSource getDataSource() {
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

    public Connection getConnection() throws SQLException {
        return this.getDataSource().getConnection();
    }

    public String getBaseUrlWithoutDB() {
        return "jdbc:mysql://" + HOST + ":" + PORT +
           "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    }

    public String getDbName() {
        return DB_NAME;
    }

    public String getUser() {
        return USER;
    }

    public String getPassword() {
        return PASSWORD;
    }
}