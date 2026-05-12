<%-- 
    Document   : index
    Created on : May 8, 2026, 4:08:23 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${empty view}">
    <c:redirect url="/home" />
</c:if>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Floral Haven - Trang chủ</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600&family=Playfair+Display:wght@500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet"/>

    <link rel="stylesheet" href="assets/css/style.css"/>
</head>
<body>

    <jsp:include page="/includes/header.jsp" />

    <main id="content">
        <c:choose>
            <c:when test="${not empty view}">
                <jsp:include page="${view}" />
            </c:when>
            <c:otherwise>
                <div class="container" style="padding: 100px 0; text-align: center;">
                    <h2>Trang không tồn tại hoặc lỗi điều hướng.</h2>
                    <p>Vui lòng chọn một mục trên menu.</p>
                </div>
            </c:otherwise>
        </c:choose>
    </main>

    <jsp:include page="/includes/footer.jsp" />
    
</body>
</html>
