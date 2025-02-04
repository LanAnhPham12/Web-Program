<%@ page import="com.example.milkteaweb.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Spinner Start -->
<div id="spinner"
     class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
        <span class="sr-only">Loading...</span>
    </div>
</div>
<!-- Spinner End -->
<%
    User user = (User) session.getAttribute("currentUser");
    String pageNameHeader = (String) request.getAttribute("page");
%>

<!-- Navbar & Hero Start -->
<div class="container-xxl position-relative p-0">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0"
         style="<%= !"home".equals(pageNameHeader) ? "background: var(--dark) !important" : "" %>"
    >
        <a href="" class="navbar-brand p-0">
            <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>Restoran</h1>
            <!-- <img src="img/logo.png" alt="Logo"> -->
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="fa fa-bars"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto py-0 pe-4">
                <a href="${pageContext.request.contextPath}/home" class="nav-item nav-link active">Trang chủ</a>
                <a href="${pageContext.request.contextPath}/product" class="nav-item nav-link">Sản phẩm</a>
                <a href="${pageContext.request.contextPath}/cart" class="nav-item nav-link">Giỏ hàng</a>
                <a href="#" class="nav-item nav-link">Nhượng quyền</a>
                <a href="service.html" class="nav-item nav-link">Service</a>
            </div>
        </div>

        <% if (user != null) { %>
        <div class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Xin chào <%=user.getUsername()%>
            </a>
            <div class="dropdown-menu m-0">
                <a href="${pageContext.request.contextPath}/logout" class="dropdown-item">Đăng xuất</a>
            </div>
        </div>
        <% } else { %>
        <a href="${pageContext.request.contextPath}/register" class="nav-item nav-link">Đăng ký</a>
        <a href="${pageContext.request.contextPath}/login" class="btn btn-primary py-2 px-4">Đăng nhập</a>
<% } %>
</nav>

<% if ("home".equals(pageNameHeader)) { %>
<div class="container-xxl py-5 bg-dark hero-header mb-5">
    <div class="container my-5 py-5">
        <div class="row align-items-center g-5">
            <div class="col-lg-6 text-center text-lg-start">
                <h1 class="display-3 text-white animated slideInLeft">Enjoy Our<br>Delicious Meal</h1>
                <p class="text-white animated slideInLeft mb-4 pb-2">Tempor erat elitr rebum at clita. Diam dolor
                    diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem
                    sit clita duo justo magna dolore erat amet</p>
                <a href="" class="btn btn-primary py-sm-3 px-sm-5 me-3 animated slideInLeft">Book A Table</a>
            </div>
            <div class="col-lg-6 text-center text-lg-end overflow-hidden">
                <img class="img-fluid" src="img/hero.png" alt="">
            </div>
        </div>
    </div>
</div>
<% } %>
<!-- Navbar & Hero End -->