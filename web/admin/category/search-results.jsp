<%-- 
    Document   : search-results
    Created on : May 8, 2026, 3:05:09 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${categoryList}" var="c">
    <tr>
        <td>
            <div style="font-weight: 600; color: var(--text-main);">${c.name}</div>
            <div style="font-size: 12px; color: var(--text-muted); margin-top: 2px;">ID: #${c.categoryId}</div>
        </td>
        <td>
            <span style="font-size: 14px; color: var(--text-muted); line-height: 1.5; display: inline-block; max-width: 450px;">
                ${c.description}
            </span>
        </td>
        <td style="text-align: center;">
            <span style="font-weight: 500; color: var(--text-main);">${c.productCount}</span>
        </td>
        <td style="text-align: right;">
            <div style="display: flex; justify-content: flex-end; gap: 8px;">
                <a href="${pageContext.request.contextPath}/admin/edit-category?id=${c.categoryId}" class="action-btn" title="Sửa">
                    <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-edit"></use></svg>
                </a>
                <a href="${pageContext.request.contextPath}/admin/delete-category?id=${c.categoryId}" class="action-btn delete" onclick="return confirm('Xóa danh mục này có thể ảnh hưởng đến sản phẩm. Bạn chắc chứ?')" title="Xóa">
                    <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-delete"></use></svg>
                </a>
            </div>
        </td>
    </tr>
</c:forEach>
