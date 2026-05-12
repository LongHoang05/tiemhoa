<%-- 
    Document   : add (Danh mục)
    Created on : May 8, 2026
    Author     : ASUS (Style by Ngọc Chi)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="admin-header">
    <div>
        <h1>Thêm danh mục mới</h1>
        <p>Floral Haven • Tạo phân loại hoa mới cho hệ thống</p>
    </div>

    <a href="${pageContext.request.contextPath}/admin/category-management" class="back-link">
        <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-arrow-back"></use></svg>
        Quay lại danh sách
    </a>
</header>

<div class="form-container">
    <div class="table-card admin-form">
        <form action="${pageContext.request.contextPath}/admin/add-category" method="POST">

            <c:if test="${not empty error}">
                <div class="admin-alert admin-alert-error">
                    <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-error"></use></svg>
                    ${error}
                </div>
            </c:if>

            <div class="form-group">
                <label>Tên danh mục hoa</label>
                <input type="text" name="name" class="admin-input" 
                       placeholder="Ví dụ: Hoa Cưới, Hoa Chúc Mừng..." required>
            </div>

            <div class="form-group">
                <label>Mô tả danh mục</label>
                <textarea name="description" class="admin-textarea" rows="5"
                          placeholder="Nhập mô tả ngắn gọn về loại danh mục này để khách hàng dễ hiểu..."></textarea>
            </div>

            <div style="display: flex; justify-content: flex-end; gap: 12px; margin-top: 32px; padding-top: 24px; border-top: 1px solid var(--border);">
                <a href="${pageContext.request.contextPath}/admin/category-management" 
                   class="action-btn" style="text-decoration: none; padding: 10px 24px; border-radius: 50px;">
                    Hủy bỏ
                </a>
                <button type="submit" class="btn-primary" style="padding: 10px 32px;">
                    <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-save"></use></svg>
                    Lưu danh mục
                </button>
            </div>
        </form>
    </div>
</div>