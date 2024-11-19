package com.smartfeed.kevin.action;
/*
*
@author ameda
@project SmartFeed
*
*/

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    public LoginServlet(){}

    protected void doPost(HttpServletRequest request,HttpServletRequest response)throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;


        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/kevin","root","rootUser@123");
            PreparedStatement preparedStatement =
                    connection.prepareStatement("select * from user where email = ? and password = ?");
            preparedStatement.setString(1,email);
            preparedStatement.setString(2,password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                session.setAttribute("first_name",resultSet.getString("first_name"));
                dispatcher = request.getRequestDispatcher("index.jsp");
            }else {
                request.setAttribute("status","failed");
                dispatcher = request.getRequestDispatcher("login.jsp");
            }
        }catch (Exception ex){
            System.out.println("An error has occurred: "+ex.getMessage());
        }
    }
}
