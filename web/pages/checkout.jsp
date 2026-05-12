<%-- 
    Document   : checkout
    Created on : May 9, 2026, 10:15:19 PM
    Author     : ASUS
--%>

<%-- 
    Document   : checkout
    Created on : May 9, 2026
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/checkout.css">

<main class="checkout-wrapper">
    <header class="checkout-header">
        <h1 class="checkout-title">Thanh toán</h1>
        <p class="checkout-subtitle">Hoàn tất đơn hàng của bạn một cách an toàn và bảo mật.</p>
    </header>

    <div class="checkout-grid">
        <div class="vertical-divider"></div>

        <div class="left-col">
            <form action="${pageContext.request.contextPath}/checkout" method="POST" id="checkoutForm">
                
                <section style="margin-bottom: 40px;">
                    <h2 class="section-title">Thông tin giao hàng</h2>
                    <div class="form-group">
                        <label class="form-label">Họ và tên người nhận</label>
                        <input type="text" name="fullName" class="form-input" placeholder="Nhập họ tên..." required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Số điện thoại</label>
                        <input type="tel" name="phone" class="form-input" placeholder="Nhập số điện thoại liên hệ..." required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Địa chỉ giao hàng</label>
                        <input type="text" name="address" class="form-input" placeholder="Số nhà, tên đường, phường/xã, quận/huyện..." required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Ghi chú đơn hàng</label>
                        <textarea name="note" rows="3" class="form-input" placeholder="Thời gian giao mong muốn, dặn dò shipper..."></textarea>
                    </div>
                </section>

                <section>
                    <h2 class="section-title">Phương thức thanh toán</h2>
                    <div class="payment-options">
                        <label class="payment-label">
                            <input type="radio" name="paymentMethod" value="COD" checked>
                            <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-shipping"></use></svg>
                            <span>Thanh toán khi nhận hàng (COD)</span>
                        </label>
                        <label class="payment-label">
                            <input type="radio" name="paymentMethod" value="BANK">
                            <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-bank"></use></svg>
                            <span>Chuyển khoản ngân hàng</span>
                        </label>
                        <label class="payment-label">
                            <input type="radio" name="paymentMethod" value="MOMO">
                            <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-qr"></use></svg>
                            <span>Ví điện tử MoMo / ZaloPay</span>
                        </label>
                    </div>
                </section>
            </form>
        </div>

        <div class="summary-col">
            <div class="summary-box">
                
                <section>
                    <h2 class="summary-header">Sản phẩm trong đơn</h2>
                    <div class="mini-cart-list">
                        <c:forEach items="${sessionScope.cart.items}" var="item">
                            <div class="mini-cart-item">
                                <img src="${pageContext.request.contextPath}/assets/images/products/${item.product.imageUrl}" alt="${item.product.name}">
                                <div class="mini-info">
                                    <div class="mini-name">${item.product.name}</div>
                                    <div class="mini-qty">Số lượng: ${item.quantity}</div>
                                </div>
                                <div class="mini-price">
                                    <fmt:formatNumber value="${item.totalPrice}" type="currency" currencySymbol="" maxFractionDigits="0"/> đ
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </section>

                <section>
                    <div class="summary-row">
                        <span>Tạm tính</span>
                        <span style="color: #26181b;"><fmt:formatNumber value="${sessionScope.cart.totalMoney}" type="currency" currencySymbol="" maxFractionDigits="0"/> đ</span>
                    </div>
                    <div class="summary-row">
                        <span>Phí giao hàng</span>
                        <span style="color: #26181b;">15.000 đ</span>
                    </div>
                    <div class="summary-row">
                        <span>Thuế VAT (8%)</span>
                        <span style="color: #26181b;"><fmt:formatNumber value="${sessionScope.cart.totalMoney * 0.08}" type="currency" currencySymbol="" maxFractionDigits="0"/> đ</span>
                    </div>
                    
                    <div class="summary-row total">
                        <span>Tổng cộng</span>
                        <span class="total-price">
                            <fmt:formatNumber value="${sessionScope.cart.totalMoney + (sessionScope.cart.totalMoney * 0.08) + 15000}" type="currency" currencySymbol="" maxFractionDigits="0"/> đ
                        </span>
                    </div>

                    <button type="submit" form="checkoutForm" class="btn-submit-order">
                        Đặt hàng ngay
                        <svg class="icon" style="font-size: 20px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-success"></use></svg>
                    </button>
                    
                    <div class="secure-text">
                        <svg class="icon" style="font-size: 16px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-lock"></use></svg>
                        Thanh toán bảo mật và mã hóa
                    </div>
                </section>
            </div>
        </div>
    </div>
</main>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const pendingNote = sessionStorage.getItem('pendingGiftNote');
        if (pendingNote) {
            const noteTextarea = document.querySelector('textarea[name="note"]');
            if (noteTextarea) {
                noteTextarea.value = pendingNote;
                sessionStorage.removeItem('pendingGiftNote');
            }
        }
    });
</script>
