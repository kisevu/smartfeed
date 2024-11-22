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

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {


    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException,
            IOException{
        String email = req.getParameter("email");
        String password = req.getParameter("password");


        //verify credentials

        try(Connection connection = DBConnection.getConnection()){
            String sql = "SELECT account_id, password FROM user WHERE email = ?";
            try(PreparedStatement statement = connection.prepareStatement(sql)){
                statement.setString(1,email);
                try(ResultSet resultSet = statement.executeQuery()){
                    if(resultSet.next()){
                        String storedHashedPassword = resultSet.getString("password");
                        if(BCrypt.checkpw(password,storedHashedPassword)){
                            //Successful login, create session
                            HttpSession session = req.getSession();
                            session.setAttribute("account_id",resultSet.getInt("account_id"));
                            session.setAttribute("email",email);
                            res.sendRedirect("index.jsp"); //redirect to secure page
                        }else{
                            res.sendRedirect("/errors/errors.jsp");
                        }
                    }else{
                        res.sendRedirect("/errors/errors.jsp"); //user cannot be found
                    }
                }
            }
        }catch (SQLException ex){
            System.out.println("An error occurred: "+ex.getMessage());
            res.sendRedirect("/errors/errors.jsp");
        }
    }


}
