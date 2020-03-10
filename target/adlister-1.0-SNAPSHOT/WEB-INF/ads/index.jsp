<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <h1>Here Are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="ads col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <form action = "/details" method="POST">
                <button name="button" class="edit button" type=submit value="${ad.id}">Details</button>
            </form>
        </div>
    </c:forEach>
</div>

</body>
</html>
