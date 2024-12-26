<%@ page import="com.example.milkteaweb.entity.Category" %>
<%@ page import="com.example.milkteaweb.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Category> categories = (List<Category>) request.getAttribute("categories");
    List<Product> products = (List<Product>) request.getAttribute("products");
%>

<!-- Popular item start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
            <h5 class="section-title ff-secondary text-center text-primary fw-normal">Food Menu</h5>
            <h1 class="mb-5">Sản phẩm bán chạy</h1>
        </div>
        <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">

            <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">

                <% for (int i = 0; i < categories.size(); i++) {
                    Category category = categories.get(i);
                %>

                <li class="nav-item">

                    <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 <%= i == 0 ? "active" : "" %>"
                       data-bs-toggle="pill"
                       href="#tab-<%= category.getId() %>">
                        <%= category.getSymbol() %>
                        <div class="ps-3">
                            <small class="text-body"><%= category.getName() %>
                            </small>
                            <h6 class="mt-n1 mb-0"><%= category.getName() %>
                            </h6>
                        </div>
                    </a>
                </li>
                <% } %>

            </ul>

            <div class="tab-content">
                <% for (int i = 0; i < categories.size(); i++) {
                    Category category = categories.get(i);
                %>
                <div id="tab-<%= category.getId() %>" class="tab-pane fade show p-0 <%= i == 0 ? "active" : "" %>">
                    <div class="row g-4">

                        <% for (Product product : products) { %>
                        <% if (product.getCategoryId() == category.getId()) { %>
                        <div class="col-lg-6">
                            <div class="d-flex align-items-center">
                                <img class="flex-shrink-0 img-fluid rounded"
                                     src="<%=product.getImage()%>" alt=""
                                     style="width: 80px;">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <h5 class="d-flex justify-content-between border-bottom pb-2">
                                        <span><%=product.getName()%></span>
                                        <span class="text-primary"><%=product.getPrice()%> VNĐ</span>
                                    </h5>
                                    <div class="d-flex justify-content-between">
                                        <small class="fst-italic"><%=product.getDescription()%>
                                        </small>
                                        <button onclick="addToCart(<%=product.toJson()%>)" class="btn btn-dark">Thêm vào
                                            giỏ
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% } %>
                        <% } %>
                    </div>
                </div>

                <% } %>

            </div>
        </div>
    </div>
</div>
<!-- Popular item end -->