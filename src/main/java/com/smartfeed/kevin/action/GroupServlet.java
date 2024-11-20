package com.smartfeed.kevin.action;
/*
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
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/create-group")
public class GroupServlet extends HttpServlet {

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // Register the JDBC driver
        } catch (ClassNotFoundException e) {
            System.out.println("An error has occurred:"+e.getMessage());
        }
    }

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req,
                          HttpServletResponse res)
            throws ServletException,
            IOException{
        String group_name = req.getParameter("group_name");
        String group_description = req.getParameter("group_description");
        String group_type = req.getParameter("group_type");
        boolean isAdmin = Boolean.parseBoolean(req.getParameter("isAdmin"));

        Connection con = null;
        try{
            String sql = "insert into group (group_name, group_description,group_type,isAdmin) VALUES (?, ?, ?, ?)";
            con = DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/smartfeed",
                            "root",
                            "rootUser@123");
            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, group_name);
            preparedStatement.setString(2, group_description);
            preparedStatement.setString(3, group_type);
            preparedStatement.setString(4, String.valueOf(isAdmin));
            int rowsAffected = preparedStatement.executeUpdate();
            PrintWriter printWriter = res.getWriter();
            if (rowsAffected > 0) {
                printWriter.println("Group added successfully.");
                req.setAttribute("status","success");
                res.sendRedirect("index");

            } else {
                printWriter.println("Group population failed..");
                req.setAttribute("status","failed");
            }
        }catch (Exception ex){
            System.out.println(ex.getMessage());
            PrintWriter printWriter = res.getWriter();
            printWriter.println("An error occurred: " + ex.getMessage());
        } finally {
            try{
                con.close();
            }catch (SQLException ex){
                System.out.println("An error has occurred: "+ex.getMessage());
            }
        }
    }




}
