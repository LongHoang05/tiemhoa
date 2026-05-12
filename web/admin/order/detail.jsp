<%-- 
    Document   : detail
    Created on : May 10, 2026, 1:13:38 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<header class="admin-header">
    <div>
        <h1>Chi tiết đơn hàng #${order.orderId}</h1>
        <p>Floral Haven • Hệ thống quản lý hoa tươi</p>
    </div>

    <div style="display: flex; gap: 12px; align-items: center;">
        <a href="${pageContext.request.contextPath}/admin/order-management" class="action-btn" style="text-decoration: none; padding: 0 20px; height: 40px; border-radius: 8px;">
            <svg class="icon" style="font-size: 20px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-arrow-back"></use></svg>
            Quay lại
        </a>
    </div>
</header>

<div class="detail-grid">
    
    <div class="table-card info-card">
        <h2>Thông tin người nhận</h2>
        <div class="info-list">
            <div class="info-item"><span class="info-label">Họ và tên:</span> <span class="info-value">${order.recipientName}</span></div>
            <div class="info-item"><span class="info-label">Số điện thoại:</span> <span class="info-value">${order.recipientPhone}</span></div>
            <div class="info-item"><span class="info-label">Địa chỉ giao:</span> <span class="info-value">${order.shippingAddress}</span></div>
            <div class="info-item"><span class="info-label">Ghi chú:</span> <span class="info-value" style="font-style: italic; font-weight: 400;">${empty order.orderNote ? 'Không có' : order.orderNote}</span></div>
        </div>
    </div>

    <div class="table-card info-card">
        <h2>Thông tin đơn hàng</h2>
        <div class="info-list">
            <div class="info-item"><span class="info-label">Ngày đặt:</span> <span class="info-value" style="font-weight: 400;"><fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm" /></span></div>
            <div class="info-item"><span class="info-label">Thanh toán:</span> <span class="info-value">${order.paymentMethod}</span></div>
            <div class="info-item">
                <span class="info-label">Trạng thái:</span> 
                <span class="status-badge" style="width: fit-content;">
                    ${order.status}
                </span>
            </div>
            <div class="info-item" style="margin-top: 8px;">
                <span class="info-label">Tổng giá trị:</span> 
                <span class="info-value price">
                    <fmt:formatNumber value="${order.totalAmount}" pattern="#,###"/> ₫
                </span>
            </div>
        </div>
    </div>
</div>

<div class="table-card">
    <div class="table-title">
        <h2>Sản phẩm đã đặt</h2>
    </div>

    <table>
        <thead class="admin-table-header">
            <tr>
                <th style="padding-left: 24px; text-align: left;">Hình ảnh & Sản phẩm</th>
                <th style="text-align: center;">Số lượng</th>
                <th style="text-align: right;">Đơn giá</th>
                <th style="padding-right: 24px; text-align: right;">Thành tiền</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${detailList}" var="d">
                <tr>
                    <td style="padding-left: 24px; display: flex; align-items: center; gap: 16px;">
                        <c:choose>
                            <c:when test="${not empty d.product.imageUrl}">
                                <img src="${pageContext.request.contextPath}/assets/images/products/${d.product.imageUrl}" alt="${d.product.name}" style="width: 60px; height: 60px; object-fit: cover; border-radius: 8px; border: 1px solid var(--border);">
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/assets/images/default_flower.jpg" alt="No Image" style="width: 60px; height: 60px; object-fit: cover; border-radius: 8px; border: 1px solid var(--border);">
                            </c:otherwise>
                        </c:choose>
                        
                        <span style="font-weight: 600; color: var(--text-main);">${d.product.name}</span>
                    </td>
                    
                    <td style="text-align: center; font-weight: 600; color: var(--text-main);">
                        ${d.quantity}
                    </td>
                    
                    <td style="text-align: right; color: var(--text-muted);">
                        <fmt:formatNumber value="${d.unitPrice}" pattern="#,###"/> ₫
                    </td>
                    
                    <td style="padding-right: 24px; text-align: right; font-weight: 700; color: var(--primary);">
                        <fmt:formatNumber value="${d.unitPrice * d.quantity}" pattern="#,###"/> ₫
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <div class="table-footer-total">
        <span class="label">Khách phải thanh toán:</span>
        <span class="value">
            <fmt:formatNumber value="${order.totalAmount}" pattern="#,###"/> ₫
        </span>
    </div>
</div>