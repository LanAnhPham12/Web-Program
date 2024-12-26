package com.example.milkteaweb.util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlHelper {

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        String hostName = "localhost";
        String dbName = "milk_tea_shop";
        String userName = "root";
        String password = "123456";

        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://" + hostName + ":3306/" + dbName + "?allowPublicKeyRetrieval=true&useSSL=false", userName, password);
    }
}
