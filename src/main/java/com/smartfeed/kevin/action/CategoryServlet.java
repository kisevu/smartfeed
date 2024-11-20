package com.smartfeed.kevin.action;/*
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

@WebServlet("/add-category")
public class CategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // Register the JDBC driver
        } catch (ClassNotFoundException e) {
            System.out.println("An error has occurred:"+e.getMessage());
        }
    }


    protected void doPost(HttpServletRequest req,
                          HttpServletResponse res)
            throws ServletException,
            IOException {
        String category_name = req.getParameter("category_name");
        String category_description = req.getParameter("category_description");

        Connection con = null;
        try{
            String sql = "insert into categories(category_name, category_description) VALUES (?,?)";
            con = DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/smartfeed",
                            "root",
                            "rootUser@123");
            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, category_name);
            preparedStatement.setString(2, category_description);
            int rowsAffected = preparedStatement.executeUpdate();
            PrintWriter printWriter = res.getWriter();
            if (rowsAffected > 0) {
                printWriter.println("Category added successfully.");
                req.setAttribute("status","success");
                res.sendRedirect("index.jsp");

            } else {
                printWriter.println("Category population failed..");
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
