package com.example.milkteaweb.servlet;

import com.example.milkteaweb.dao.CategoryDao;
import com.example.milkteaweb.dao.OrderDao;
import com.example.milkteaweb.dao.OrderDetailDao;
import com.example.milkteaweb.dao.impl.CategoryDaoImpl;
import com.example.milkteaweb.dao.impl.OrderDaoImpl;
import com.example.milkteaweb.dao.impl.OrderDetailDaoImpl;
import com.example.milkteaweb.dto.CartDto;
import com.example.milkteaweb.dto.CartItemDto;
import com.example.milkteaweb.entity.*;
import com.example.milkteaweb.util.ServletHelper;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

@WebServlet(value = {"/cart/add-product", "/cart/minus-product", "/cart/del-item", "/cart/payment"})
public class CartServlet extends HttpServlet {
    private ObjectMapper mapper;
    private final CategoryDao categoryDao = new CategoryDaoImpl();
    private List<Category> categories = new ArrayList<>();
    private User user = null;
    private final OrderDao ordersDao = new OrderDaoImpl();
    private final OrderDetailDao orderDetailDao = new OrderDetailDaoImpl();

    @Override
    public void init() {
        categories = categoryDao.findAll();
        mapper = new ObjectMapper();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        user = (User) session.getAttribute("currentUser");

        String uri = req.getRequestURI();
        switch (uri) {
            case "/cart/add-product":
            case "/milk-tea-web/cart/add-product":
                addToCart(req, resp);
                break;
            case "/cart/minus-product":
            case "/milk-tea-web/cart/minus-product":
                minusToCart(req, resp);
                break;
            case "/cart/del-item":
            case "/milk-tea-web/cart/del-product":
                delCartItem(req, resp);
                break;
            case "/cart/payment":
            case "/milk-tea-web/cart/payment":
                payment(req, resp);
                break;
            default:
        }
    }

    public void addToCart(HttpServletRequest req, HttpServletResponse resp) {

        try {
            Product product = mapper.readValue(req.getInputStream(), Product.class);

            if (product == null) {
                ServletHelper.returnResp(resp, 500);
                return;
            }

            HttpSession session = req.getSession();
            CartDto cart = (CartDto) session.getAttribute("cart");
            if (Objects.isNull(cart) || Objects.isNull(cart.getItems())) {
                CartItemDto item = new CartItemDto();
                item.setProduct(product);
                item.setQuantity(1);

                cart = new CartDto();
                List<CartItemDto> items = new ArrayList<>();
                items.add(item);
                cart.setItems(items);
            } else {
                AtomicReference<CartItemDto> itemDto = new AtomicReference<>(null);

                .cart.getItems().forEach(item -> {
                    if (item.getProduct().getId() == product.getId()) {
                        itemDto.set(item);
                        item.setQuantity(item.getQuantity() + 1);
                    }
                });

                if (itemDto.get() == null) {
                    CartItemDto item = new CartItemDto();
                    item.setProduct(product);
                    item.setQuantity(1);
                    cart.getItems().add(item);
                }
            }
            setCart(cart, req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            ServletHelper.returnResp(resp, 500);
        }
    }

    public void minusToCart(HttpServletRequest req, HttpServletResponse resp) {

        try {
            Product product = mapper.readValue(req.getInputStream(), Product.class);
            CartDto cart = getCart(req);
            if (product == null || cart == null) {
                ServletHelper.returnResp(resp, 500);
                return;
            }

            Iterator<CartItemDto> iterator = cart.getItems().iterator();
            while (iterator.hasNext()) {
                CartItemDto item = iterator.next();
                if (item.getProduct().getId() == product.getId()) {
                    if (item.getQuantity() > 1) {
                        item.setQuantity(item.getQuantity() - 1);
                    } else {
                        iterator.remove();
                    }
                }
            }

            setCart(cart, req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            ServletHelper.returnResp(resp, 500);
        }
    }

    private void delCartItem(HttpServletRequest req, HttpServletResponse resp) {
        try {
            Product product = mapper.readValue(req.getInputStream(), Product.class);
            CartDto cart = getCart(req);
            if (product == null || cart == null) {
                ServletHelper.returnResp(resp, 500);
                return;
            }

            cart.getItems().removeIf(item -> item.getProduct().getId() == product.getId());
            setCart(cart, req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            ServletHelper.returnResp(resp, 500);
        }
    }

    private void payment(HttpServletRequest req, HttpServletResponse resp) {
        try {
            CartDto cartDto = mapper.readValue(req.getInputStream(), CartDto.class);

            CartDto cart = getCart(req);
            if (cart == null) {
                ServletHelper.returnResp(resp, 500);
                return;
            }

            cart.setPhone(cartDto.getPhone());
            cart.setAddress(cartDto.getAddress());
            cart.setReceiver(cartDto.getReceiver());

            // save order
            Orders orders = new Orders();
            orders.setAddress(cart.getAddress());
            orders.setPhone(cart.getPhone());
            orders.setReceiver(cart.getReceiver());
            orders.setShipFee(cart.getShipFee());
            orders.setTotalPrice(cart.getTotalPrice());

            ordersDao.insert(orders);

            // save order detail
            List<OrderDetail> orderDetails = cart.getItems().stream().map(item -> {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderId(orders.getId());
                orderDetail.setQuantity(item.getQuantity());
                orderDetail.setProductId(item.getProduct().getId());
                orderDetail.setCategoryId(item.getCategory().getId());
                return orderDetail;
            }).collect(Collectors.toList());
            orderDetailDao.saveAll(orderDetails);

            HttpSession session = req.getSession();
            session.setAttribute("cart", new CartDto());

            ServletHelper.returnResp(resp, 200);
        } catch (Exception e) {
            e.printStackTrace();
            ServletHelper.returnResp(resp, 500);
        }
    }

    private CartDto getCart(HttpServletRequest req) {
        HttpSession session = req.getSession();
        CartDto cart = (CartDto) session.getAttribute("cart");

        if (Objects.isNull(cart) || Objects.isNull(cart.getItems())) {
            return null;
        }
        return cart;
    }

    private void setCart(CartDto cart, HttpServletRequest req, HttpServletResponse resp) {
        if (user == null) {
            user = new User();
        }

        cart.getItems().forEach(item -> item.setCategory(getByPro(item.getProduct())));
        cart.setShipFee(cart.getItems().isEmpty() ? 0 : 20_000);

        double total = cart.getItems().stream()
                .mapToDouble(item -> item.getQuantity() * item.getProduct().getPrice().doubleValue())
                .reduce(0, Double::sum);

        cart.setTotalPrice(total);
        cart.setPhone(user.getPhone() == null ? "" : user.getPhone());
        cart.setReceiver(user.getFirstName() + " " + user.getLastName());

        HttpSession session = req.getSession();
        session.setAttribute("cart", cart);
        ServletHelper.returnResp(resp, 200);
    }

    private Category getByPro(Product product) {
        return categories.stream().filter(c -> c.getId() == product.getCategoryId()).findAny().orElse(null);
    }
}
