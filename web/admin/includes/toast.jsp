<%-- 
    Document   : toast
    Created on : May 8, 2026, 8:31:51 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty sessionScope.toastMsg}">
    <div id="snackbar">
        <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-success"></use></svg>
        ${sessionScope.toastMsg}
    </div>
    
    <c:remove var="toastMsg" scope="session" />

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var x = document.getElementById("snackbar");
            if(x) {
                x.classList.add("show");
                setTimeout(function(){ 
                    x.classList.remove("show");
                }, 3000);
            }
        });
    </script>
</c:if>
