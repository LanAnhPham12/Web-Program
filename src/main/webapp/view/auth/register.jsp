
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="./../../resource/css/base.css" rel="stylesheet"  />
</head>
<body>
<c:set var="users" value="${requestScope.get('users')}"/>

<div class="container">
    <div class="h1 text-center">Register</div>

    <form id="form-register"
          action="${pageContext.request.contextPath}/register"
          method="post"
    >

        <div class="mb-3">
            <label for="first-name" class="form-label">First Name</label>
            <input type="text"
                   class="form-control"
                   id="first-name"
                   aria-describedby="emailHelp"
                   name="first-name"
            >
            <span class="error"></span>
        </div>


        <div class="mb-3">
            <label for="last-name" class="form-label">Last Name</label>
            <input type="text"
                   class="form-control"
                   id="last-name"
                   aria-describedby="emailHelp"
                   name="last-name"
            >
            <span class="error"></span>
        </div>


        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="text"
                   class="form-control"
                   id="email"
                   aria-describedby="emailHelp"
                   name="email"
            >
            <span class="error"></span>
        </div>


        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text"
                   class="form-control"
                   id="username"
                   aria-describedby="emailHelp"
                   name="username"
            >
            <span class="error"></span>
        </div>


        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password"
                   class="form-control"
                   id="password"
                   aria-describedby="emailHelp"
                   name="password"
            >
            <span class="error"></span>
        </div>


        <div class="mb-3">
            <label for="re-password" class="form-label">Confirm password</label>
            <input type="password" class="form-control"
                   id="re-password"
                   aria-describedby="emailHelp"
                   name="re-password"
            >
            <span class="error"></span>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
        <a href="${pageContext.request.contextPath}/login" type="button" class="btn btn-info">Back to login</a>
    </form>

    <div class="h2">User list</div>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">No</th>
            <th scope="col">First name</th>
            <th scope="col">Last name</th>
            <th scope="col">Email</th>
            <th scope="col">Username</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="user" items="${users}" varStatus="loop">
            <tr>
                <th scope="row">${loop.index + 1}</th>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.email}</td>
                <td>${user.username}</td>
            </tr>
        </c:forEach>

        </tbody>
    </table>

</div>
<script src="./../../resource/js/validator.js"></script>
<script src="./../../resource/js/register.js"></script>
</body>
</html>
