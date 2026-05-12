<%-- 
    Document   : footer
    Created on : May 8, 2026, 4:00:08 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">

<footer class="footer-wrapper">
    <div class="footer-grid">
        <div class="footer-brand">
            <h3>Floral Haven</h3>
            <p>Crafting emotions through the language of delicate petals and thoughtful design.</p>
            <div class="social-icons">
                <a href="#" aria-label="Facebook">
                    <svg class="icon" width="20" height="20"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-facebook"></use></svg>
                </a>
                <a href="#" aria-label="Instagram">
                    <svg class="icon" width="20" height="20"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-instagram"></use></svg>
                </a>
                <a href="#" aria-label="Pinterest">
                    <svg class="icon" width="20" height="20"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-pinterest"></use></svg>
                </a>
                <a href="#" aria-label="Twitter">
                    <svg class="icon" width="20" height="20"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-twitter"></use></svg>
                </a>
            </div>
        </div>

        <div>
            <h4 class="footer-heading">Thông tin</h4>
            <div class="footer-links">
                <a href="${pageContext.request.contextPath}/about">Về chúng tôi</a>
                <a href="${pageContext.request.contextPath}/contact">Liên hệ chúng tôi</a>
                <a href="#">Chăm sóc khách hàng</a>
            </div>
        </div>

        <div>
            <h4 class="footer-heading">Chính sách</h4>
            <div class="footer-links">
                <a href="#">Chính sách bảo mật</a>
                <a href="#">Điều khoản sử dụng</a>
                <a href="#">Chính sách vận chuyển</a>
            </div>
        </div>
    </div>

    <section class="footer-team">
        <h4>Thành viên thực hiện dự án</h4>
        <div class="team-cards">
            <div class="team-card">
                <p class="team-name">Hồ Thị Lan Hương</p>
                <p class="team-dob">Ngày sinh: 24/11/2005</p>
            </div>
            <div class="team-card">
                <p class="team-name">Bùi Ngọc Chi</p>
                <p class="team-dob">Ngày sinh: 10/05/2005</p>
            </div>
        </div>
        <p class="footer-copyright">© 2026 Bài tập thực tập Thiết kế Web • Floral Haven</p>
    </section>
</footer>