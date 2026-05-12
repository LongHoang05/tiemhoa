<%-- 
    Document   : checkout-success
    Created on : May 10, 2026, 1:51:01 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .success-wrapper { 
        max-width: 600px; margin: 80px auto; text-align: center; 
        font-family: 'Montserrat', sans-serif; padding: 50px 40px; 
        background: #fff; border-radius: 24px; border: 1px solid #fce2e6; 
        box-shadow: 0 10px 40px rgba(151,0,70,0.05); 
    }
    .success-icon { 
        font-size: 80px; color: #536439; margin-bottom: 20px; 
    }
    .success-title { 
        font-family: 'Playfair Display', serif; font-size: 32px; 
        color: #970046; margin-bottom: 12px; 
    }
    .success-desc { 
        font-size: 15px; color: #594046; line-height: 1.6; margin-bottom: 40px; 
    }
    .btn-home { 
        display: inline-flex; align-items: center; justify-content: center; gap: 8px; 
        padding: 16px 36px; background: #970046; color: #fff; text-decoration: none; 
        border-radius: 50px; font-weight: 600; font-size: 13px; text-transform: uppercase; 
        letter-spacing: 1px; transition: 0.3s; 
    }
    .btn-home:hover { 
        background: #be185d; transform: translateY(-2px); 
        box-shadow: 0 8px 20px rgba(151,0,70,0.2); 
    }
</style>

<div class="success-wrapper">
    <svg class="icon success-icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-success"></use></svg>
    <h1 class="success-title">Đặt hàng thành công!</h1>
    <p class="success-desc">
        Cảm ơn <b>${sessionScope.user.username}</b> đã tin tưởng và lựa chọn Floral Haven.<br>
        Đơn hàng của bạn đã được ghi nhận và đang chờ xử lý. Chúng tôi sẽ sớm liên hệ để trao gửi những bông hoa tươi thắm nhất đến tay bạn!
    </p>
    <a href="${pageContext.request.contextPath}/home" class="btn-home">
        <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-home"></use></svg>
        Quay lại trang chủ
    </a>
</div>
