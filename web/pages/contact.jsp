<%-- 
    Document   : contact
    Created on : May 10, 2026, 9:13:20 PM
    Author     : antigravity
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/contact.css">

<main class="contact-container">
    <div class="container">
        <section class="contact-hero">
            <h1>Kết nối với Floral Haven</h1>
            <p>Chúng tôi luôn sẵn lòng lắng nghe và chia sẻ niềm đam mê hoa tươi cùng bạn.</p>
        </section>

        <div class="contact-grid">
            <!-- Thông tin liên hệ -->
            <div class="contact-info">
                <div class="info-item">
                    <div class="info-icon">
                        <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-location"></use></svg>
                    </div>
                    <div class="info-text">
                        <h3>Địa chỉ cửa hàng</h3>
                        <p>123 Đường Sắc Hoa, Quận 1, TP. Hồ Chí Minh</p>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon">
                        <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-phone"></use></svg>
                    </div>
                    <div class="info-text">
                        <h3>Điện thoại</h3>
                        <p>0123 456 789 (Hotline 24/7)</p>
                        <p>028 3844 5566 (Cửa hàng)</p>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon">
                        <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-mail"></use></svg>
                    </div>
                    <div class="info-text">
                        <h3>Email</h3>
                        <p>hello@floralhaven.com</p>
                        <p>support@floralhaven.com</p>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon">
                        <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-time"></use></svg>
                    </div>
                    <div class="info-text">
                        <h3>Giờ mở cửa</h3>
                        <p>Thứ 2 - Thứ 7: 08:00 - 21:00</p>
                        <p>Chủ nhật: 09:00 - 18:00</p>
                    </div>
                </div>
            </div>

            <!-- Form liên hệ -->
            <div class="contact-form-card">
                <c:if test="${not empty message}">
                    <div class="alert alert-success">
                        ${message}
                    </div>
                </c:if>
                
                <c:if test="${not empty error}">
                    <div class="alert alert-error">
                        ${error}
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/contact" method="POST">
                    <div class="form-group">
                        <label class="form-label">Họ và tên <span style="color: #970046;">*</span></label>
                        <input type="text" name="name" class="form-input" 
                               placeholder="Nhập tên của bạn..." 
                               value="${param.name}" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Địa chỉ Email <span style="color: #970046;">*</span></label>
                        <input type="email" name="email" class="form-input" 
                               placeholder="example@gmail.com" 
                               value="${param.email}" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Chủ đề</label>
                        <input type="text" name="subject" class="form-input" 
                               placeholder="Bạn cần hỗ trợ về việc gì?" 
                               value="${param.subject}">
                    </div>

                    <div class="form-group">
                        <label class="form-label">Lời nhắn <span style="color: #970046;">*</span></label>
                        <textarea name="content" class="form-textarea" 
                                  placeholder="Hãy viết lời nhắn của bạn tại đây..." 
                                  required>${param.content}</textarea>
                    </div>

                    <button type="submit" class="btn-contact">Gửi lời nhắn ngay</button>
                </form>
            </div>
        </div>

        <!-- Bản đồ -->
        <div class="map-container">
            <iframe 
                src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1862.6527229265264!2d105.874704!3d20.9803898!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135afd765487289%3A0x21bd5839ba683d5f!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBLaW5oIFThur8gS-G7uSBUaHXhuq10IEPDtG5nIE5naGnhu4dw!5e0!3m2!1sen!2s!4v1778422828170!5m2!1sen!2s"
                width="100%"
                height="100%" 
                style="border:0;" 
                allowfullscreen="" 
                loading="lazy" 
                referrerpolicy="no-referrer-when-downgrade">
            </iframe>
        </div>
    </div>
</main>
