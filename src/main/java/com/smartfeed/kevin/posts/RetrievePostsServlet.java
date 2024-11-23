package com.smartfeed.kevin.posts;
/*
*
@author ameda
@project SmartFeed
*
*/

import com.smartfeed.kevin.db.DBConnection;
import com.smartfeed.kevin.models.Post;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/secure/view-all-posts")
public class RetrievePostsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Post> posts = new ArrayList<>();

        // Database connection and SQL query to retrieve all posts
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT post_id, postText, media, privacy_setting, submitted, user_account_id FROM post";
            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int postId = rs.getInt("post_id");
                    String postText = rs.getString("postText");
                    String media = rs.getString("media");
                    String privacySetting = rs.getString("privacy_setting");
                    String submitted = rs.getString("submitted");
                    int userAccountId = rs.getInt("user_account_id");


                    Post post = Post.builder()
                            .postId(postId)
                            .postText(postText)
                            .media(media)
                            .privacySetting(privacySetting)
                            .submitted(submitted)
                            .user_account_id(userAccountId)
                            .build();
                    posts.add(post);
                }
            }
        } catch (SQLException e) {
            System.out.println("An error occurred: "+e.getMessage());
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
        }

        // Forward posts to JSP for display
        request.setAttribute("posts", posts);
        posts.forEach(System.out::println);
        request.getRequestDispatcher("/secure/dashboard.jsp").forward(request, response);
    }

}
