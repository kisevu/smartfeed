package com.smartfeed.kevin.action;
/*
*
@author ameda
@project SmartFeed
*
*/

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //invalidate session

        try{
            HttpSession session = request.getSession();
            if(session!=null){
                session.invalidate();
            }
            response.sendRedirect("login.jsp");
        }catch (Exception ex){
            System.out.println("Error occurred: "+ex.getMessage());
        }

    }
}
