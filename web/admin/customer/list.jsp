<%-- 
    Document   : list
    Created on : May 10, 2026, 4:35:30 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="admin-header">
    <div>
        <h1>Danh sách khách hàng</h1>
        <p>Floral Haven • Quản lý người dùng hệ thống</p>
    </div>
</header>

<div class="table-card">
    <div class="table-toolbar">
        <div class="toolbar-search">
            <c:set var="searchPlaceholder" value="Tìm theo tên hoặc SĐT..." scope="request" />
            <jsp:include page="/admin/includes/search-box.jsp" />
        </div>
    </div>

    <table>
        <thead class="admin-table-header">
            <tr>
                <th style="text-align: left;">ID</th>
                <th style="text-align: left;">Tên hiển thị</th>
                <th style="text-align: left;">Tên đăng nhập</th>
                <th style="text-align: left;">Liên hệ</th>
                <th style="text-align: left;">Địa chỉ</th>
                <th style="text-align: center;">Trạng thái</th>
                <th style="text-align: right;">Thao tác</th>
            </tr>
        </thead>
        <tbody id="customerTableBody">
            <c:forEach items="${customerList}" var="c">
                <tr>
                    <td style="font-weight: 700; color: var(--primary);">#${c.userId}</td>
                    <td style="font-weight: 600; color: var(--text-main);">${c.username}</td>
                    <td style="color: var(--text-muted);">${c.loginName}</td>
                    <td>
                        <div style="font-size: 13px;">${c.email}</div>
                        <div style="font-size: 13px; color: var(--text-muted);">${c.phone}</div>
                    </td>
                    <td style="font-size: 13px; max-width: 200px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                        ${c.address}
                    </td>
                    <td style="text-align: center;">
                        <c:choose>
                            <c:when test="${c.status == 1}">
                                <span class="status-badge success">ĐANG HOẠT ĐỘNG</span>
                            </c:when>
                            <c:otherwise>
                                <span class="status-badge error">BỊ KHÓA</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td style="text-align: right;">
                        <div style="display: flex; justify-content: flex-end; gap: 8px;">
                            <a href="${pageContext.request.contextPath}/admin/customer-detail?id=${c.userId}" class="action-btn" title="Xem chi tiết">
                                <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-view"></use></svg>
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/toggle-customer-status?id=${c.userId}&status=${c.status}" 
                               class="action-btn delete" 
                               title="${c.status == 1 ? 'Khóa tài khoản' : 'Mở khóa tài khoản'}"
                               onclick="return confirm('${c.status == 1 ? 'Khóa tài khoản này?' : 'Mở khóa tài khoản này?'}')">
                                <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-${c.status == 1 ? 'block' : 'lock-open'}"></use></svg>
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty customerList}">
                <tr>
                    <td colspan="7" style="text-align: center; padding: 40px; color: var(--text-muted);">
                        Chưa có khách hàng nào tham gia hệ thống.
                    </td>
                </tr>
            </c:if>
        </tbody>
    </table>

    <div id="paginationContainer" class="admin-pagination-container">
        <jsp:include page="/includes/pagination.jsp" />
    </div>
</div>

<script>
    initAdminSearch('searchInput', null, 'customerTableBody', '/admin/search-customer', '${pageContext.request.contextPath}');
</script>
