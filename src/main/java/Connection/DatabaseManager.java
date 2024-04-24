package Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseManager {
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/cinema_ticket_megarama";
    private static final String jdbcUserName = "imane";
    private static final String jdbcPassword = "1234";
    private static final String jdbcDriver = "com.mysql.cj.jdbc.Driver";

    public static Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName(jdbcDriver);
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            throw new SQLException("error", e);
        }
        return connection;
    }
}
