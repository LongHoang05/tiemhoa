<%-- 
    Document   : register
    Created on : May 10, 2026, 1:25:31 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/auth.css">

<div class="auth-container register">
    <div class="auth-card">
        <a href="${pageContext.request.contextPath}/home" class="auth-logo">Floral Haven</a>
        <h2 class="auth-title">Tham gia cùng chúng tôi</h2>

        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/register" method="POST" class="auth-form grid">
            <div class="auth-group compact full-width">
                <label class="auth-label">Họ và tên của bạn</label>
                <input type="text" name="username" id="username" class="auth-input" placeholder="Nguyễn Văn A" value="${oldUsername}" required>
            </div>

            <div class="auth-group compact">
                <label class="auth-label">Tên đăng nhập</label>
                <input type="text" name="loginName" id="loginName" class="auth-input" placeholder="user123" value="${oldLoginName}" required>
            </div>
            
            <div class="auth-group compact">
                <label class="auth-label">Mật khẩu</label>
                <input type="password" name="password" id="password" class="auth-input" placeholder="••••••••" required>
            </div>

            <div class="auth-group compact">
                <label class="auth-label">Email</label>
                <input type="email" name="email" id="email" class="auth-input" placeholder="vi-du@gmail.com" value="${oldEmail}" required>
            </div>

            <div class="auth-group compact">
                <label class="auth-label">Số điện thoại</label>
                <input type="tel" name="phone" id="phone" class="auth-input" placeholder="09xxxxxxxx" value="${oldPhone}" required>
            </div>

            <div class="auth-group compact full-width">
                <label class="auth-label">Địa chỉ mặc định</label>
                <input type="text" name="address" id="address" class="auth-input" placeholder="Số nhà, tên đường, quận/huyện..." value="${oldAddress}" required>
            </div>

            <button type="submit" class="btn-auth">Đăng ký thành viên</button>
            
            <div class="auth-footer">
                Bạn đã có tài khoản? 
                <a href="${pageContext.request.contextPath}/login" class="auth-link">Đăng nhập ngay</a>
            </div>
        </form>
    </div>
</div>

<script>
    window.onload = function() {
        var invalidField = "${invalidField}";
        if (invalidField) {
            var element = document.getElementById(invalidField);
            if (element) {
                element.focus();
                element.style.borderColor = "#ba1a1a";
                element.style.background = "#fff";
            }
        }
    };
</script>
