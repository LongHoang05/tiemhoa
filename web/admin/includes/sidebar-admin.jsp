<%-- 
    Document   : sidebar-admin
    Created on : May 7, 2026, 5:37:34 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="sidebar">
    <div class="sidebar-header">
        <div class="logo-icon">
            HF
        </div>
        <div class="logo-text">
            <h1>Haven Flora</h1>
            <p>Quản lý cửa hàng</p>
        </div>
    </div>

    <div class="sidebar-content">
        <div class="menu-section" style="margin-bottom: 0;">
            <a class="menu-item ${contentPage == '/admin/dashboard-content.jsp' ? 'active' : ''}" 
               href="${pageContext.request.contextPath}/admin/dashboard">
                <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-dashboard"></use></svg> <span>Tổng quan</span>
            </a>
            <a class="menu-item ${fn:startsWith(contentPage, '/admin/order/') ? 'active' : ''}" 
               href="${pageContext.request.contextPath}/admin/order-management">
                <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-cart"></use></svg> <span>Đơn hàng</span>
            </a>
            <a class="menu-item ${fn:startsWith(contentPage, '/admin/product/') ? 'active' : ''}" 
               href="${pageContext.request.contextPath}/admin/product-management">
                <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-product"></use></svg> <span>Sản phẩm</span>
            </a>
            <a class="menu-item ${fn:startsWith(contentPage, '/admin/category/') ? 'active' : ''}" 
               href="${pageContext.request.contextPath}/admin/category-management">
                <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-category"></use></svg> <span>Danh mục hoa</span>
            </a>
            <a class="menu-item ${fn:startsWith(contentPage, '/admin/customer/') ? 'active' : ''}" 
               href="${pageContext.request.contextPath}/admin/customer-management">
                <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-group"></use></svg> <span>Khách hàng</span>
            </a>
            <a class="menu-item ${fn:startsWith(contentPage, '/admin/feedback/') ? 'active' : ''}" 
               href="${pageContext.request.contextPath}/admin/feedback">
                <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-mail"></use></svg> <span>Phản hồi</span>
            </a>
        </div>
    </div>

    <div class="sidebar-footer">
        <div class="user-profile">
            <div class="user-avatar">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        ${fn:substring(sessionScope.user.username, 0, 1)}${fn:substring(fn:split(sessionScope.user.username, ' ')[fn:length(fn:split(sessionScope.user.username, ' '))-1], 0, 1)}
                    </c:when>
                    <c:otherwise>AD</c:otherwise>
                </c:choose>
            </div>
            <div class="user-info">
                <p class="user-name">
                    <c:out value="${not empty sessionScope.user ? sessionScope.user.username : 'Quản trị viên'}" />
                </p>
                <p class="user-role">Quản trị viên</p>
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="logout-btn" title="Đăng xuất">
                <svg class="icon" style="font-size: 20px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-logout"></use></svg>
            </a>
        </div>
    </div>
</nav>
