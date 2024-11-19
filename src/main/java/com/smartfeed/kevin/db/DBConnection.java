package com.smartfeed.kevin.db;
/*
*
@author ameda
@project SmartFeed
*
*/

import java.sql.*;

public class DBConnection {

    public static Connection connection = null;


    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if (connection == null) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/smartfeed";
            connection = DriverManager.getConnection(url, "root", "rootUser@123");
        }
        return connection;
    }

}
