<%-- 
    Document   : edit
    Created on : May 8, 2026, 2:32:55 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="admin-header">
    <div>
        <h1>Sửa thông tin danh mục</h1>
        <p>Cập nhật lại tên hoặc mô tả cho loại hoa này</p>
    </div>

    <a href="${pageContext.request.contextPath}/admin/category-management" class="back-link">
        <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-arrow-back"></use></svg>
        Quay lại danh sách
    </a>
</header>

<div class="form-container">
    <div class="table-card admin-form">
        <form action="${pageContext.request.contextPath}/admin/edit-category" method="POST">

            <input type="hidden" name="categoryId" value="${category.categoryId}">

            <c:if test="${not empty error}">
                <div class="admin-alert admin-alert-error">
                    <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-error"></use></svg>
                    ${error}
                </div>
            </c:if>

            <div class="form-group">
                <label>Tên danh mục hoa</label>
                <input type="text" name="name" class="admin-input" 
                       value="${category.name}" required>
            </div>

            <div class="form-group">
                <label>Mô tả danh mục</label>
                <textarea name="description" class="admin-textarea" rows="5">${category.description}</textarea>
            </div>

            <div style="display: flex; justify-content: flex-end; gap: 12px; margin-top: 32px; padding-top: 24px; border-top: 1px solid var(--border);">
                <a href="${pageContext.request.contextPath}/admin/category-management" 
                   class="action-btn" style="text-decoration: none; padding: 10px 24px; border-radius: 50px;">
                    Hủy bỏ
                </a>
                <button type="submit" class="btn-primary" style="padding: 10px 32px;">
                    <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-save"></use></svg>
                    Cập nhật
                </button>
            </div>
        </form>
    </div>
</div>
