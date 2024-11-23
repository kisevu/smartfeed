package com.smartfeed.kevin.action;
/*
*
@author ameda
@project SmartFeed
*
*/

import com.smartfeed.kevin.db.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/secure/create-group")
public class GroupServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        // Retrieve form parameters
        String group_name = request.getParameter("group_name");
        String group_description = request.getParameter("group_description");
        String group_type = request.getParameter("group_type");
        boolean isAdmin = request.getParameter("isAdmin") != null && request.getParameter("isAdmin").equals("1");
        System.out.println("Executing near");
        // Database connection and SQL to insert data
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO groups_tbl (group_name, group_description, group_type, isAdmin) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, group_name);
                stmt.setString(2, group_description);
                stmt.setString(3, group_type);
                stmt.setBoolean(4, isAdmin);
                System.out.println("Executed already");
                // Execute the update query
                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    response.sendRedirect("groups.jsp"); // Redirect to a page after successful insertion
                } else {
                    response.getWriter().println("Error creating group.");
                }
            } catch (SQLException e) {
                response.getWriter().println("Error: " + e.getMessage());
            }
        } catch (SQLException e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }




}
