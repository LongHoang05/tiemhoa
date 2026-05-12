<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<header class="admin-header">
    <div>
        <h1>Quản lý phản hồi</h1>
        <p>Floral Haven • Xem ý kiến và góp ý từ khách hàng</p>
    </div>
</header>

<div class="table-card">
    <div class="table-toolbar">
        <div class="toolbar-search">
            <input type="text" id="contactSearch" class="admin-input" placeholder="Tìm theo tên hoặc nội dung..." style="width: 300px;">
        </div>
    </div>

    <table>
        <thead class="admin-table-header">
            <tr>
                <th style="width: 200px;">Khách hàng</th>
                <th style="width: 250px;">Chủ đề</th>
                <th>Nội dung tin nhắn</th>
                <th style="width: 150px;">Ngày gửi</th>
                <th style="text-align: right; width: 100px;">Thao tác</th>
            </tr>
        </thead>
        <tbody id="contactTableBody">
            <c:forEach items="${contactList}" var="c">
                <tr>
                    <td>
                        <div style="font-weight: 600; color: var(--text-main);">${c.senderName}</div>
                        <div style="font-size: 12px; color: var(--text-muted);">${c.senderEmail}</div>
                    </td>
                    <td>
                        <div style="font-weight: 500; color: var(--primary);">${c.subject}</div>
                    </td>
                    <td>
                        <div style="font-size: 14px; color: var(--text-main); line-height: 1.5; max-width: 500px; white-space: pre-wrap;">${c.message}</div>
                    </td>
                    <td>
                        <div style="font-size: 13px; color: var(--text-muted);">
                            <fmt:formatDate value="${c.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                        </div>
                    </td>
                    <td style="text-align: right;">
                        <div style="display: flex; justify-content: flex-end; gap: 8px;">
                            <a href="${pageContext.request.contextPath}/admin/delete-contact?id=${c.contactId}" 
                               class="action-btn delete" 
                               title="Xóa phản hồi"
                               onclick="return confirm('Bạn có chắc chắn muốn xóa phản hồi này?')">
                                <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-delete"></use></svg>
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty contactList}">
                <tr>
                    <td colspan="5" style="text-align: center; padding: 40px; color: var(--text-muted);">
                        Chưa có phản hồi nào từ khách hàng.
                    </td>
                </tr>
            </c:if>
        </tbody>
    </table>
</div>

<script>
    // Simple client-side search for contacts
    document.getElementById('contactSearch').addEventListener('input', function(e) {
        const query = e.target.value.toLowerCase();
        const rows = document.querySelectorAll('#contactTableBody tr');
        
        rows.forEach(row => {
            const text = row.innerText.toLowerCase();
            row.style.display = text.includes(query) ? '' : 'none';
        });
    });
</script>
