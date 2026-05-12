<%-- 
    Document   : left-menu
    Created on : May 8, 2026, 9:46:57 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/left-menu.css">

<aside class="sidebar">
    <h2 class="sidebar-title">Danh Mục</h2>
    <ul class="category-list">
        <li>
            <a href="${pageContext.request.contextPath}/products" class="category-link ${empty param.categoryId ? 'active' : ''}">
                <span class="dot"></span>Tất Cả Sản Phẩm
            </a>
        </li>
        <c:forEach items="${categoryList}" var="c">
            <li>
                <a href="${pageContext.request.contextPath}/products?categoryId=${c.categoryId}" 
                   class="category-link ${param.categoryId == c.categoryId ? 'active' : ''}">
                    <span class="dot"></span>${c.name}
                </a>
            </li>
        </c:forEach>
    </ul>

    <h2 class="sidebar-title">Mức Giá</h2>
    <form action="${pageContext.request.contextPath}/products" method="GET" class="price-filter-form">
        <!-- Giữ lại categoryId nếu đang lọc theo danh mục -->
        <c:if test="${not empty param.categoryId}">
            <input type="hidden" name="categoryId" value="${param.categoryId}">
        </c:if>
        <!-- Giữ lại sort nếu đang có sắp xếp -->
        <c:if test="${not empty param.sort}">
            <input type="hidden" name="sort" value="${param.sort}">
        </c:if>

        <div class="price-filter">
            <label>
                <input type="radio" name="priceRange" value="0-500" ${param.priceRange == '0-500' ? 'checked' : ''}/> 
                Dưới 500,000đ
            </label>
            <label>
                <input type="radio" name="priceRange" value="500-1500" ${param.priceRange == '500-1500' ? 'checked' : ''}/> 
                500,000đ - 1,500,000đ
            </label>
            <label>
                <input type="radio" name="priceRange" value="1500-up" ${param.priceRange == '1500-up' ? 'checked' : ''}/> 
                Trên 1,500,000đ
            </label>
            <label>
                <input type="radio" name="priceRange" value="all" ${empty param.priceRange or param.priceRange == 'all' ? 'checked' : ''}/> 
                Tất cả mức giá
            </label>
        </div>
        
        <button type="submit" class="btn-filter-apply">Xác nhận lọc</button>
    </form>
</aside>
