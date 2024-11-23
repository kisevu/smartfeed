package com.smartfeed.kevin.posts;

/*
*
@author ameda
@project SmartFeed
*
*/

import com.smartfeed.kevin.db.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet("/secure/create-post")
@MultipartConfig
public class CreatePostServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "C:/Users/ameda/Downloads/smartfeed/SmartFeed/src/main/webapp/secure/images";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String postText = request.getParameter("postText");
        String privacySetting = request.getParameter("privacySetting");
        String submitted = request.getParameter("submitted");

        // Retrieve the user account ID (e.g., from the session)
        Integer userAccountId = (Integer) request.getSession().getAttribute("account_id");
        if (userAccountId == null) {
            // Handle the case where the user is not logged in
            request.setAttribute("errorMessage", "You must be logged in to create a post.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // Handle media file upload
        Part mediaPart = request.getPart("media");
        String mediaFilePath = null;

        if (mediaPart != null && mediaPart.getSize() > 0) {
            // Generate a unique file name to avoid conflicts
            String fileName = UUID.randomUUID().toString() + "-" + mediaPart.getSubmittedFileName();
            String uploadDir = UPLOAD_DIRECTORY;

            // Ensure the upload directory exists
            File uploadDirectory = new File(uploadDir);
            if (!uploadDirectory.exists()) {
                uploadDirectory.mkdirs();
            }

            // Save the file to the server
            mediaFilePath = uploadDir + File.separator + fileName;
            mediaPart.write(mediaFilePath);  // Write the file to the specified path
            System.out.println("Executed in file upload");
        }

        // Database connection and SQL insertion
        try (Connection conn = DBConnection.getConnection()) {
            // Assuming comment_comment_id and categories_category_id can be null
            String sql = "INSERT INTO post (postText, media, privacy_setting, submitted, user_account_id, comment_comment_id, categories_category_id) "
                    + "VALUES (?, ?, ?, ?, ?, ?,?)";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, postText);
                stmt.setString(2, mediaFilePath);  // Save the file path in the database
                stmt.setString(3, privacySetting);
                stmt.setString(4, submitted);
                stmt.setInt(5, userAccountId); // Set the user_account_id
                stmt.setInt(6, 0); // Set the comment_comment_id
                stmt.setInt(7, 0); // Set the categories_category_id

                int rowsInserted = stmt.executeUpdate();

                if (rowsInserted > 0) {
                    System.out.println("Successfully executed the SQL query");
                    response.sendRedirect("dashboard.jsp"); // Redirect to the post list page
                } else {
                    request.setAttribute("errorMessage", "Error creating post.");
                    request.getRequestDispatcher("/secure/posts/create-post.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            System.out.println("An error occurred: error 2" + e.getMessage());
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/secure/posts/create-post.jsp").forward(request, response);
        }
    }
}
