<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
<%--<form action="/update-profile" method="post">--%>
<%--    <div>--%>
<%--        <p id="oldUsername">current username : ${sessionScope.user.username}</p>--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <label for="username">new username: </label>--%>
<%--        <input type="text" id="username" name="username" class="form-control" value="${sessionScope.user.username}">--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <p id="oldEmail">current email : ${sessionScope.user.email}</p>--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <label for="email">new email: </label>--%>
<%--        <input type="text" id="email" name="email" class="form-control" value="${sessionScope.user.email}">--%>
<%--    </div>--%>
<%--    --%>
<%--    <div class="form-group">--%>
<%--        <label for="currentPassword">current password: </label>--%>
<%--        <input type="password" id="currentPassword" name="currentPassword" class="form-control">--%>
<%--    </div>--%>
<%--    --%>
<%--    <div class="form-group">--%>
<%--        <label for="newPassword">new password: </label>--%>
<%--        <input type="password" id="newPassword" name="newPassword" class="form-control">--%>
<%--    </div>--%>
<%--    --%>
<%--    <div class="form-group">--%>
<%--        <label for="confirmPass">confirm password: </label>--%>
<%--        <input type="password" id="confirmPass" name="confirmPass" class="form-control">--%>
<%--    </div>--%>
<%--    <input type="submit">--%>
<%--</form>--%>
<div class="container form">
    <h1>Update Profile Information</h1>
    <hr>
    <form action="/update-profile" method="POST">
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control use" type="text" value="${user.username}">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control use" type="password" placeholder="Enter Your Current or New Password">
        </div>
        <div class="form-group">
            <label for="email">email</label>
            <input id="email" name="email" class="form-control use" type="text" value="${user.email}">
        </div>
        <input type="submit" class="btn extra btn-block" value="update">
    </form>
</div>
</body>
</html>