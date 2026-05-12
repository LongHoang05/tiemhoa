<%-- 
    Document   : products
    Created on : May 8, 2026, 9:44:24 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/products.css">

<main class="flex-grow">
    <section class="page-banner container">
        <h1>Bộ Sưu Tập Hoa</h1>
        <p>Khám phá những thiết kế hoa tinh tế, mang đậm phong cách Poetic Minimalism.</p>
    </section>

    <div class="container shop-layout">
        
        <jsp:include page="/includes/left-menu.jsp" />

        <div class="product-area">
            <div class="toolbar">
                <span>Hiển thị ${productList.size()} / ${totalRecords} sản phẩm</span>
                <div class="sort-box">
                    Sắp xếp: 
                    <select id="sortSelect" onchange="applySort(this.value)">
                        <option value="latest" ${param.sort == 'latest' ? 'selected' : ''}>Mới nhất</option>
                        <option value="price_asc" ${param.sort == 'price_asc' ? 'selected' : ''}>Giá tăng dần</option>
                        <option value="price_desc" ${param.sort == 'price_desc' ? 'selected' : ''}>Giá giảm dần</option>
                    </select>
                </div>
            </div>

            <div class="product-grid">
                <c:forEach items="${productList}" var="p">
                    <div class="product-card">
                        <div class="product-img-box">
                            <a href="${pageContext.request.contextPath}/product-detail?id=${p.productId}">
                                <img src="${pageContext.request.contextPath}/assets/images/products/${not empty p.imageUrl ? p.imageUrl : 'default.jpg'}" alt="${p.name}">
                            </a>
                            <button type="button" class="action-btn" onclick="addToCartAJAX('${p.productId}', 1)">
                                <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-cart"></use></svg> Thêm vào giỏ
                            </button>
                        </div>
                        <a href="${pageContext.request.contextPath}/product-detail?id=${p.productId}" class="product-info" style="text-decoration: none;">
                            <h3>${p.name}</h3>
                            <p class="product-category">Hoa Tươi Nghệ Thuật</p>
                            <p class="product-price"><fmt:formatNumber value="${p.price}" pattern="#,###"/> VND</p>
                        </a>
                    </div>
                </c:forEach>
            </div>

            <jsp:include page="/includes/pagination.jsp" />
        </div>
    </div>
</main>
<script>
    function applySort(sortValue) {
        const urlParams = new URLSearchParams(window.location.search);
        urlParams.set('sort', sortValue);
        // Khi đổi cách sắp xếp thì nên quay về trang 1
        urlParams.set('page', '1');
        window.location.search = urlParams.toString();
    }
</script>
