<%-- 
    Document   : login
    Created on : May 10, 2026, 1:25:04 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/auth.css">

<div class="auth-container">
    <div class="auth-card">
        <a href="${pageContext.request.contextPath}/home" class="auth-logo">Floral Haven</a>
        <h2 class="auth-title">Chào mừng trở lại</h2>

        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>
        
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="POST" class="auth-form">
            <div class="auth-group">
                <label class="auth-label">Tên đăng nhập</label>
                <input type="text" name="loginName" class="auth-input" placeholder="Nhập tài khoản của bạn..." required autofocus>
            </div>
            
            <div class="auth-group">
                <label class="auth-label">Mật khẩu</label>
                <input type="password" name="password" class="auth-input" placeholder="••••••••" required>
            </div>

            <button type="submit" class="btn-auth">Đăng nhập ngay</button>
        </form>

        <div class="auth-footer">
            Bạn chưa có tài khoản? 
            <a href="${pageContext.request.contextPath}/register" class="auth-link">Đăng ký tại đây</a>
        </div>
    </div>
</div>
