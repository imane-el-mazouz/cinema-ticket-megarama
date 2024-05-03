package com.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseManager {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/cinema_ticket_megarama";
    private static final String JDBC_USERNAME = "imane";
    private static final String JDBC_PASSWORD = "1234";
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";

    private DatabaseManager() {}

    static {
        try {
            Class.forName(JDBC_DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
    }
}
