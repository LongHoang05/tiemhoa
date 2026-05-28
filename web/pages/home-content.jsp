<%-- 
    Document   : home-content
    Created on : May 8, 2026, 9:28:25 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/home-content.css">

<section class="hero-editorial">
    <div class="hero-text-col">
        <span class="hero-subtitle">Bộ sưu tập mùa xuân</span>
        <h1 class="hero-title">
            Gửi Gắm <br/><i>Yêu Thương</i>
        </h1>
        <p class="hero-desc">
            Khám phá những thiết kế hoa tươi tinh tế, mang đậm phong cách tối giản và đầy chất thơ. Mỗi bó hoa là một câu chuyện riêng biệt, được tuyển chọn cẩn thận để trao gửi những cảm xúc chân thành nhất.
        </p>
        <a href="${pageContext.request.contextPath}/products" class="btn-explore">
            Khám Phá Ngay
            <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-arrow-forward"></use></svg>
        </a>
    </div>

    <div class="hero-img-col">
        <div class="hero-img-bg-shape"></div>
        
        <div class="hero-img-wrap">
            <img src="${pageContext.request.contextPath}/assets/images/bg-hero.png" alt="Bó hoa cao cấp phong cách tối giản">
            
            <div class="hero-glass-badge">
                <div class="badge-icon">
                    <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-product"></use></svg>
                </div>
                <div>
                    <p class="badge-text-top">Được thiết kế riêng</p>
                    <p class="badge-text-bottom">Bởi nghệ nhân Floral Haven</p>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="ambient-spacer"></div>

<main class="container">
    <div class="section-header">
        <div class="title-group">
            <h2>Hàng Mới</h2>
            <div class="green-line"></div>
        </div>
        <a href="${pageContext.request.contextPath}/products" class="view-all">Xem tất cả sản phẩm</a>
    </div>

    <div class="product-grid">
        <c:forEach items="${topNewProducts}" var="p">
            <a href="${pageContext.request.contextPath}/product-detail?id=${p.productId}" class="product-card">
                <div class="img-box">
                    <img src="${pageContext.request.contextPath}/assets/images/products/${not empty p.imageUrl ? p.imageUrl : 'default.jpg'}" alt="${p.name}"/>
                </div>
                <div class="product-info">
                    <h3>${p.name}</h3>
                    <span><fmt:formatNumber value="${p.price}" pattern="#,###"/> VND</span>
                </div>
            </a>
        </c:forEach>
    </div>

    <div class="section-header">
        <div class="title-group">
            <h2>Bán Chạy</h2>
            <div class="green-line"></div>
        </div>
        <a href="${pageContext.request.contextPath}/products" class="view-all">Xem tất cả sản phẩm</a>
    </div>

    <div class="product-grid">
        <c:forEach items="${bestSellerProducts}" var="p">
            <a href="${pageContext.request.contextPath}/product-detail?id=${p.productId}" class="product-card">
                <div class="img-box">
                    <img src="${pageContext.request.contextPath}/assets/images/products/${not empty p.imageUrl ? p.imageUrl : 'default.jpg'}" alt="${p.name}"/>
                </div>
                <div class="product-info">
                    <h3>${p.name}</h3>
                    <span><fmt:formatNumber value="${p.price}" pattern="#,###"/> VND</span>
                </div>
            </a>
        </c:forEach>
    </div>
</main>