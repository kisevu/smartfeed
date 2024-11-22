package com.smartfeed.kevin.security;
/*
*
@author ameda
@project SmartFeed
*
*/

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/secure/*")
public class AuthenticationFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String path = httpRequest.getRequestURI();

        // Allow login and registration pages to be accessed without being logged in
        if (path.endsWith("index.jsp") || path.endsWith("register.jsp") || path.endsWith("login") || path.endsWith("register")) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = httpRequest.getSession(false);

        // If no session or account_id is not found, redirect to login page
        if (session == null || session.getAttribute("account_id") == null) {
            ((HttpServletResponse) response).sendRedirect("../index.jsp"); //redirect to login if not authenticated
        } else {
            chain.doFilter(request, response); // User is authenticated, continue with the request
        }
    }

    public void init(FilterConfig fConfig) throws ServletException{}
    public void destroy(){}
}
