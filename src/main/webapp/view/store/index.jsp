<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Restoran - Bootstrap Restaurant Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="./../../resource/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/resource/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/lib/owlcarousel/assets/owl.carousel.min.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
          rel="stylesheet"/>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/resource/css/style.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
</head>

<body>
<%
    String pageName = (String) request.getAttribute("page");
    String path = "";
    if (pageName != null) {
        path = "/view/store/page/" + pageName + ".jsp";
    }
%>
<div class="container-xxl bg-white p-0">
    <%@include file="/view/common/store/header.jsp" %>
    <% if(!"".equals(path)) { %>
        <jsp:include page="<%=path%>" />
    <% } %>
    <%@include file="/view/common/store/footer.jsp"%>
</div>

<!-- JavaScript Libraries -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/lib/wow/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/lib/easing/easing.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/lib/waypoints/waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/lib/counterup/counterup.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/lib/tempusdominus/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="${pageContext.request.contextPath}/resource/lib/toast/toast.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/product.js"></script>
</body>
</html>
