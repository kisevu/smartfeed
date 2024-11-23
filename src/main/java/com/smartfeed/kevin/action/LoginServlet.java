package com.smartfeed.kevin.action;
/*
*
@author ameda
@project SmartFeed
*
*/


import com.smartfeed.kevin.db.DBConnection;
import com.smartfeed.kevin.models.Post;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    public LoginServlet(){}

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,
            IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        //Verify User Credentials
        try(Connection connection = DBConnection.getConnection()){
            String sql = "SELECT account_id,password FROM user WHERE email =?";
            try(PreparedStatement statement = connection.prepareStatement(sql)){
                statement.setString(1,email);
                try(ResultSet rs = statement.executeQuery()){
                    if(rs.next()){
                        String storedPassword = rs.getString("password");
                        if(BCrypt.checkpw(password,storedPassword)){
                            //Successful Login, create session
                            HttpSession session = request.getSession();
                            session.setAttribute("account_id",rs.getInt("account_id"));
                            session.setAttribute("email",email);

                            List<Post> posts = fetchPosts(); //fetch posts from the database
                            request.setAttribute("posts",posts); //set posts in request

                            response.sendRedirect("/secure/dashboard.jsp"); // redirect to secure page
                        }else{
                            response.sendRedirect("/errors/errors.jsp");
                        }
                    }else{
                        response.sendRedirect("/errors/errors.jsp");
                    }
                }
            }
        }catch (SQLException ex){
            System.out.println("An error occurred: "+ex.getMessage());
            response.sendRedirect("index.jsp?error=3");
        }

    }


    private List<Post> fetchPosts() {
        // This method should interact with the database to get all the posts
        List<Post> posts = new ArrayList<>();
        // SQL to fetch posts from database
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

                    Post post = new Post(postId, postText, media, privacySetting, submitted, userAccountId);
                    posts.add(post);
                }
            }
        } catch (SQLException e) {
            System.out.println("An error occurred: "+e.getMessage());
        }
        return posts;
    }
}
