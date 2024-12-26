package com.example.milkteaweb.filter;

import com.example.milkteaweb.entity.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpReq = (HttpServletRequest) request;
        HttpServletResponse httpRes = (HttpServletResponse) response;

        HttpSession session = httpReq.getSession();
        User currentUser = (User)session.getAttribute("currentUser");

        if (currentUser == null) {
            httpRes.sendRedirect("/login");    //redirect to LoginServlet
        } else {
            chain.doFilter(request, response);
        }
    }
}
