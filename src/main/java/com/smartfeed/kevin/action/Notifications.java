package com.smartfeed.kevin.action;
/*
*
@author ameda
@project SmartFeed
*
*/

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/notifications")
public class Notifications extends HttpServlet {

    // JDBC Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/smartfeed";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "rootUser@123";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<String> categories = new ArrayList<>();

        // Connect to the database and fetch categories
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT name FROM categories";  // Query to get category names
            try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
                while (rs.next()) {
                    categories.add(rs.getString("name"));
                }
            }
        } catch (Exception e) {
            System.out.println("An error occurred"+e.getMessage() );
            request.setAttribute("error", "Error fetching categories: " + e.getMessage());
        }

        // Forward the categories to the JSP page
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/category.jsp").forward(request, response);
    }
}
