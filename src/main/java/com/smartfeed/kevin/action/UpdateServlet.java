package com.smartfeed.kevin.action;/*
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
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/smartfeed";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "rootUser@123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Assume user is logged in, and we have their user ID stored in the session
        int userId = (Integer) request.getSession().getAttribute("userId"); // Or get user ID from session or other source

        // SQL query to update the user details
        String sql = "UPDATE user SET first_name = ?, last_name = ?, email = ?, password = ? WHERE id = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                // Set parameters in the SQL query
                stmt.setString(1, firstName);
                stmt.setString(2, lastName);
                stmt.setString(3, email);
                stmt.setString(4, password);
                stmt.setInt(5, userId);

                // Execute the update
                int rowsUpdated = stmt.executeUpdate();

                if (rowsUpdated > 0) {
                    // Update successful, redirect or show success message
                    request.setAttribute("message", "Profile updated successfully!");
                    request.getRequestDispatcher("footer.jsp").forward(request, response);
                } else {
                    // No rows updated (shouldn't happen), show an error message
                    request.setAttribute("message", "Error updating profile.");
                    request.getRequestDispatcher("update.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            System.out.println("An error occurred: "+e.getMessage());
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.getRequestDispatcher("update.jsp").forward(request, response);
        }
    }
}
