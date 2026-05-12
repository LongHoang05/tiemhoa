<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${orderList}" var="o">
    <tr>
        <td style="font-weight: 700; color: var(--primary);">
            #${o.orderId}
        </td>

        <td>
            <div style="font-weight: 600; color: var(--text-main);">${o.recipientName}</div>
            <div style="font-size: 13px; color: var(--text-muted); margin-top: 2px;">${o.recipientPhone}</div>
        </td>

        <td style="color: var(--text-muted);">
            <fmt:formatDate value="${o.createdAt}" pattern="dd/MM/yyyy HH:mm" />
        </td>

        <td>
            <span style="font-weight: 700; color: var(--error);"><fmt:formatNumber value="${o.totalAmount}" pattern="#,###"/> ₫</span>
        </td>

        <td>
            <span class="status-badge">
                ${o.status}
            </span>
        </td>

        <td style="text-align: right;">
            <div style="display: flex; justify-content: flex-end; gap: 8px;">
                <a href="${pageContext.request.contextPath}/admin/order-detail?id=${o.orderId}" class="action-btn" title="Xem chi tiết">
                    <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-view"></use></svg>
                </a>
            </div>
        </td>
    </tr>
</c:forEach>
<c:if test="${empty orderList}">
    <tr>
        <td colspan="6" style="text-align: center; padding: 40px; color: var(--text-muted);">
            Không tìm thấy đơn hàng nào phù hợp.
        </td>
    </tr>
</c:if>
