package com.smartfeed.kevin.action;/*
*
@author ameda
@project SmartFeed
*
*/

import com.smartfeed.kevin.models.User;

import java.io.IOException;
import java.nio.file.attribute.UserPrincipal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/smartfeed";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "rootUser@123";


    // Method to get user data from the database
    private User getUserData(int account_id) {
        User user = null;

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT * FROM user WHERE account_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, account_id);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    user = User.builder()
                            .account_id(rs.getInt("account_id"))
                            .first_name(rs.getString("first_name"))
                            .last_name(rs.getString("last_name"))
                            .email(rs.getString("email"))
                            .bio(rs.getString("bio"))
                            .build();
                }
            }
        } catch (Exception e) {
            System.out.println("Error message: "+e.getMessage());
        }

        return user;
    }

    // Method to update user data in the database
    private boolean updateUserData(int account_id, String first_name, String last_name, String email, String bio) {
        boolean success = false;

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "UPDATE user SET first_name = ?, last_name = ?, email = ?, bio = ? WHERE account_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, first_name);
                stmt.setString(2, last_name);
                stmt.setString(3, email);
                stmt.setString(4, bio);
                stmt.setInt(5, account_id);  // The user's ID is used to find the correct record to update

                int rowsUpdated = stmt.executeUpdate();
                success = rowsUpdated > 0;
            }
        } catch (Exception e) {
            System.out.println("Error Message: "+e.getMessage());
        }

        return success;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Assume the user ID is stored in the session
        HttpSession session = request.getSession();
        int account_id = (int) session.getAttribute("account_id"); // Replace with actual user ID from session

        // Retrieve user data from the database
        User user = getUserData(account_id);

        // Set user data as a request attribute to pass it to the JSP
        request.setAttribute("user", user);

        // Forward to the update.jsp page
        request.getRequestDispatcher("update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get updated information from the form
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email_address");
        String bio = request.getParameter("bio");

        // Assume the user ID is stored in the session
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("user_id"); // Replace with actual user ID from session

        // Update the user's data in the database
        boolean isUpdated = updateUserData(userId, firstName, lastName, email, bio);

        // If update is successful, redirect to the profile page or show a success message
        if (isUpdated) {
            response.sendRedirect("profile.jsp"); // Redirect to the profile page
        } else {
            request.setAttribute("errorMessage", "Error updating the profile.");
            request.getRequestDispatcher("update.jsp").forward(request, response);
        }
    }
}
