<%-- 
    Document   : search-results
    Created on : May 8, 2026, 3:26:07 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${productList}" var="p">
    <tr>
        <td style="width: 150px;">
            <c:choose>
                <c:when test="${not empty p.imageUrl}">
                    <img src="${pageContext.request.contextPath}/assets/images/products/${p.imageUrl}" alt="${p.name}" style="width: 60px; height: 60px; object-fit: cover; border-radius: 8px;">
                </c:when>
                <c:otherwise>
                    <img src="${pageContext.request.contextPath}/assets/images/default_flower.jpg" alt="No Image" style="width: 60px; height: 60px; object-fit: cover; border-radius: 8px;">
                </c:otherwise>
            </c:choose>
        </td>

        <td>
            <div style="font-weight: 600; color: var(--text-main);">${p.name}</div>
        </td>

        <td>
            <c:forEach items="${categoryList}" var="c">
                <c:if test="${c.categoryId == p.categoryId}">
                    <span class="status-badge">
                        ${c.name}
                    </span>
                </c:if>
            </c:forEach>
        </td>

        <td>
            <span style="font-weight: 700; color: var(--primary);"><fmt:formatNumber value="${p.price}" pattern="#,###"/> ₫</span>
        </td>

        <td style="text-align: center;">
            <c:choose>
                <c:when test="${p.stockQuantity <= 0}">
                    <span style="color: var(--error); font-weight: bold;">Hết hàng</span>
                </c:when>
                <c:otherwise>${p.stockQuantity}</c:otherwise>
            </c:choose>
        </td>

        <td style="text-align: right;">
            <div style="display: flex; justify-content: flex-end; gap: 8px;">
                <a href="${pageContext.request.contextPath}/admin/edit-product?id=${p.productId}&filter=${filter}&query=${query}" class="action-btn">
                    <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-edit"></use></svg>
                </a>
                <a href="${pageContext.request.contextPath}/admin/delete-product?id=${p.productId}&filter=${filter}&query=${query}" class="action-btn delete" onclick="return confirm('Xóa không?');">
                    <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-delete"></use></svg>
                </a>
            </div>
        </td>
    </tr>
</c:forEach>
