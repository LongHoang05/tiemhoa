<%-- 
    Document   : list
    Created on : May 10, 2026, 12:53:34 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<header class="admin-header">
    <div>
        <h1>Quản lý đơn hàng</h1>
        <p>Floral Haven • Hệ thống quản lý hoa tươi</p>
    </div>
</header>

<c:if test="${not empty sessionScope.toastMsg}">
    <div class="admin-alert admin-alert-success">
        ${sessionScope.toastMsg}
    </div>
    <c:remove var="toastMsg" scope="session" />
</c:if>

<div class="table-card">
    <div class="table-toolbar">
        <jsp:include page="/admin/includes/search-box.jsp">
            <jsp:param name="placeholder" value="Nhập mã ĐH hoặc tên khách..." />
        </jsp:include>

        <select id="statusFilter" class="admin-select" style="width: auto;">
            <option value="">Tất cả trạng thái</option>
            <option value="Chờ xử lý">Chờ xử lý</option>
            <option value="Đang giao">Đang giao</option>
            <option value="Hoàn thành">Hoàn thành</option>
            <option value="Đã hủy">Đã hủy</option>
        </select>
    </div>

    <table>
        <thead class="admin-table-header">
            <tr>
                <th style="text-align: left;">Mã ĐH</th>
                <th style="text-align: left;">Thông tin người nhận</th>
                <th style="text-align: left;">Ngày đặt</th>
                <th style="text-align: left;">Tổng tiền</th>
                <th style="text-align: left;">Trạng thái</th>
                <th style="text-align: right;">Thao tác</th>
            </tr>
        </thead>
        <tbody id="orderTableBody">
            <c:forEach items="${orderList}" var="o">
                <tr>
                    <td style="font-weight: 700; color: var(--primary);">
                        #${o.orderId}
                    </td>

                    <td>
                        <div style="font-weight: 600; color: var(--text-main);">${o.recipientName}</div>
                        <div style="font-size: 13px; color: var(--text-muted); margin-top: 2px;">${o.recipientPhone}</div>
                    </td>

                    <td style="color: var(--text-muted);">
                        <fmt:formatDate value="${o.createdAt}" pattern="dd/MM/yyyy HH:mm" />
                    </td>

                    <td>
                        <span style="font-weight: 700; color: var(--error);"><fmt:formatNumber value="${o.totalAmount}" pattern="#,###"/> ₫</span>
                    </td>

                    <td>
                        <span class="status-badge">
                            ${o.status}
                        </span>
                    </td>

                    <td style="text-align: right;">
                        <div style="display: flex; justify-content: flex-end; gap: 8px;">
                            <a href="${pageContext.request.contextPath}/admin/order-detail?id=${o.orderId}" class="action-btn" title="Xem chi tiết">
                                <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-view"></use></svg>
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty orderList}">
                <tr>
                    <td colspan="6" style="text-align: center; padding: 40px; color: var(--text-muted);">
                        Hệ thống chưa ghi nhận đơn hàng nào.
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
    initAdminSearch('searchInput', 'statusFilter', 'orderTableBody', '/admin/search-order', '${pageContext.request.contextPath}');
</script>