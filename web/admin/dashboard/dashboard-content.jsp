<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<header class="admin-header">
    <div>
        <h1>Tổng quan hệ thống</h1>
        <p>Chào mừng trở lại! Đây là tóm tắt hoạt động kinh doanh của Floral Haven.</p>
    </div>
    <div style="display: flex; gap: 12px;">
        <div class="status-badge" style="background: #fff; border: 1px solid var(--border); font-weight: 500;">
            Hôm nay: <fmt:formatDate value="<%= new java.util.Date() %>" pattern="dd/MM/yyyy" />
        </div>
    </div>
</header>

<div class="stat-grid">
    <!-- Revenue -->
    <div class="stat-card">
        <div class="stat-icon icon-revenue">
            <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-revenue"></use></svg>
        </div>
        <div class="stat-info">
            <h3>Tổng doanh thu</h3>
            <span class="value"><fmt:formatNumber value="${totalRevenue}" pattern="#,###"/> ₫</span>
        </div>
    </div>

    <!-- Orders -->
    <div class="stat-card">
        <div class="stat-icon icon-orders">
            <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-cart"></use></svg>
        </div>
        <div class="stat-info">
            <h3>Đơn hàng</h3>
            <span class="value">${totalOrders}</span>
        </div>
    </div>

    <!-- Customers -->
    <div class="stat-card">
        <div class="stat-icon icon-customers">
            <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-group"></use></svg>
        </div>
        <div class="stat-info">
            <h3>Khách hàng</h3>
            <span class="value">${totalCustomers}</span>
        </div>
    </div>

    <!-- Products -->
    <div class="stat-card">
        <div class="stat-icon icon-products">
            <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-product"></use></svg>
        </div>
        <div class="stat-info">
            <h3>Sản phẩm</h3>
            <span class="value">${totalProducts}</span>
        </div>
    </div>
</div>

<div style="display: grid; grid-template-columns: 2fr 1fr; gap: 24px;">
    <!-- Recent Orders -->
    <div class="table-card">
        <div class="table-title" style="display: flex; justify-content: space-between; align-items: center;">
            <h2>Đơn hàng mới nhất</h2>
            <a href="${pageContext.request.contextPath}/admin/order-management" style="font-size: 13px; color: var(--primary); text-decoration: none; font-weight: 600;">Xem tất cả</a>
        </div>
        <table>
            <thead class="admin-table-header">
                <tr>
                    <th style="padding-left: 24px; text-align: left;">Mã ĐH</th>
                    <th style="text-align: left;">Khách hàng</th>
                    <th style="text-align: left;">Tổng tiền</th>
                    <th style="text-align: left;">Trạng thái</th>
                    <th style="padding-right: 24px; text-align: right;">Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${recentOrders}" var="o">
                    <tr>
                        <td style="padding-left: 24px; font-weight: 700; color: var(--primary);">#${o.orderId}</td>
                        <td>
                            <div style="font-weight: 600;">${o.recipientName}</div>
                            <div style="font-size: 12px; color: var(--text-muted);">${o.recipientPhone}</div>
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
                <c:if test="${empty recentOrders}">
                    <tr>
                        <td colspan="5" style="text-align: center; padding: 40px; color: var(--text-muted);">
                            Chưa có đơn hàng nào.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

    <!-- Inventory / Stats / Quick Links -->
    <div style="display: flex; flex-direction: column; gap: 24px;">
        <!-- Top Selling Products -->
        <div class="table-card">
            <div class="table-title">
                <h2>Top hoa bán chạy</h2>
            </div>
            <div style="padding: 16px;">
                <c:forEach items="${topSellingProducts}" var="p">
                    <div style="display: flex; align-items: center; gap: 12px; padding: 10px 0; border-bottom: 1px solid var(--border);">
                        <img src="${pageContext.request.contextPath}/assets/images/products/${p.imageUrl}" style="width: 44px; height: 44px; object-fit: cover; border-radius: 8px;">
                        <div style="flex: 1;">
                            <div style="font-size: 13px; font-weight: 600; color: var(--text-main);">${p.name}</div>
                            <div style="font-size: 12px; color: var(--text-muted);"><fmt:formatNumber value="${p.price}" pattern="#,###"/> ₫</div>
                        </div>
                        <div style="text-align: right;">
                            <span class="status-badge success" style="font-size: 11px;">Bán chạy</span>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty topSellingProducts}">
                    <div style="text-align: center; color: var(--text-muted); padding: 20px; font-size: 13px;">Chưa có dữ liệu bán hàng.</div>
                </c:if>
            </div>
        </div>

        <!-- Recent Contacts -->
        <div class="table-card">
            <div class="table-title" style="display: flex; justify-content: space-between; align-items: center;">
                <h2>Phản hồi mới nhất</h2>
                <a href="${pageContext.request.contextPath}/admin/feedback" style="font-size: 12px; color: var(--primary); text-decoration: none; font-weight: 600;">Xem tất cả</a>
            </div>
            <div style="padding: 16px;">
                <c:forEach items="${recentContacts}" var="c">
                    <div style="padding: 10px 0; border-bottom: 1px solid var(--border);">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 4px;">
                            <span style="font-size: 13px; font-weight: 700; color: var(--text-main);">${c.senderName}</span>
                            <span style="font-size: 11px; color: var(--text-muted);"><fmt:formatDate value="${c.createdAt}" pattern="dd/MM HH:mm" /></span>
                        </div>
                        <div style="font-size: 12px; color: var(--primary); font-weight: 600; margin-bottom: 2px;">${c.subject}</div>
                        <div style="font-size: 12px; color: var(--text-muted); display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; line-height: 1.4;">
                            ${c.message}
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty recentContacts}">
                    <div style="text-align: center; color: var(--text-muted); padding: 20px; font-size: 13px;">Không có phản hồi mới.</div>
                </c:if>
            </div>
        </div>
    </div>
</div>
