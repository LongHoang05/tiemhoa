<%-- 
    Document   : product-management
    Created on : May 7, 2026
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<header class="admin-header">
    <div>
        <h1>Quản lý sản phẩm</h1>
        <p>Floral Haven • Hệ thống quản lý hoa tươi</p>
    </div>

    <div style="display: flex; gap: 12px; align-items: center;">
        <a href="${pageContext.request.contextPath}/admin/add-product?page=${currentPage}&filter=${selectedCategoryId}" class="btn-primary" style="height: 40px; padding: 0 20px; text-decoration: none;">
            <svg class="icon" style="font-size: 20px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-add"></use></svg>
            Thêm sản phẩm
        </a>
    </div>
</header>

<div class="table-card">
    <div class="table-toolbar">
        <jsp:include page="/admin/includes/search-box.jsp">
            <jsp:param name="placeholder" value="Nhập từ khóa cần tìm..." />
        </jsp:include>

        <select id="categoryFilter" class="admin-select" style="width: auto;" 
                onchange="location.href='${pageContext.request.contextPath}/admin/product-management?filter=' + this.value">
            <option value="">Tất cả danh mục</option>
            <c:forEach items="${categoryList}" var="c">
                <option value="${c.categoryId}" ${c.categoryId == selectedCategoryId ? 'selected' : ''}>${c.name}</option>
            </c:forEach>
        </select>
    </div>

    <table>
        <thead class="admin-table-header">
            <tr>
                <th>Hình ảnh</th>
                <th>Thông tin sản phẩm</th>
                <th>Danh mục</th>
                <th>Giá bán</th>
                <th style="text-align: center;">Số lượng</th>
                <th style="text-align: right;">Thao tác</th>
            </tr>
        </thead>
        <tbody id="productTableBody">
            <c:forEach items="${productList}" var="p">
                <tr>
                    <td style="width: 150px;">
                        <c:choose>
                            <c:when test="${not empty p.imageUrl}">
                                <img class="product-img" src="${pageContext.request.contextPath}/assets/images/products/${p.imageUrl}" alt="${p.name}" style="width: 60px; height: 60px;">
                            </c:when>
                            <c:otherwise>
                                <img class="product-img" src="${pageContext.request.contextPath}/assets/images/default_flower.jpg" alt="No Image" style="width: 60px; height: 60px;">
                            </c:otherwise>
                        </c:choose>
                    </td>

                    <td>
                        <div style="font-weight: 600; color: var(--text-main);">${p.name}</div>
                    </td>

                    <td>
                        <c:forEach items="${categoryList}" var="c">
                            <c:if test="${c.categoryId == p.categoryId}">
                                <span class="status-badge primary">
                                    ${c.name}
                                </span>
                            </c:if>
                        </c:forEach>
                    </td>

                    <td>
                        <span style="font-weight: 700; color: var(--primary);"><fmt:formatNumber value="${p.price}" pattern="#,###"/> ₫</span>
                    </td>

                    <td style="text-align: center;">
                        <c:choose>
                            <c:when test="${p.stockQuantity <= 0}">
                                <span style="color: var(--error); font-weight: bold;">Hết hàng</span>
                            </c:when>
                            <c:otherwise>${p.stockQuantity}</c:otherwise>
                        </c:choose>
                    </td>

                    <td style="text-align: right;">
                        <div style="display: flex; justify-content: flex-end; gap: 8px;">
                            <a href="${pageContext.request.contextPath}/admin/edit-product?id=${p.productId}&page=${currentPage}&filter=${selectedCategoryId}" class="action-btn" title="Chỉnh sửa">
                                <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-edit"></use></svg>
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/delete-product?id=${p.productId}&page=${currentPage}&filter=${selectedCategoryId}" 
                               class="action-btn delete" 
                               title="Xóa" 
                               onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này khỏi danh sách không?');">
                                <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-delete"></use></svg>
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
    // Tham số: id search, id filter, id tbody, url servlet, contextPath
    // Chỉ dùng AJAX cho ô tìm kiếm (searchInput), bộ lọc danh mục đã chuyển sang reload trang để có phân trang
    initAdminSearch('searchInput', null, 'productTableBody', '/admin/search-product', '${pageContext.request.contextPath}');
</script>