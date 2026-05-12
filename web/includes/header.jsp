<%-- 
    Document   : header
    Created on : May 8, 2026, 4:02:39 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">

<style>
    /* Global Icon Style */
    svg.icon {
        width: 1em;
        height: 1em;
        fill: currentColor;
        display: inline-block;
        vertical-align: middle;
        flex-shrink: 0;
    }
    
    /* Toast Notification Style */
    #cart-notification {
        position: fixed;
        bottom: 30px;
        right: 30px;
        background: #970046;
        color: white;
        padding: 16px 24px;
        border-radius: 8px;
        box-shadow: 0 10px 25px rgba(151, 0, 70, 0.2);
        display: flex;
        align-items: center;
        gap: 12px;
        z-index: 9999;
        transform: translateY(100px);
        opacity: 0;
        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    }
    #cart-notification.show {
        transform: translateY(0);
        opacity: 1;
    }
    .cart-badge {
        transition: all 0.3s ease;
    }
    .cart-badge.bump {
        transform: scale(1.3);
    }
</style>


<header class="main-header">
    <div class="header-container">
        <a href="${pageContext.request.contextPath}/home" class="header-logo">Floral Haven</a>

        <nav class="top-menu">
            <a href="${pageContext.request.contextPath}/home">Trang chủ</a>
            <a href="${pageContext.request.contextPath}/products">Sản phẩm</a>
            <a href="${pageContext.request.contextPath}/about">Về chúng tôi</a>
            <a href="${pageContext.request.contextPath}/contact">Liên hệ</a>
            
            <div class="nav-line"></div>
        </nav>

        <div class="header-actions">
            <a href="${pageContext.request.contextPath}/cart" class="action-icon" title="Giỏ hàng">
                <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-cart"></use></svg>
                <c:if test="${not empty sessionScope.cart and sessionScope.cart.items.size() > 0}">
                    <span class="cart-badge">${sessionScope.cart.items.size()}</span>
                </c:if>
            </a>

            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <div class="user-dropdown">
                        <a href="#" class="action-icon" style="gap: 6px;">
                            <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-user"></use></svg>
                            <span style="font-size: 13px; font-weight: 600; white-space: nowrap;">
                                ${sessionScope.user.username}
                            </span>
                        </a>
                        
                        <div class="dropdown-menu">
                            <a href="${pageContext.request.contextPath}/profile" class="dropdown-item">
                                <span style="display: flex; align-items: center; gap: 8px;">
                                    <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-account"></use></svg>
                                    Hồ sơ của tôi
                                </span>
                            </a>
                            
                            <c:if test="${sessionScope.user.roleId == 0}">
                                <a href="${pageContext.request.contextPath}/admin/order-management" class="dropdown-item">
                                    <span style="display: flex; align-items: center; gap: 8px;">
                                        <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-admin"></use></svg>
                                        Trang Quản trị
                                    </span>
                                </a>
                            </c:if>
                            
                            <a href="${pageContext.request.contextPath}/logout" class="dropdown-item text-danger">
                                <span style="display: flex; align-items: center; gap: 8px;">
                                    <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-logout"></use></svg>
                                    Đăng xuất
                                </span>
                            </a>
                        </div>
                    </div>
                </c:when>
                
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login" class="action-icon" title="Đăng nhập / Đăng ký">
                        <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-user"></use></svg>
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</header>

<!-- Notification Toast -->
<div id="cart-notification">
    <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-success"></use></svg>
    <span id="cart-msg">Đã thêm vào giỏ hàng!</span>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const line = document.querySelector('.nav-line');
        const links = document.querySelectorAll('.top-menu a');

        function moveLine(element) {
            line.style.width = element.offsetWidth + "px";
            line.style.left = element.offsetLeft + "px";
        }

        // 1. Tìm mục active theo class hoặc URL
        let activeLink = document.querySelector('.top-menu a.active');
        if (!activeLink) {
            const currentPath = window.location.pathname;
            links.forEach(link => {
                if (currentPath.includes(link.getAttribute('href'))) {
                    link.classList.add('active');
                    activeLink = link;
                }
            });
        }

        if (activeLink) {
            moveLine(activeLink);
            
            setTimeout(() => {
                line.classList.add('ready');
            }, 50);
        }

        // 2. Các sự kiện hover giữ nguyên
        links.forEach(link => {
            link.addEventListener('mouseenter', (e) => moveLine(e.target));
            link.addEventListener('mouseleave', () => {
                const currentActive = document.querySelector('.top-menu a.active');
                if (currentActive) moveLine(currentActive);
            });
        });
    });

    // Global AJAX Add to Cart function
    function addToCartAJAX(productId, quantity) {
        const url = '${pageContext.request.contextPath}/cart?action=add';
        const params = new URLSearchParams();
        params.append('productId', productId);
        params.append('quantity', quantity);

        fetch(url, {
            method: 'POST',
            body: params,
            headers: {
                'X-Requested-With': 'XMLHttpRequest',
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        })
        .then(response => response.text())
        .then(count => {
            // 1. Cập nhật Badge số lượng
            updateCartBadge(count);
            
            // 2. Hiện thông báo
            showCartNotification();
        })
        .catch(err => console.error("Lỗi thêm giỏ hàng:", err));
    }

    function updateCartBadge(count) {
        const actionsDiv = document.querySelector('.header-actions .action-icon[title="Giỏ hàng"]');
        let badge = document.querySelector('.cart-badge');
        
        if (!badge) {
            badge = document.createElement('span');
            badge.className = 'cart-badge';
            actionsDiv.appendChild(badge);
        }
        
        badge.innerText = count;
        badge.classList.add('bump');
        setTimeout(() => badge.classList.remove('bump'), 300);
    }

    function showCartNotification() {
        const toast = document.getElementById('cart-notification');
        toast.classList.add('show');
        setTimeout(() => {
            toast.classList.remove('show');
        }, 3000);
    }
</script>