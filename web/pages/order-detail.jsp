<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .profile-page-wrapper {
        background: #fdfafb;
        min-height: 80vh;
        padding: 60px 0;
    }

    .profile-card {
        max-width: 1000px;
        margin: 0 auto;
        background: #fff;
        border-radius: 30px;
        display: grid;
        grid-template-columns: 320px 1fr;
        overflow: hidden;
        box-shadow: 0 20px 60px rgba(151, 0, 70, 0.08);
    }

    .profile-aside {
        background: linear-gradient(180deg, #970046 0%, #e53e56 100%);
        padding: 50px 30px;
        color: #fff;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .user-avatar-large {
        width: 120px;
        height: 120px;
        background: rgba(255, 255, 255, 0.2);
        border: 4px solid rgba(255, 255, 255, 0.3);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 48px;
        font-weight: 800;
        margin-bottom: 25px;
    }

    .aside-info h2 {
        font-size: 22px;
        font-weight: 700;
        margin-bottom: 8px;
        text-align: center;
    }

    .aside-info p {
        font-size: 14px;
        opacity: 0.8;
        text-align: center;
        margin-bottom: 40px;
    }

    .aside-nav {
        width: 100%;
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .aside-link {
        display: flex;
        align-items: center;
        gap: 12px;
        padding: 14px 20px;
        border-radius: 15px;
        color: #fff;
        text-decoration: none;
        font-weight: 600;
        font-size: 15px;
        transition: all 0.3s ease;
        background: rgba(255, 255, 255, 0);
    }

    .aside-link:hover, .aside-link.active {
        background: rgba(255, 255, 255, 0.15);
        transform: translateX(5px);
    }

    .aside-link.logout {
        margin-top: 20px;
        color: #ffb3c1;
    }

    /* Detail Content */
    .profile-main {
        padding: 40px;
    }

    .back-btn {
        display: flex;
        align-items: center;
        gap: 8px;
        color: #636e72;
        text-decoration: none;
        font-weight: 700;
        font-size: 14px;
        margin-bottom: 25px;
        transition: 0.3s;
    }

    .back-btn:hover { color: #970046; transform: translateX(-5px); }

    .detail-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
    }

    .detail-header h1 {
        font-size: 24px;
        font-weight: 800;
        color: #2d3436;
    }

    .status-badge {
        padding: 8px 18px;
        border-radius: 50px;
        font-size: 13px;
        font-weight: 700;
    }

    .status-completed { background: #e8f5e9; color: #2e7d32; }
    .status-pending { background: #fff3e0; color: #ef6c00; }

    .info-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
        margin-bottom: 35px;
    }

    .info-card-box {
        background: #f8f9fa;
        padding: 20px;
        border-radius: 15px;
    }

    .info-card-box h3 {
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 1px;
        color: #636e72;
        margin-bottom: 12px;
        font-weight: 800;
    }

    .info-line {
        display: flex;
        justify-content: space-between;
        font-size: 14px;
        margin-bottom: 6px;
    }

    .info-line .label { color: #636e72; }
    .info-line .value { font-weight: 700; color: #2d3436; text-align: right; }

    /* Product List */
    .item-list {
        margin-bottom: 30px;
    }

    .order-item {
        display: flex;
        align-items: center;
        gap: 15px;
        padding: 15px 0;
        border-bottom: 1px solid #f1f2f6;
    }

    .order-item img {
        width: 70px;
        height: 70px;
        object-fit: cover;
        border-radius: 12px;
    }

    .item-info { flex: 1; }
    .item-name { font-weight: 700; color: #2d3436; font-size: 15px; margin-bottom: 4px; }
    .item-meta { font-size: 13px; color: #636e72; }

    .item-price { font-weight: 800; color: #970046; font-size: 15px; }

    .grand-total-box {
        background: #2d3436;
        color: #fff;
        padding: 20px 30px;
        border-radius: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
    }

    .grand-total-box .label { font-size: 14px; opacity: 0.8; }
    .grand-total-box .amount { font-size: 24px; font-weight: 800; color: #ffb3c1; }

    @media (max-width: 850px) {
        .profile-card { grid-template-columns: 1fr; }
        .info-grid { grid-template-columns: 1fr; }
    }
</style>

<div class="profile-page-wrapper">
    <div class="profile-card">
        <!-- Sidebar -->
        <aside class="profile-aside">
            <div class="user-avatar-large">
                ${sessionScope.user.username.substring(0, 1).toUpperCase()}
            </div>
            <div class="aside-info">
                <h2>${sessionScope.user.username}</h2>
                <p>Thành viên từ 2026</p>
            </div>

            <nav class="aside-nav">
                <a href="${pageContext.request.contextPath}/profile" class="aside-link">
                    <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-user"></use></svg> Thông tin cá nhân
                </a>
                <a href="${pageContext.request.contextPath}/order-history" class="aside-link active">
                    <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-history"></use></svg> Lịch sử mua hàng
                </a>
                <a href="${pageContext.request.contextPath}/logout" class="aside-link logout">
                    <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-logout"></use></svg> Đăng xuất
                </a>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="profile-main">
            <a href="${pageContext.request.contextPath}/order-history" class="back-btn">
                <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-arrow-back"></use></svg> Quay lại danh sách
            </a>

            <div class="detail-header">
                <h1>Đơn hàng #${order.orderId}</h1>
                <span class="status-badge ${order.status == 'Hoàn Thành' ? 'status-completed' : 'status-pending'}">
                    ${order.status}
                </span>
            </div>

            <div class="info-grid">
                <div class="info-card-box">
                    <h3>Giao hàng tới</h3>
                    <div class="info-line">
                        <span class="label">Người nhận:</span>
                        <span class="value">${order.recipientName}</span>
                    </div>
                    <div class="info-line">
                        <span class="label">Số điện thoại:</span>
                        <span class="value">${order.recipientPhone}</span>
                    </div>
                    <div class="info-line">
                        <span class="label">Địa chỉ:</span>
                        <span class="value">${order.shippingAddress}</span>
                    </div>
                </div>

                <div class="info-card-box">
                    <h3>Thanh toán</h3>
                    <div class="info-line">
                        <span class="label">Phương thức:</span>
                        <span class="value">${order.paymentMethod}</span>
                    </div>
                    <div class="info-line">
                        <span class="label">Ngày đặt:</span>
                        <span class="value"><fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm" /></span>
                    </div>
                    <div class="info-line">
                        <span class="label">Phí ship:</span>
                        <span class="value">15.000 ₫</span>
                    </div>
                </div>
            </div>

            <div class="item-list">
                <h3 style="font-size: 14px; font-weight: 800; color: #2d3436; margin-bottom: 15px; text-transform: uppercase;">Sản phẩm</h3>
                <c:forEach items="${detailList}" var="d">
                    <div class="order-item">
                        <img src="${pageContext.request.contextPath}/assets/images/products/${d.product.imageUrl}">
                        <div class="item-info">
                            <div class="item-name">${d.product.name}</div>
                            <div class="item-meta">Số lượng: ${d.quantity} x <fmt:formatNumber value="${d.unitPrice}" pattern="#,###"/> ₫</div>
                        </div>
                        <div class="item-price">
                            <fmt:formatNumber value="${d.unitPrice * d.quantity}" pattern="#,###"/> ₫
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="grand-total-box">
                <span class="label">Tổng số tiền đã thanh toán</span>
                <span class="amount"><fmt:formatNumber value="${order.totalAmount}" pattern="#,###"/> ₫</span>
            </div>
        </main>
    </div>
</div>
