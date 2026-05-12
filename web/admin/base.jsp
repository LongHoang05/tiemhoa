<%-- 
    Document   : base
    Created on : May 7, 2026, 5:41:11 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${not empty requestScope.pageTitle ? requestScope.pageTitle : 'Quản trị - Floral Haven'}</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin-style.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin-common.css"/>
        <script src="${pageContext.request.contextPath}/assets/js/admin-search.js"></script>

    </head>
    <body>
        <jsp:include page="includes/sidebar-admin.jsp" />

        <div class="main-wrapper">
            <main class="content-area">
                <jsp:include page="${requestScope.contentPage}" />
            </main>
        </div>

        <jsp:include page="/admin/includes/toast.jsp" />
    </body>

</html>
