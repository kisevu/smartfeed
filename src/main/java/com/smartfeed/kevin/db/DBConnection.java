package com.smartfeed.kevin.db;
/*
*
@author ameda
@project SmartFeed
*
*/

import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;

public class DBConnection {

    private static final String url="jdbc:mysql://localhost:3306/smartfeed";
    private static final String USER="root";
    private static final String PWD="rootUser@123";


    public static Connection getConnection() throws SQLException {
       try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           return DriverManager.getConnection(url,USER,PWD);
       }catch (ClassNotFoundException ex){
           throw new SQLException("JDBC Driver not found.");
       }
    }

    public static String hashPassword(String password){
        String salt = BCrypt.gensalt(12);
        return BCrypt.hashpw(password,salt);
    }

}
