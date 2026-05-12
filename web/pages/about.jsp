<%-- Document : about Created on : May 10, 2026, 8:58:35 PM Author : antigravity
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/assets/css/about.css"
/>

<main class="about-container">
  <div class="container">
    <!-- Hero Section -->
    <section class="about-hero">
      <h1>Lan tỏa yêu thương qua từng cánh hoa</h1>
      <p>
        Floral Haven không chỉ là một cửa hàng hoa, mà là nơi lưu giữ những xúc
        cảm chân thành và tinh tế nhất của bạn.
      </p>
    </section>

    <!-- Story Section -->
    <section class="story-grid">
      <div class="story-image">
        <img
          src="${pageContext.request.contextPath}/assets/images/about_hero_flower.png"
          alt="Floral Haven Workshop"
        />
      </div>
      <div class="story-content">
        <h2>Câu chuyện của chúng tôi</h2>
        <p>
          Khởi nguồn từ niềm đam mê với vẻ đẹp thuần khiết của thiên nhiên,
          Floral Haven ra đời với sứ mệnh mang nghệ thuật hoa tươi đến gần hơn
          với cuộc sống hiện đại.
        </p>
        <p>
          Chúng tôi tin rằng mỗi bông hoa đều mang trong mình một ngôn ngữ
          riêng, một câu chuyện riêng. Đó là lý do tại sao mỗi sản phẩm tại
          Floral Haven đều được chăm chút tỉ mỉ bởi đôi bàn tay của những nghệ
          nhân tâm huyết nhất.
        </p>
        <p>
          Với phong cách <strong>Poetic Minimalism</strong> (Tối giản đầy chất
          thơ), chúng tôi tôn vinh vẻ đẹp tự nhiên nhất của hoa, tạo nên những
          thiết kế không chỉ đẹp mà còn mang chiều sâu cảm xúc.
        </p>
      </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-banner">
      <div class="stat-item">
        <h3>5+</h3>
        <p>Năm kinh nghiệm</p>
      </div>
      <div class="stat-item">
        <h3>10k+</h3>
        <p>Khách hàng tin yêu</p>
      </div>
      <div class="stat-item">
        <h3>50+</h3>
        <p>Nghệ nhân cắm hoa</p>
      </div>
      <div class="stat-item">
        <h3>100%</h3>
        <p>Hoa tươi mỗi ngày</p>
      </div>
    </section>

    <!-- Mission Section -->
    <section class="story-grid" style="direction: rtl">
      <div class="story-image">
        <img
          src="${pageContext.request.contextPath}/assets/images/florist_working.png"
          alt="Our Mission"
        />
      </div>
      <div class="story-content" style="direction: ltr">
        <h2>Tầm nhìn & Sứ mệnh</h2>
        <p>
          Chúng tôi hướng đến việc trở thành thương hiệu hoa tươi cao cấp hàng
          đầu, nơi khách hàng tìm thấy sự an yên và cảm hứng qua từng tác phẩm
          nghệ thuật.
        </p>
        <p>
          Sứ mệnh của chúng tôi là kết nối mọi người thông qua vẻ đẹp của hoa,
          làm cho mỗi dịp kỷ niệm trở nên đáng nhớ và mỗi không gian sống trở
          nên rực rỡ hơn.
        </p>
        <p>Cam kết của Floral Haven:</p>
        <ul style="margin-left: 50px">
          <li>Chất lượng hoa tươi đạt chuẩn quốc tế.</li>
          <li>Sáng tạo không ngừng trong từng thiết kế.</li>
          <li>Dịch vụ chăm sóc khách hàng tận tâm và chuyên nghiệp.</li>
        </ul>
      </div>
    </section>

    <!-- Team Section -->
    <section class="team-section">
      <h2 class="team-title">Đội ngũ nghệ nhân</h2>
      <div class="team-grid">
        <div class="team-card">
          <div class="avatar-wrapper">
            <img
              src="${pageContext.request.contextPath}/assets/images/ngocchi.jpg"
              alt="Ngọc Chi"
              class="team-avatar"
            />
          </div>
          <h4 class="member-name">Ngọc Chi</h4>
          <p class="member-role">Creative Director</p>
        </div>
        <div class="team-card">
          <div class="avatar-wrapper">
            <img
              src="${pageContext.request.contextPath}/assets/images/tungduong.jpg"
              alt="Tùng Dương"
              class="team-avatar"
            />
          </div>
          <h4 class="member-name">Tùng Dương</h4>
          <p class="member-role">Master Florist</p>
        </div>
        <div class="team-card">
          <div class="avatar-wrapper">
            <img
              src="${pageContext.request.contextPath}/assets/images/lanhuong.jpg"
              alt="Lan Hương"
              class="team-avatar"
            />
          </div>
          <h4 class="member-name">Lan Hương</h4>
          <p class="member-role">Botanist</p>
        </div>
        <div class="team-card">
          <div class="avatar-wrapper">
            <img
              src="${pageContext.request.contextPath}/assets/images/huudung.jpg"
              alt="Hữu Dũng"
              class="team-avatar"
            />
          </div>
          <h4 class="member-name">Hữu Dũng</h4>
          <p class="member-role">Stylist</p>
        </div>
      </div>
    </section>
  </div>
</main>
