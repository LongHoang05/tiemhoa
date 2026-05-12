<%-- 
    Document   : pagination
    Created on : May 8, 2026, 8:33:41 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pagination.css">

<c:if test="${totalPages > 1}">
    <div class="universal-pagination">
        <c:if test="${currentPage > 1}">
            <a href="${paginationUrl}page=${currentPage - 1}" class="uni-page-btn" title="Trang trước">&laquo;</a>
        </c:if>
        
        <c:forEach begin="${startPage}" end="${endPage}" var="i">
            <a href="${paginationUrl}page=${i}" class="uni-page-btn ${i == currentPage ? 'active' : ''}">
                ${i}
            </a>
        </c:forEach>
        
        <c:if test="${currentPage < totalPages}">
            <a href="${paginationUrl}page=${currentPage + 1}" class="uni-page-btn" title="Trang sau">&raquo;</a>
        </c:if>
    </div>
</c:if>
