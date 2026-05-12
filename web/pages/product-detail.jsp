<%-- 
    Document   : product-detail
    Created on : May 8, 2026, 9:28:25 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/product-detail.css">

<main class="detail-container">
    <div class="product-hero">
        <div class="product-gallery">
            <div class="main-image-wrap">
                <img src="${pageContext.request.contextPath}/assets/images/products/${not empty p.imageUrl ? p.imageUrl : 'default.jpg'}" alt="${p.name}">
            </div>
        </div>

        <div class="product-info-col">
            <h1 class="detail-name">${p.name}</h1>
            <p class="detail-price">
                <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="" maxFractionDigits="0"/> VNĐ
            </p>

            <div class="detail-desc">${p.description}</div>

            <form action="${pageContext.request.contextPath}/cart?action=add" method="POST">
                <input type="hidden" name="productId" value="${p.productId}">

                <div class="purchase-row">
                    <div class="qty-selector">
                        <button type="button" class="qty-btn" onclick="changeQty(-1)">
                            <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-remove"></use></svg>
                        </button>
                        <input type="number" name="quantity" id="quantity" value="1" min="1" 
                               style="width: 35px; border: none; text-align: center; font-weight: 600; outline: none;">
                        <button type="button" class="qty-btn" onclick="changeQty(1)">
                            <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-add"></use></svg>
                        </button>
                    </div>

                    <button type="button" class="btn-add-to-cart" onclick="addToCartAJAX('${p.productId}', document.getElementById('quantity').value)">
                        Thêm vào giỏ
                        <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-add-cart"></use></svg>
                    </button>

                    <button type="submit" name="redirect" value="cart" class="btn-submit-cart">
                        Mua ngay
                        <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-bag"></use></svg>
                    </button>
                </div>
            </form>

            <div class="detail-accordion">
                <div class="accordion-item active" onclick="toggleAccordion(this)">
                    <div class="acc-header">
                        Hướng dẫn chăm sóc
                        <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-expand"></use></svg>
                    </div>
                    <div class="acc-content">
                        <ul class="info-list">
                            <li>
                                <svg class="icon info-icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-water"></use></svg>
                                <div class="info-text">
                                    <strong>Thay nước mỗi ngày</strong>
                                    <span>Sử dụng nước sạch và cắt bớt cành 1-2cm mỗi lần thay.</span>
                                </div>
                            </li>
                            <li>
                                <svg class="icon info-icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-sun"></use></svg>
                                <div class="info-text">
                                    <strong>Tránh ánh nắng trực tiếp</strong>
                                    <span>Đặt hoa ở nơi thoáng mát, tránh gió lùa và nhiệt độ cao.</span>
                                </div>
                            </li>
                            <li>
                                <svg class="icon info-icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-cut"></use></svg>
                                <div class="info-text">
                                    <strong>Loại bỏ lá héo</strong>
                                    <span>Giữ cho nước luôn sạch bằng cách loại bỏ lá chìm trong nước.</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="accordion-item active" onclick="toggleAccordion(this)">
                    <div class="acc-header">
                        Thông tin giao hàng
                        <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-expand"></use></svg>
                    </div>
                    <div class="acc-content">
                        <ul class="info-list">
                            <li>
                                <svg class="icon info-icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-shipping"></use></svg>
                                <div class="info-text">
                                    <strong>Giao hàng hoả tốc</strong>
                                    <span>Trong vòng 2 giờ tại nội thành.</span>
                                </div>
                            </li>
                            <li>
                                <svg class="icon info-icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-gift"></use></svg>
                                <div class="info-text">
                                    <strong>Đóng gói cao cấp</strong>
                                    <span>Hộp quà sang trọng, thiệp viết tay miễn phí.</span>
                                </div>
                            </li>
                            <li>
                                <svg class="icon info-icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-spa"></use></svg>
                                <div class="info-text">
                                    <strong>Bảo hành hoa tươi</strong>
                                    <span>Cam kết hoa tươi tối thiểu 3 ngày.</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="meaning-box">
        <div class="meaning-grid">
            <div class="meaning-text">
                <span class="breadcrumb-label">Câu chuyện</span>
                <h2 class="detail-name" style="font-size: 26px;">Ngôn ngữ của đóa hoa</h2>
                
                <p class="detail-desc" style="border: none; padding: 0;">
                    ${not empty p.storyText ? p.storyText : 'Mỗi đóa hoa tại Floral Haven đều mang một thông điệp tình yêu duy nhất, được gửi gắm qua từng nhành lá.'}
                </p>

            </div>
            <div class="meaning-image">
                
                <img src="${pageContext.request.contextPath}/assets/images/products/${not empty p.storyImage ? p.storyImage : p.imageUrl}" style="width: 100%; display: block;">
                
            </div>
        </div>
    </div>

    <section class="similar-section">
        <span class="similar-subtitle">Khám phá thêm</span>
        <h2 class="similar-title">Sản phẩm tương tự</h2>
        <div style="width: 40px; height: 1px; background: #970046; margin: 0 auto 40px;"></div>

        <div class="similar-grid">
            <c:forEach items="${similarProducts}" var="sp" end="3">
                <a href="${pageContext.request.contextPath}/product-detail?id=${sp.productId}" class="similar-card">
                    <div class="similar-img-box">
                        <img src="${pageContext.request.contextPath}/assets/images/products/${not empty sp.imageUrl ? sp.imageUrl : 'default.jpg'}" alt="${sp.name}">
                    </div>
                    <h3 class="similar-name">${sp.name}</h3>
                    <p class="similar-price">
                        <fmt:formatNumber value="${sp.price}" type="currency" currencySymbol="" maxFractionDigits="0"/> VNĐ
                    </p>
                </a>
            </c:forEach>
        </div>
    </section>
</main>

<script>
    // Hàm tăng giảm số lượng
    function changeQty(amt) {
        const input = document.getElementById('quantity');
        let val = parseInt(input.value) + amt;
        if (val >= 1)
            input.value = val;
    }

    // Hàm mở đóng Accordion
    function toggleAccordion(element) {
        element.classList.toggle('active');
    }
</script>