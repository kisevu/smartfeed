package com.smartfeed.kevin.action;
/*
*
@author ameda
@project SmartFeed
*
*/


import com.smartfeed.kevin.db.DBConnection;
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
}
