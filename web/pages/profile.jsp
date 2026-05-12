<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    .form-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 30px;
        margin-bottom: 25px;
    }

    .input-wrapper {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }

    .input-wrapper label {
        font-size: 13px;
        font-weight: 700;
        color: #636e72;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .custom-input {
        padding: 14px 18px;
        background: #f8f9fa;
        border: 2px solid #f1f2f6;
        border-radius: 12px;
        font-size: 15px;
        color: #2d3436;
        font-weight: 500;
        transition: 0.3s;
    }

    .custom-input:focus {
        border-color: #ffb3c1;
        background: #fff;
        outline: none;
        box-shadow: 0 0 0 4px rgba(229, 62, 86, 0.05);
    }

    .custom-input:disabled {
        background: #f1f2f6;
        cursor: not-allowed;
        color: #b2bec3;
    }

    .update-btn {
        background: #970046;
        color: #fff;
        border: none;
        padding: 16px 40px;
        border-radius: 15px;
        font-size: 16px;
        font-weight: 700;
        cursor: pointer;
        transition: 0.4s;
        display: flex;
        align-items: center;
        gap: 10px;
        margin-top: 20px;
        width: fit-content;
    }

    .update-btn:hover {
        background: #e53e56;
        transform: translateY(-3px);
        box-shadow: 0 10px 25px rgba(229, 62, 86, 0.3);
    }

    .alert {
        padding: 16px 20px;
        border-radius: 12px;
        margin-bottom: 30px;
        display: flex;
        align-items: center;
        gap: 12px;
        font-weight: 600;
        font-size: 14px;
    }

    .alert-success { background: #e8f5e9; color: #2e7d32; }
    .alert-error { background: #ffebee; color: #c62828; }

    @media (max-width: 850px) {
        .profile-card { grid-template-columns: 1fr; }
        .profile-aside { padding: 40px 20px; }
        .form-row { grid-template-columns: 1fr; }
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
                <a href="${pageContext.request.contextPath}/profile" class="aside-link active">
                    <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-user"></use></svg> Thông tin cá nhân
                </a>
                <a href="${pageContext.request.contextPath}/order-history" class="aside-link">
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
                    <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-badge"></use></svg>
                </div>
                <h1>Hồ sơ cá nhân</h1>
            </div>

            <c:if test="${not empty message}">
                <div class="alert alert-success">
                    <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-success"></use></svg>
                    ${message}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/profile" method="post">
                <div class="form-row">
                    <div class="input-wrapper">
                        <label>Họ và tên</label>
                        <input type="text" name="username" class="custom-input" value="${sessionScope.user.username}" required>
                    </div>
                    <div class="input-wrapper">
                        <label>Email liên hệ</label>
                        <input type="email" name="email" class="custom-input" value="${sessionScope.user.email}" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="input-wrapper">
                        <label>Số điện thoại</label>
                        <input type="text" name="phone" class="custom-input" value="${sessionScope.user.phone}" required>
                    </div>
                    <div class="input-wrapper">
                        <label>Tên đăng nhập</label>
                        <input type="text" class="custom-input" value="${sessionScope.user.loginName}" disabled>
                    </div>
                </div>

                <div class="input-wrapper" style="margin-bottom: 25px;">
                    <label>Địa chỉ giao hàng mặc định</label>
                    <textarea name="address" class="custom-input" rows="4" style="resize: none;" required>${sessionScope.user.address}</textarea>
                </div>

                <button type="submit" class="update-btn">
                    <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-save"></use></svg>
                    Cập nhật thông tin
                </button>
            </form>
        </main>
    </div>
</div>
