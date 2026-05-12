<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<header class="admin-header">
    <div>
        <h1>Chi tiết khách hàng</h1>
        <p>Xem thông tin cá nhân và lịch sử mua hàng của ${customer.username}</p>
    </div>
    <a href="${pageContext.request.contextPath}/admin/customer-management" class="back-link">
        <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-arrow-back"></use></svg> Quay lại danh sách
    </a>
</header>

<div style="display: grid; grid-template-columns: 350px 1fr; gap: 24px; align-items: start;">
    <!-- Cột trái: Thông tin cá nhân -->
    <div class="table-card" style="padding: 24px; text-align: center;">
        <div class="user-avatar-large">
            ${customer.username.substring(0,1).toUpperCase()}
        </div>
        <h2 style="margin: 0; font-size: 20px; color: var(--text-main);">${customer.username}</h2>
        <p style="color: var(--text-muted); margin: 4px 0 20px;">@${customer.loginName}</p>
        
        <div style="text-align: left; border-top: 1px solid var(--border); padding-top: 20px;">
            <div style="margin-bottom: 16px;">
                <label style="display: block; font-size: 12px; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 4px;">Email</label>
                <div style="font-weight: 500;">${customer.email}</div>
            </div>
            <div style="margin-bottom: 16px;">
                <label style="display: block; font-size: 12px; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 4px;">Số điện thoại</label>
                <div style="font-weight: 500;">${customer.phone}</div>
            </div>
            <div style="margin-bottom: 20px;">
                <label style="display: block; font-size: 12px; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 4px;">Địa chỉ mặc định</label>
                <div style="font-weight: 500; font-size: 14px; line-height: 1.4;">${customer.address}</div>
            </div>
            
            <c:choose>
                <c:when test="${customer.status == 1}">
                    <a href="${pageContext.request.contextPath}/admin/toggle-customer-status?id=${customer.userId}&status=1" 
                       onclick="return confirm('Bạn có chắc muốn KHÓA tài khoản này?')"
                       class="admin-alert admin-alert-error"
                       style="display: flex; align-items: center; justify-content: center; gap: 8px; width: 100%; text-decoration: none; font-weight: 600;">
                        <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-block"></use></svg> Khóa tài khoản
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/admin/toggle-customer-status?id=${customer.userId}&status=0" 
                       onclick="return confirm('Mở khóa tài khoản này?')"
                       class="admin-alert admin-alert-success"
                       style="display: flex; align-items: center; justify-content: center; gap: 8px; width: 100%; text-decoration: none; font-weight: 600;">
                        <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-success"></use></svg> Mở khóa tài khoản
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- Cột phải: Lịch sử mua hàng -->
    <div class="table-card">
        <div class="table-title" style="display: flex; justify-content: space-between; align-items: center;">
            <h3 style="margin: 0; font-size: 16px; font-weight: 700;">Lịch sử đơn hàng</h3>
            <span class="status-badge">
                ${orderList.size()} Đơn hàng
            </span>
        </div>
        
        <table>
            <thead class="admin-table-header">
                <tr>
                    <th style="padding-left: 24px; text-align: left;">Mã ĐH</th>
                    <th style="text-align: left;">Ngày đặt</th>
                    <th style="text-align: left;">Tổng tiền</th>
                    <th style="text-align: left;">Trạng thái</th>
                    <th style="padding-right: 24px; text-align: right;">Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${orderList}" var="o">
                    <tr>
                        <td style="padding-left: 24px; font-weight: 700; color: var(--primary);">#${o.orderId}</td>
                        <td style="color: var(--text-muted); font-size: 13px;">
                            <fmt:formatDate value="${o.createdAt}" pattern="dd/MM/yyyy HH:mm" />
                        </td>
                        <td style="font-weight: 700;">
                            <fmt:formatNumber value="${o.totalAmount}" pattern="#,###"/> ₫
                        </td>
                        <td>
                            <span class="status-badge">
                                ${o.status}
                            </span>
                        </td>
                        <td style="padding-right: 24px; text-align: right;">
                            <a href="${pageContext.request.contextPath}/admin/order-detail?id=${o.orderId}" class="action-btn">
                                <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-view"></use></svg>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty orderList}">
                    <tr>
                        <td colspan="5" style="text-align: center; padding: 48px; color: var(--text-muted);">
                            <svg class="icon" style="font-size: 48px; display: block; margin-bottom: 12px; opacity: 0.3;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-bag"></use></svg>
                            Khách hàng này chưa thực hiện đơn hàng nào.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>
