package com.advocatediary.config;
import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/advocate-diary";
    private static final String USER = "root";
    private static final String PASS = "";
    public static Connection initializeDatabase() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }

    // New method to get the connection (use this method instead)
    public static Connection getConnection() throws Exception {
        // You can return the connection directly by calling initializeDatabase()
        return initializeDatabase();
    }
}
