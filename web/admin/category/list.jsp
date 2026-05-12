<%-- 
    Document   : list (Danh mục)
    Created on : May 8, 2026
    Author     : ASUS (Style by Ngọc Chi)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="admin-header">
    <div>
        <h1>Quản lý danh mục</h1>
        <p>Floral Haven • Hệ thống quản lý hoa tươi</p>
    </div>

    <div style="display: flex; gap: 12px; align-items: center;">
        <a href="${pageContext.request.contextPath}/admin/add-category" class="btn-primary" style="height: 40px; padding: 0 20px; text-decoration: none;">
            <svg class="icon" style="font-size: 20px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-add"></use></svg>
            Thêm danh mục
        </a>
    </div>
</header>

<div class="table-card">
    <div class="table-toolbar">
        <div class="toolbar-search">
            <c:set var="searchPlaceholder" value="Nhập tên danh mục..." scope="request" />
            <jsp:include page="/admin/includes/search-box.jsp" />
        </div>
    </div>

    <table>
        <thead class="admin-table-header">
            <tr>
                <th style="width: 250px;">Tên danh mục</th>
                <th>Mô tả chi tiết</th>
                <th style="text-align: center; width: 200px;">Số lượng sản phẩm</th>
                <th style="text-align: right; width: 120px;">Thao tác</th>
            </tr>
        </thead>
        <tbody id="categoryTableBody">
            <c:forEach items="${categoryList}" var="c">
                <tr>
                    <td>
                        <div style="font-weight: 600; color: var(--text-main);">${c.name}</div>
                        <div style="font-size: 12px; color: var(--text-muted); margin-top: 2px;">ID: #${c.categoryId}</div>
                    </td>
                    <td>
                        <span style="font-size: 14px; color: var(--text-muted); line-height: 1.5; display: inline-block; max-width: 450px;">
                            ${c.description}
                        </span>
                    </td>
                    <td style="text-align: center;">
                        <span style="font-weight: 500; color: var(--text-main);">
                            ${c.productCount}
                        </span>
                    </td>
                    <td style="text-align: right;">
                        <div style="display: flex; justify-content: flex-end; gap: 8px;">
                            <a href="${pageContext.request.contextPath}/admin/edit-category?id=${c.categoryId}" class="action-btn" title="Sửa">
                                <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-edit"></use></svg>
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/delete-category?id=${c.categoryId}" 
                               class="action-btn delete" 
                               onclick="return confirm('Xóa danh mục này có thể ảnh hưởng đến sản phẩm. Bạn chắc chứ?')" title="Xóa">
                                <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-delete"></use></svg>
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <div id="paginationContainer" class="admin-pagination-container">
        <jsp:include page="/includes/pagination.jsp" />
    </div>
</div>

<script>
// id input: 'searchInput', id filter: null, id tbody: 'categoryTableBody', url xử lý: '/admin/search-category'
    initAdminSearch('searchInput', null, 'categoryTableBody', '/admin/search-category', '${pageContext.request.contextPath}');
</script>