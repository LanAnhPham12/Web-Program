package com.example.milkteaweb.servlet.auth;

import com.example.milkteaweb.dao.UserDao;
import com.example.milkteaweb.dao.impl.UserDaoImpl;
import com.example.milkteaweb.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() {
        userDao = new UserDaoImpl();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/view/auth/login.jsp")
                .forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // handle login flow

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Optional<User> userOptional = userDao.login(username, password);

        if (userOptional.isPresent()) {
            // redirect to home
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", userOptional.get());
            response.sendRedirect("/home");
        } else {
            // set attribute request
            request.setAttribute("error", "Wrong username or password");

            request.getRequestDispatcher("/view/auth/login.jsp")
                    .forward(request, response);
        }

    }
}
