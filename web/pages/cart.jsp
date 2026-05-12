<%-- 
    Document   : cart
    Created on : May 9, 2026, 9:45:14 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cart.css">

<main class="cart-wrapper">
    <c:if test="${empty sessionScope.cart || empty sessionScope.cart.items}">
        <div class="empty-cart">
            <svg class="icon" style="font-size: 50px; color: #e0bec4;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-basket"></use></svg>
            <h2>Giỏ hàng đang trống</h2>
            <p style="color: #594046; margin-bottom: 24px; font-size: 14px;">Bạn chưa chọn tác phẩm hoa nào cho mình cả.</p>
            <a href="${pageContext.request.contextPath}/home" style="padding: 10px 24px; background: #970046; color: #fff; text-decoration: none; border-radius: 50px; font-weight: 600; font-size: 13px;">Tiếp tục khám phá</a>
        </div>
    </c:if>

    <c:if test="${not empty sessionScope.cart && not empty sessionScope.cart.items}">
        <header class="cart-header">
            <h1 class="cart-title">Giỏ hàng của bạn</h1>
            <p class="cart-subtitle">Một sự lựa chọn đầy tính nghệ thuật, sẵn sàng để trao gửi.</p>
        </header>
        
        <div class="cart-grid">

            <div class="left-col">
                <div class="cart-items-list">
                    <c:forEach items="${sessionScope.cart.items}" var="item">
                        <article class="cart-item">
                            <div class="item-img-box">
                                <img src="${pageContext.request.contextPath}/assets/images/products/${item.product.imageUrl}" alt="${item.product.name}">
                            </div>
                            <div class="item-details">
                                <div class="item-top">
                                    <div>
                                        <h3 class="item-name">${item.product.name}</h3>
                                        <p class="item-desc">Kích thước tiêu chuẩn</p>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/cart?action=remove" method="POST" style="margin:0;">
                                        <input type="hidden" name="productId" value="${item.product.productId}">
                                        <button type="submit" class="btn-remove" title="Xóa khỏi giỏ">
                                            <svg class="icon" style="font-size: 20px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-close"></use></svg>
                                        </button>
                                    </form>
                                </div>
                                <div class="item-bottom">
                                    <div class="qty-control">
                                        <button class="qty-btn" 
                                                onclick="if (${item.quantity} > 1)
                                                            updateQty('${item.product.productId}', -1)"
                                                style="${item.quantity <= 1 ? 'opacity: 0.3; cursor: not-allowed;' : ''}">
                                            <svg class="icon" style="font-size: 16px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-remove"></use></svg>
                                        </button>

                                        <span class="qty-number">${item.quantity}</span>

                                        <button class="qty-btn" onclick="updateQty('${item.product.productId}', 1)">
                                            <svg class="icon" style="font-size: 16px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-add"></use></svg>
                                        </button>
                                    </div>
                                    <span class="item-price">
                                        <fmt:formatNumber value="${item.totalPrice}" type="currency" currencySymbol="" maxFractionDigits="0"/> đ
                                    </span>
                                </div>
                            </div>
                        </article>
                    </c:forEach>
                </div>

                <div class="gift-note-area">
                    <div class="gift-header">
                        <svg class="icon" style="font-size: 20px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-edit-square"></use></svg>
                        Thêm Lời Nhắn Cá Nhân
                    </div>
                    <p class="gift-desc">Lời nhắn của bạn sẽ được viết tay nắn nót trên tấm thiệp mang dấu ấn riêng của Floral Haven.</p>
                    <div class="gift-form">
                        <input type="text" id="gift-to" name="gift_to" class="gift-input" placeholder="Gửi đến: (Tên người nhận)">
                        <textarea id="gift-message" name="gift_message" class="gift-input" rows="3" placeholder="Viết những lời chân thành nhất của bạn tại đây..."></textarea>
                        <input type="text" id="gift-from" name="gift_from" class="gift-input" placeholder="Từ: (Tên của bạn)">
                    </div>
                </div>
            </div>

            <div class="summary-col">
                <div class="summary-box">
                    <h2 class="summary-title">Tóm tắt đơn hàng</h2>

                    <div class="summary-row">
                        <span>Tạm tính</span>
                        <span><fmt:formatNumber value="${sessionScope.cart.totalMoney}" type="currency" currencySymbol="" maxFractionDigits="0"/> đ</span>
                    </div>
                    <div class="summary-row">
                        <span>Phí giao hàng</span>
                        <span style="font-style: italic; font-size: 12px;">Tính ở bước sau</span>
                    </div>
                    <div class="summary-row">
                        <span>Thuế VAT (8%)</span>
                        <span><fmt:formatNumber value="${sessionScope.cart.totalMoney * 0.08}" type="currency" currencySymbol="" maxFractionDigits="0"/> đ</span>
                    </div>

                    <div class="summary-row total">
                        <span>Tổng thanh toán</span>
                        <span class="total-price">
                            <fmt:formatNumber value="${sessionScope.cart.totalMoney + (sessionScope.cart.totalMoney * 0.08)}" type="currency" currencySymbol="" maxFractionDigits="0"/> đ
                        </span>
                    </div>

                    <a href="${pageContext.request.contextPath}/checkout" class="btn-checkout" onclick="saveGiftInfo()">
                        Tiến hành thanh toán
                        <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-arrow-forward"></use></svg>
                    </a>

                    <div class="secure-text">
                        <svg class="icon" style="font-size: 14px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-lock"></use></svg>
                        Thanh toán bảo mật tuyệt đối
                    </div>
                </div>
            </div>
        </div>

        <section class="cross-sell-section">
            <header class="cross-sell-header">
                <h2 class="cross-title">Thêm chút điểm nhấn</h2>
                <p class="cart-subtitle">Nâng tầm món quà của bạn với các phụ kiện đi kèm tinh tế.</p>
            </header>

            <div class="cross-grid">
                <c:forEach items="${accessoryList}" var="acc" end="3">
                    <div class="cross-card">
                        <div class="cross-img-box">
                            <img src="${pageContext.request.contextPath}/assets/images/products/${not empty acc.imageUrl ? acc.imageUrl : 'default.jpg'}" class="cross-img" alt="${acc.name}">
                        </div>
                        <h4 class="cross-name">${acc.name}</h4>
                        <p class="cross-price"><fmt:formatNumber value="${acc.price}" pattern="#,###"/> đ</p>
                        <button type="button" class="btn-add-cross" onclick="addToCartAJAX('${acc.productId}', 1); setTimeout(() => location.reload(), 500);">Thêm vào giỏ</button>
                    </div>
                </c:forEach>
            </div>
        </section>
    </c:if>
</main>

<script>
    // Hàm tạo 1 form ẩn để gửi request POST lên CartServlet
    function updateQty(productId, amount) {
        var form = document.createElement("form");
        form.method = "POST";
        form.action = "${pageContext.request.contextPath}/cart?action=update";

        var idInput = document.createElement("input");
        idInput.type = "hidden";
        idInput.name = "productId";
        idInput.value = productId;
        form.appendChild(idInput);

        var amountInput = document.createElement("input");
        amountInput.type = "hidden";
        amountInput.name = "amount";
        amountInput.value = amount;
        form.appendChild(amountInput);

        document.body.appendChild(form);
        form.submit();
    }
    function saveGiftInfo() {
        const giftTo = document.getElementById('gift-to').value;
        const giftMsg = document.getElementById('gift-message').value;
        const giftFrom = document.getElementById('gift-from').value;

        if (giftTo || giftMsg || giftFrom) {
            const fullNote = '--- LỜI NHẮN QUÀ TẶNG ---\n' +
                             'Gửi đến: ' + giftTo + '\n' +
                             'Nội dung: ' + giftMsg + '\n' +
                             'Từ: ' + giftFrom + '\n' +
                             '------------------------';
            sessionStorage.setItem('pendingGiftNote', fullNote);
        }
    }
</script>
