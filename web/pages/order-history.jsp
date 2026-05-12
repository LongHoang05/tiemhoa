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

    /* Main Content */
    .profile-main {
        padding: 50px;
    }

    .section-title {
        display: flex;
        align-items: center;
        gap: 15px;
        margin-bottom: 35px;
    }

    .section-title h1 {
        font-size: 26px;
        font-weight: 800;
        color: #2d3436;
    }

    .section-title .icon-box {
        width: 45px;
        height: 45px;
        background: #fff0f3;
        color: #e53e56;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .history-table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0 10px;
    }

    .history-table th {
        text-align: left;
        padding: 10px 20px;
        font-size: 13px;
        color: #636e72;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    .history-table tr td {
        background: #f8f9fa;
        padding: 20px;
        font-size: 14px;
        color: #2d3436;
    }

    .history-table tr td:first-child {
        border-radius: 15px 0 0 15px;
        font-weight: 800;
    }

    .history-table tr td:last-child {
        border-radius: 0 15px 15px 0;
    }

    .status-pill {
        padding: 6px 14px;
        border-radius: 50px;
        font-size: 12px;
        font-weight: 700;
    }

    .status-pill.completed { background: #e8f5e9; color: #2e7d32; }
    .status-pill.pending { background: #fff3e0; color: #ef6c00; }

    .btn-detail {
        color: #970046;
        text-decoration: none;
        font-weight: 700;
        display: flex;
        align-items: center;
        gap: 5px;
        transition: 0.2s;
    }

    .btn-detail:hover {
        color: #e53e56;
        transform: scale(1.05);
    }

    @media (max-width: 850px) {
        .profile-card { grid-template-columns: 1fr; }
        .profile-aside { padding: 40px 20px; }
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
            <div class="section-title">
                <div class="icon-box">
                    <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-bag"></use></svg>
                </div>
                <h1>Lịch sử mua hàng</h1>
            </div>

            <div style="overflow-x: auto;">
                <table class="history-table">
                    <thead>
                        <tr>
                            <th>Mã đơn</th>
                            <th>Ngày đặt</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${orderHistory}" var="o">
                            <tr>
                                <td>#${o.orderId}</td>
                                <td><fmt:formatDate value="${o.createdAt}" pattern="dd/MM/yyyy" /></td>
                                <td style="color: #970046; font-weight: 700;">
                                    <fmt:formatNumber value="${o.totalAmount}" pattern="#,###"/> ₫
                                </td>
                                <td>
                                    <span class="status-pill ${o.status == 'Hoàn Thành' ? 'completed' : 'pending'}">
                                        ${o.status}
                                    </span>
                                </td>
                                <td style="text-align: right;">
                                    <a href="${pageContext.request.contextPath}/order-detail?id=${o.orderId}" class="btn-detail">
                                        Chi tiết <svg class="icon" style="font-size: 16px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-arrow-forward"></use></svg>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty orderHistory}">
                            <tr>
                                <td colspan="5" style="text-align: center; padding: 60px; color: #b2bec3; background: none;">
                                    Bạn chưa có đơn hàng nào.
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>
