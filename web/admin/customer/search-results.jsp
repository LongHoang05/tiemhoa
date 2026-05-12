<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${customerList}" var="c">
    <tr>
        <td style="font-weight: 700; color: var(--primary);">#${c.userId}</td>
        <td style="font-weight: 600; color: var(--text-main);">${c.username}</td>
        <td style="color: var(--text-muted);">${c.loginName}</td>
        <td>
            <div style="font-size: 13px;">${c.email}</div>
            <div style="font-size: 13px; color: var(--text-muted);">${c.phone}</div>
        </td>
        <td style="font-size: 13px; max-width: 200px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
            ${c.address}
        </td>
        <td style="text-align: center;">
            <c:choose>
                <c:when test="${c.status == 1}">
                    <span class="status-badge success">HOẠT ĐỘNG</span>
                </c:when>
                <c:otherwise>
                    <span class="status-badge error">BỊ KHÓA</span>
                </c:otherwise>
            </c:choose>
        </td>
        <td style="text-align: right;">
            <div style="display: flex; justify-content: flex-end; gap: 8px;">
                <a href="${pageContext.request.contextPath}/admin/customer-detail?id=${c.userId}" class="action-btn" title="Xem chi tiết">
                    <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-view"></use></svg>
                </a>
                <a href="${pageContext.request.contextPath}/admin/toggle-customer-status?id=${c.userId}&status=${c.status}" 
                   class="action-btn delete" 
                   title="${c.status == 1 ? 'Khóa tài khoản' : 'Mở khóa tài khoản'}"
                   onclick="return confirm('${c.status == 1 ? 'Khóa tài khoản này?' : 'Mở khóa tài khoản này?'}')">
                    <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-${c.status == 1 ? 'block' : 'lock-open'}"></use></svg>
                </a>
            </div>
        </td>
    </tr>
</c:forEach>
<c:if test="${empty customerList}">
    <tr>
        <td colspan="7" style="text-align: center; padding: 40px; color: var(--text-muted);">
            Không tìm thấy khách hàng nào phù hợp.
        </td>
    </tr>
</c:if>
