package com.example.milkteaweb.servlet.auth;

import com.example.milkteaweb.dao.UserDao;
import com.example.milkteaweb.dao.impl.UserDaoImpl;
import com.example.milkteaweb.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() {
        userDao = new UserDaoImpl();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        // Get users from database
        List<User> users = userDao.findAll();

        // set attribute request
        request.setAttribute("users", users);

        request.getRequestDispatcher("/view/auth/register.jsp")
                .forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // handle register
        // handle login check username va password tu database
        // lay du lieu tu param cua request
        String firstName = request.getParameter("first-name");
        String lastName = request.getParameter("last-name");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        // Đóng gói dữ liệu -> MODEL
        User user = new User();

        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);
        user.setPhone(phone);

        // Lưu user vào database -> DAO: data access object
       userDao.insert(user);

        // Get users from database
        List<User> users = userDao.findAll();

        // set attribute request
        request.setAttribute("users", users);

        request.getRequestDispatcher("/view/auth/login.jsp")
                .forward(request, response);
    }
}
