package com.smartfeed.kevin.action;/*
*
@author ameda
@project SmartFeed
*
*/

import com.smartfeed.kevin.models.Settings;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/settings")
public class SettingsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req,
                         HttpServletResponse res) throws ServletException,
            IOException {
        String notificationsParam = req.getParameter("notifications");
        boolean isOn = notificationsParam != null && notificationsParam.equalsIgnoreCase("true");
        boolean isOff = notificationsParam != null && notificationsParam.equalsIgnoreCase("false");

        Settings settings = Settings.builder()
                .email(req.getParameter("email"))
                .last_name(req.getParameter("last_name"))
                .first_name(req.getParameter("first_name"))
                .theme(req.getParameter("theme"))
                .notifications((isOn)||(isOff)) // will persist whether the notification is on or off
                .build();

        //set settings as request attribute to be used in JSP
        req.setAttribute("settings",settings);

        //forward to the jsp page
        req.getRequestDispatcher("/settings.jsp").forward(req,res);
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Get values from form input
        String notificationsParam = req.getParameter("notifications");
        boolean isOn = notificationsParam != null && notificationsParam.equalsIgnoreCase("true");
        boolean isOff = notificationsParam != null && notificationsParam.equalsIgnoreCase("false");


        // Update settings object (this could also be saved to a database)
        Settings settings = Settings.builder()
                .email(req.getParameter("email"))
                .last_name(req.getParameter("last_name"))
                .first_name(req.getParameter("first_name"))
                .theme(req.getParameter("theme"))
                .notifications((isOn)||(isOff)) // will persist whether the notification is on or off
                .build();

        // Set updated settings as request attribute to be displayed
        req.setAttribute("settings", settings);

        // Forward to the same page to show updated settings
        req.getRequestDispatcher("/settings.jsp").forward(req, res);
    }

}
