package com.example.milkteaweb.servlet;

import com.example.milkteaweb.dao.CategoryDao;
import com.example.milkteaweb.dao.ProductDao;
import com.example.milkteaweb.dao.impl.CategoryDaoImpl;
import com.example.milkteaweb.dao.impl.ProductDaoImpl;
import com.mysql.cj.util.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = {"/home", "/product", "/cart", "/search"})
public class RouterServlet extends HttpServlet {

    private final CategoryDao categoryDao = new CategoryDaoImpl();
    private final ProductDao productDao = new ProductDaoImpl();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean error = false;
        
        String uri = req.getRequestURI();
        System.out.println(uri);
        switch (uri) {
            case "/home":
            case "/milk-tea-web/home":
                req.setAttribute("categories", categoryDao.findAll());
                req.setAttribute("products", productDao.findAll());
                req.setAttribute("page", "home");
                break;
            case "/product":
            case "/milk-tea-web/product":
                String keySearch = req.getParameter("key");
                req.setAttribute("categories", categoryDao.findAll());
                req.setAttribute("products", productDao.find(keySearch));
                req.setAttribute("page", "product");
                req.setAttribute("keySearch", StringUtils.isNullOrEmpty(keySearch) ? "" : keySearch);
                break;
            case "/cart":
            case "/milk-tea-web/cart":
                req.setAttribute("page", "cart");
                break;
            default:
                error = true;
        }

        if (!error) {
            req.getRequestDispatcher("/view/store/index.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
