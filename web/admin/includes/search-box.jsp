<%-- 
    Document   : search-box
    Created on : May 8, 2026, 2:52:04 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="search-box">
    <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-search"></use></svg>
    <input type="text" 
           id="${not empty requestScope.searchId ? requestScope.searchId : 'searchInput'}" 
           placeholder="${not empty requestScope.searchPlaceholder ? requestScope.searchPlaceholder : 'Tìm kiếm...'}">
</div>
