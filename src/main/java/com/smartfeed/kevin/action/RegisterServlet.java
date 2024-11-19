package com.smartfeed.kevin.action;
/*
*
@author ameda
@project SmartFeed
*
*/


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // Register the JDBC driver
        } catch (ClassNotFoundException e) {
            System.out.println("An error has occurred:"+e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String profilePic = request.getParameter("profilePic");
        String coverPic = request.getParameter("coverPic");
        String bio = request.getParameter("bio");
        Connection connection = null;
        try {
            String sql = "insert into user (first_name, last_name,email,password,profilePic, coverPic, bio) VALUES (?, ?, ?, ?, ?, ?, ?)";
            connection =DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/smartfeed",
                            "root",
                            "rootUser@123");

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, first_name);
            preparedStatement.setString(2, last_name);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, password);
            preparedStatement.setString(5, profilePic);
            preparedStatement.setString(6, coverPic);
            preparedStatement.setString(7, bio);

            int rowsAffected = preparedStatement.executeUpdate();

            PrintWriter printWriter = response.getWriter();
            if (rowsAffected > 0) {
                printWriter.println("Registration was successful.");
                request.setAttribute("status","success");
                response.sendRedirect("home");

            } else {
                printWriter.println("Registration failed.");
                request.setAttribute("status","failed");
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            PrintWriter printWriter = response.getWriter();
            printWriter.println("An error occurred: " + ex.getMessage());
        } finally {
            try{
                connection.close();
            }catch (SQLException ex){
                System.out.println("An error has occurred: "+ex.getMessage());
            }
        }
    }

}
