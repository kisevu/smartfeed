package com.smartfeed.kevin.action;/*
*
@author ameda
@project SmartFeed
*
*/

import com.smartfeed.kevin.db.DBConnection;
import com.smartfeed.kevin.models.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/secure/update")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private User getUserData(int account_id) {
        User user = null;
        try (Connection conn = DBConnection.getConnection()) {
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
            System.out.println("Error message: " + e.getMessage());
        }
        return user;
    }

    private boolean updateUserData(int account_id, String first_name, String last_name, String email, String bio) {
        boolean success = false;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE user SET first_name = ?, last_name = ?, email = ?, bio = ? WHERE account_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, first_name);
                stmt.setString(2, last_name);
                stmt.setString(3, email);
                stmt.setString(4, bio);
                stmt.setInt(5, account_id);

                System.out.println("Executing update for user ID: " + account_id);
                int rowsUpdated = stmt.executeUpdate();
                System.out.println("Rows updated: " + rowsUpdated);
                success = rowsUpdated > 0;
            }
        } catch (Exception e) {
            System.out.println("Error updating user: " + e.getMessage());
        }
        return success;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        HttpSession session = request.getSession();
        int account_id = (int) session.getAttribute("account_id");
        System.out.println("Session account_id: " + account_id);
        User user = getUserData(account_id);
        request.setAttribute("user", user);
        System.out.println(user.getLast_name()+" "+user.getBio());
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String bio = request.getParameter("bio");

        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("account_id");
        System.out.println("Received data: First Name = " + first_name + ", Last Name = " + last_name);

        boolean isUpdated = updateUserData(userId, first_name, last_name, email, bio);

        if (isUpdated) {
            response.sendRedirect("profile.jsp");
        } else {
            request.setAttribute("errorMessage", "Error updating profile.");
            request.getRequestDispatcher("update.jsp").forward(request, response);
        }
    }
}
