# 🌸 Floral Haven - Premium Flower Boutique & Management System

[![Java Version](https://img.shields.io/badge/Java-8%2B-orange.svg)](https://www.oracle.com/java/)
[![Platform](https://img.shields.io/badge/Platform-Java%20EE-blue.svg)](https://javaee.github.io/)
[![Database](https://img.shields.io/badge/Database-MySQL-lightgrey.svg)](https://www.mysql.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

**Floral Haven** là một giải pháp thương mại điện tử toàn diện dành cho các cửa hàng hoa cao cấp. Ứng dụng không chỉ là một trang web bán hàng mà còn là một tác phẩm nghệ thuật kỹ thuật số, kết hợp giữa công nghệ Java Web mạnh mẽ và phong cách thiết kế hiện đại, sang trọng (Premium Aesthetic).

---

## 🌟 Tổng quan dự án

Dự án được xây dựng với mục tiêu mang lại trải nghiệm mua sắm hoa tươi trực tuyến tinh tế nhất. Từ giao diện người dùng mềm mại với hiệu ứng Glassmorphism đến hệ thống quản trị nội bộ tối ưu, Floral Haven đáp ứng đầy đủ nhu cầu của một doanh nghiệp hoa hiện đại.

### 🎨 Ngôn ngữ thiết kế
- **Phong cách:** Minimalist & Elegant.
- **Typography:** 
  - `Playfair Display`: Mang lại sự cổ điển, sang trọng cho các tiêu đề.
  - `Montserrat`: Đảm bảo sự hiện đại và dễ đọc cho nội dung chi tiết.
- **Màu sắc:** Sự kết hợp giữa Trắng tinh khiết, Xanh lá thiên nhiên và các tông màu Pastel dịu nhẹ.
- **Hiệu ứng:** Áp dụng Glassmorphism (hiệu ứng kính mờ) trên các thành phần UI để tạo chiều sâu và sự cao cấp.

---

## ✨ Tính năng nổi bật

### 👤 Trải nghiệm Khách hàng (User Experience)
*   **Giao diện Hero ấn tượng:** Banner chuyển động thu hút ngay từ cái nhìn đầu tiên.
*   **Duyệt sản phẩm thông minh:** Phân loại theo mục đích (Sinh nhật, Tình yêu, Khai trương, Cảm ơn...).
*   **Hệ thống Storytelling:** Mỗi bó hoa không chỉ là sản phẩm, mà còn mang một câu chuyện và ý nghĩa riêng được trình bày tinh tế.
*   **Giỏ hàng tương tác:** Cập nhật số lượng và tính toán giá trị đơn hàng thời gian thực.
*   **Thanh toán chuyên nghiệp:** Quy trình 3 bước (Thông tin -> Xác nhận -> Hoàn tất) rõ ràng.
*   **Quản lý tài khoản:** Lưu trữ lịch sử đơn hàng, thông tin cá nhân.
*   **Tìm kiếm & Lọc:** Bộ lọc sản phẩm mạnh mẽ giúp khách hàng nhanh chóng tìm được mẫu hoa ưng ý.

### 🔐 Quản trị hệ thống (Admin Management)
*   **Dashboard tổng quan:** Thống kê nhanh tình hình kinh doanh.
*   **Quản lý sản phẩm (CRUD):** Giao diện quản lý sản phẩm trực quan, hỗ trợ upload hình ảnh và chỉnh sửa chi tiết.
*   **Điều phối đơn hàng:** Theo dõi trạng thái đơn hàng, thông tin khách hàng và chi tiết các mặt hàng đã đặt.
*   **Quản lý danh mục:** Linh hoạt trong việc tổ chức các bộ sưu tập hoa theo mùa.
*   **Công cụ tìm kiếm Admin:** Tìm kiếm nhanh sản phẩm và đơn hàng theo nhiều tiêu chí.

---

## 🛠 Công nghệ & Kiến trúc

### Stack công nghệ
*   **Backend:** Java Servlet, JSP, JSTL.
*   **Cơ sở dữ liệu:** MySQL (Thiết kế chuẩn hóa để tối ưu hiệu suất).
*   **Frontend:** HTML5, Vanilla CSS, JavaScript (ES6+).
*   **Security:** Password hashing, Session management cho User & Admin.
*   **Build Tools:** Apache Ant (Tương thích tốt nhất với NetBeans).

### Mô hình MVC (Model-View-Controller)
Dự án tuân thủ nghiêm ngặt mô hình MVC để đảm bảo code sạch và dễ bảo trì:
- **Model:** Định nghĩa cấu trúc dữ liệu (`Product`, `Category`, `Order`, `User`).
- **View:** Các trang JSP được modular hóa thông qua các fragment (`header.jspf`, `footer.jspf`).
- **Controller:** Các Servlet điều hướng logic và xử lý nghiệp vụ.
- **DAO (Data Access Object):** Lớp trung gian thực hiện các truy vấn SQL an toàn.

---

## 📂 Cấu trúc thư mục chi tiết

```text
banhoa/
├── src/java/com/tiemhoa/
│   ├── controller/      # Các Controller (Servlets) xử lý request
│   │   ├── admin/       # Servlets cho phía Quản trị
│   │   └── user/        # Servlets cho phía Người dùng
│   ├── dao/             # Lớp truy xuất dữ liệu (DAO)
│   ├── model/           # Các lớp thực thể (Entity classes)
│   └── util/            # Tiện ích: Kết nối DB, Format tiền tệ, v.v.
├── web/
│   ├── admin/           # Giao diện và logic dành riêng cho Admin
│   ├── assets/          # Tài nguyên tĩnh
│   │   ├── css/         # Hệ thống stylesheet chi tiết cho từng module
│   │   ├── js/          # Các script xử lý tương tác UI
│   │   └── images/      # Thư viện hình ảnh sản phẩm chất lượng cao
│   ├── includes/        # Các tệp JSP dùng chung (Navigation, Footer, Menu)
│   ├── pages/           # Các trang nội dung JSP (Product Detail, Cart, Checkout)
│   └── index.jsp        # Entry point của ứng dụng
└── build.xml            # Cấu hình Ant build
```

---

## 🚀 Hướng dẫn cài đặt & Khởi chạy

### 1. Yêu cầu hệ thống
*   **Java JDK:** 8 hoặc 11 (Khuyến khích).
*   **IDE:** NetBeans IDE (8.2 hoặc mới hơn).
*   **Server:** GlassFish Server (4.1.1+) hoặc Apache Tomcat.
*   **Database:** MySQL Server 5.7 hoặc 8.0.

### 2. Thiết lập Cơ sở dữ liệu
1. Mở MySQL Workbench hoặc CLI.
2. Tạo database: `CREATE DATABASE tiemhoa CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;`
3. Import dữ liệu: Chạy file `scratch/import_data.sql` và `scratch/seed_others.sql`.
4. Cấu hình kết nối: Chỉnh sửa thông số trong `src/java/com/tiemhoa/util/DBConnection.java`.

### 3. Triển khai ứng dụng
1. Mở dự án trong NetBeans.
2. Chuột phải vào Project -> **Clean and Build**.
3. Chuột phải -> **Run**. 
4. Truy cập: `http://localhost:8080/banhoa/`

---

## 📅 Lộ trình phát triển (Roadmap)
- [ ] Tích hợp thanh toán trực tuyến qua cổng VNPay/Momo.
- [ ] Hệ thống thông báo đơn hàng qua Email (JavaMail API).
- [ ] Áp dụng AI để gợi ý hoa dựa trên sở thích khách hàng.
- [ ] Phát triển phiên bản Mobile App đồng bộ.

---

## 👥 Đội ngũ & Liên hệ
*   **Chủ dự án:** Ngọc Chi (ASUS)
*   **Email:** [Email của bạn]
*   **GitHub:** [Link GitHub của bạn]

---
*Dự án được thực hiện với sự tâm huyết nhằm mang cái đẹp của hoa tươi đến gần hơn với mọi người thông qua công nghệ.* 🌸
