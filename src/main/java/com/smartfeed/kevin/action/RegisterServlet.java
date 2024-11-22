package com.smartfeed.kevin.action;
/*
*
@author ameda
@project SmartFeed
*
*/


import com.smartfeed.kevin.db.DBConnection;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {


    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException,
            IOException {

        String first_name = req.getParameter("first_name");
        String last_name = req.getParameter("last_name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String profilePic = req.getParameter("profilePic");
        String coverPic = req.getParameter("coverPic");
        String bio = req.getParameter("bio");

        String hashedPassword = DBConnection.hashPassword(password);

        //save user in database
        try (Connection connection = DBConnection.getConnection()) {
            String sql = "insert into user (first_name, last_name,email,password,profilePic, coverPic, bio) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = connection.prepareStatement(sql)) {
                stmt.setString(1, first_name);
                stmt.setString(2, last_name);
                stmt.setString(3, email);
                stmt.setString(4, hashedPassword);
                stmt.setString(5, profilePic);
                stmt.setString(6, coverPic);
                stmt.setString(7, bio);

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    //redirect to login page after successful registration
                    res.sendRedirect("login.jsp");
                } else {
                    res.sendRedirect("register.jsp?error=1");
                }
            }
        } catch (SQLException ex) {
            System.out.println("An error occurred: " + ex.getMessage());
            res.sendRedirect("register.jsp?error=2");
        }
    }

}