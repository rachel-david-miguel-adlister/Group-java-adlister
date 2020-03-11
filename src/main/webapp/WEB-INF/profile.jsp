<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <h5>${sessionScope.user.email}</h5><a href="/update-profile">edit</a>

    </div>

    <div class="container">
        <h2>Here are your ads:</h2>

        <c:forEach var="ad" items="${ads}">
            <div class="ads col-md-6">
                <h2>${ad.title}</h2>
                <p>${ad.description}</p>
                <form action = "/details" method="POST">
                    <button name="button" class="edit" type=submit value="${ad.id}">Details</button>
                </form>
                <form action = "/delete" method="POST">
                    <button name="deleteButton" class="delete" type=submit value="${ad.id}">delet dis</button>
                </form>
            </div>
        </c:forEach>
    </div>

</body>
</html>
