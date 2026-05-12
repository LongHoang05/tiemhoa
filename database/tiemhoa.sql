-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 12, 2026 lúc 06:37 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tiemhoa`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`) VALUES
(1, 'Hoa Tình Yêu', 'Các bó hoa dành cho cặp đôi, kỷ niệm'),
(2, 'Hoa Khai Trương', 'Lẵng hoa chúc mừng sự kiện, khai trương'),
(3, 'Hoa Sinh Nhật', 'Quà tặng sinh nhật ý nghĩa'),
(4, 'Hoa Tốt Nghiệp', 'Bó hoa chúc mừng tân cử nhân, lễ tốt nghiệp'),
(5, 'Hoa Cưới', 'Bó hoa cầm tay cô dâu rạng rỡ'),
(6, 'Phụ kiện', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `contact_id` int(11) NOT NULL,
  `sender_name` varchar(100) NOT NULL,
  `sender_email` varchar(100) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `contacts`
--

INSERT INTO `contacts` (`contact_id`, `sender_name`, `sender_email`, `subject`, `message`, `created_at`) VALUES
(1, 'Long Hoàng', 'longhoang@gmail.com', 'Tư vấn hoa cưới', 'Chào shop, mình muốn đặt hoa trang trí cho đám cưới nhé.', '2026-05-12 04:36:33'),
(2, 'Ngọc Linh', 'ngoclinh@gmail.com', 'Cách chăm sóc hoa Lan', 'Hoa Lan mình mua về nhanh héo quá shop ơi.', '2026-05-12 04:36:33'),
(3, 'Vũ Trường', 'vutruong@gmail.com', 'Góp ý về giao hàng', 'Shipper rất nhiệt tình, hoa đẹp lắm!', '2026-05-12 04:36:33'),
(4, 'Trần Thảo', 'tranthao@gmail.com', 'Đặt hoa số lượng lớn', 'Mình muốn đặt 50 bó mini cho sự kiện công ty.', '2026-05-12 04:36:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `order_note` text DEFAULT NULL,
  `status` varchar(50) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `recipient_name` varchar(100) DEFAULT NULL,
  `recipient_phone` varchar(20) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `total_amount`, `shipping_address`, `order_note`, `status`, `created_at`, `recipient_name`, `recipient_phone`, `payment_method`) VALUES
(1, 2, 2800000.00, 'Hà Nội', 'Giao gấp buổi sáng', 'Hoàn Thành', '2026-05-10 03:00:00', 'Long Hoàng', '0988111222', 'COD'),
(2, 3, 3850000.00, 'Hà Nội', 'Hoa tươi nhất có thể nhé', 'Hoàn Thành', '2026-05-10 04:00:00', 'Hồ Thị Lan Hương', '0988333444', 'Chuyển khoản'),
(3, 4, 1200000.00, 'Hà Nội', 'Gói quà đẹp tặng bạn', 'Đang Xử Lý', '2026-05-11 02:00:00', 'Lý Linh', '0988555666', 'COD'),
(4, 5, 1770000.00, 'Hà Nội', 'Giao sau 5h chiều', 'Hoàn Thành', '2026-05-11 08:30:00', 'Ngọc Linh', '0988777888', 'Chuyển khoản'),
(5, 6, 590000.00, 'Hà Nội', 'Cắt bớt cành giúp mình', 'Đang Xử Lý', '2026-05-12 01:20:00', 'Ngọcc Chii', '0988999000', 'COD'),
(6, 7, 2100000.00, 'Hà Nội', 'Thiệp: Chúc mừng sinh nhật', 'Hoàn Thành', '2026-05-12 03:00:00', 'Nguyễn Dương', '0988222333', 'COD'),
(7, 8, 650000.00, 'TP. Hồ Chí Minh', 'Giao hỏa tốc', 'Đã Hủy', '2026-05-09 06:00:00', 'Hữu Dũng', '0912345678', 'Chuyển khoản'),
(8, 9, 1440000.00, 'Đà Nẵng', 'Hoa tone cam nhé shop', 'Hoàn Thành', '2026-05-10 09:45:00', 'Trần Thảo', '0912444555', 'COD'),
(9, 10, 1740000.00, 'Hải Phòng', 'Giao đến văn phòng', 'Đang Xử Lý', '2026-05-11 03:15:00', 'Trương Huy Đông', '0912666777', 'COD'),
(10, 11, 1350000.00, 'Cần Thơ', 'Gọi trước khi giao', 'Hoàn Thành', '2026-05-12 00:00:00', 'Vũ Trường', '0912888999', 'Chuyển khoản');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `detail_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`detail_id`, `order_id`, `product_id`, `quantity`, `unit_price`) VALUES
(1, 1, 400, 2, 1400000.00),
(2, 2, 401, 1, 2500000.00),
(3, 2, 426, 1, 1350000.00),
(4, 3, 402, 1, 1200000.00),
(5, 4, 403, 3, 590000.00),
(6, 5, 403, 1, 590000.00),
(7, 6, 414, 2, 1050000.00),
(8, 7, 405, 5, 130000.00),
(9, 8, 467, 2, 720000.00),
(10, 9, 412, 6, 290000.00),
(11, 10, 486, 1, 1350000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `image_url` varchar(255) DEFAULT 'default_flower.jpg',
  `description` text DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT 20,
  `category_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `story_text` text DEFAULT NULL,
  `story_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `name`, `price`, `image_url`, `description`, `stock_quantity`, `category_id`, `is_active`, `story_text`, `story_image`) VALUES
(400, 'Bó Peony mix style Garden - Mix sơ và giấy xé', 1400000.00, 'bo-peony-mix-style-garden-mix-so-va-giay-xe.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-peony-mix-style-garden-mix-so-va-giay-xe.jpg'),
(401, 'Bó hoa 99 bông hồng đỏ (bó cắm cốt xốp ẩm)', 2500000.00, 'bo-hoa-99-bong-hong-do-bo-cam-cot-xop-am.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Không có món quà nào lãng mạn hơn một bó hoa bất ngờ. Hãy để những cánh hoa này thay vạn lời yêu thương chưa nói.', 'bo-hoa-99-bong-hong-do-bo-cam-cot-xop-am.jpg'),
(402, 'Bó hồng trái tim (mix hồng đỏ và trắng) - Size 50-60 bông', 1200000.00, 'bo-hong-trai-tim-mix-hong-do-va-trang-size-50-60-bong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-trai-tim-mix-hong-do-va-trang-size-50-60-bong.jpg'),
(403, 'Bó cúc mẫu đơn nâu 5b mix hoa lá phụ', 590000.00, 'bo-cuc-mau-don-nau-5b-mix-hoa-la-phu.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-cuc-mau-don-nau-5b-mix-hoa-la-phu.jpg'),
(404, 'Bó hoa Delphin trắng mix', 350000.00, 'bo-hoa-delphin-trang-mix.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-delphin-trang-mix.jpg'),
(405, 'Bó mini Hướng dương mix tana', 130000.00, 'bo-mini-huong-duong-mix-tana.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-mini-huong-duong-mix-tana.jpg'),
(406, 'Bó hoa tulip hồng nhạt giấy vân đá - Size 10 Bông', 800000.00, 'bo-hoa-tulip-hong-nhat-giay-van-da-size-10-bong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Ánh mắt trao nhau, nụ cười hé mở... Đóa hoa này là một nốt nhạc ngọt ngào trong bản tình ca của hai chúng ta.', 'bo-hoa-tulip-hong-nhat-giay-van-da-size-10-bong.jpg'),
(407, 'Bó ốc quế tốt nghiệp - Tone cam', 350000.00, 'bo-oc-que-tot-nghiep-tone-cam.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-oc-que-tot-nghiep-tone-cam.jpg'),
(408, 'Bó hoa Puddle trắng (Panxe)', 280000.00, 'bo-hoa-puddle-trang-panxe.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Ánh mắt trao nhau, nụ cười hé mở... Đóa hoa này là một nốt nhạc ngọt ngào trong bản tình ca của hai chúng ta.', 'bo-hoa-puddle-trang-panxe.jpg'),
(409, 'Hồng Julibe hồng bó Size S', 290000.00, 'hong-julibe-hong-bo-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'hong-julibe-hong-bo-size-s.jpg'),
(410, 'Bó tú cầu hồng - 1 cành', 280000.00, 'bo-tu-cau-hong-1-canh.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-tu-cau-hong-1-canh.jpg'),
(411, 'Bó kem dâu mix baby - Size S', 290000.00, 'bo-kem-dau-mix-baby-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-kem-dau-mix-baby-size-s.jpg'),
(412, 'Bó hồng kem dâu mix baby - Ốc quế', 420000.00, 'bo-hong-kem-dau-mix-baby-oc-que.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-kem-dau-mix-baby-oc-que.jpg'),
(413, 'Bó hồng London dáng vát', 690000.00, 'bo-hong-london-dang-vat.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Tình yêu đích thực giống như loài hoa quý, cần sự nâng niu và chăm sóc mỗi ngày để mãi mãi tỏa ngát hương thơm.', 'bo-hong-london-dang-vat.jpg'),
(414, 'Bó hoa ly hồng - Size L', 1200000.00, 'bo-hoa-ly-hong-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Sự lãng mạn không cần phải quá cầu kỳ. Đôi khi, chỉ một bó hoa tươi thắm cũng đủ để thắp sáng nụ cười của người bạn yêu thương.', 'bo-hoa-ly-hong-size-l.jpg'),
(415, 'Bó cẩm tú cầu hồng 5b mix baby và lá bạc', 1200000.00, 'bo-cam-tu-cau-hong-5b-mix-baby-va-la-bac.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-cam-tu-cau-hong-5b-mix-baby-va-la-bac.jpg'),
(416, 'Bó Hồng đỏ Explorer Đà Lạt mix Cỏ thép', 950000.00, 'bo-hong-do-explorer-da-lat-mix-co-thep.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-do-explorer-da-lat-mix-co-thep.jpg'),
(417, 'Hoàng tử Bé - Bó hồng trắng mix 1 bông hồng đỏ duy nhất - Giấy đỏ', 580000.00, 'hoang-tu-be-bo-hong-trang-mix-1-bong-hong-do-duy-nhat-giay-do.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'hoang-tu-be-bo-hong-trang-mix-1-bong-hong-do-duy-nhat-giay-do.jpg'),
(418, 'Hoàng tử Bé - Bó hồng trắng mix 1 bông hồng đỏ duy nhất - Bó tròn trắng', 580000.00, 'hoang-tu-be-bo-hong-trang-mix-1-bong-hong-do-duy-nhat-bo-tron-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'hoang-tu-be-bo-hong-trang-mix-1-bong-hong-do-duy-nhat-bo-tron-trang.jpg'),
(419, 'Hoàng tử Bé - Bó hồng trắng mix 1 bông hồng đỏ duy nhất - Giấy bóng kính', 580000.00, 'hoang-tu-be-bo-hong-trang-mix-1-bong-hong-do-duy-nhat-giay-bong-kinh.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'hoang-tu-be-bo-hong-trang-mix-1-bong-hong-do-duy-nhat-giay-bong-kinh.jpg'),
(420, 'Peony mix Twinkle Orchid', 1400000.00, 'peony-mix-twinkle-orchid.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'peony-mix-twinkle-orchid.jpg'),
(421, 'Set Hồng Ohara mix lá - Size S', 380000.00, 'set-hong-ohara-mix-la-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'set-hong-ohara-mix-la-size-s.jpg'),
(422, 'Ốc quế thỏ tone Blue - Size S', 390000.00, 'oc-que-tho-tone-blue-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Giữa hàng vạn người lướt qua nhau, ta tìm thấy nhau. Đóa hoa này là món quà dành tặng cho sự diệu kỳ của nhân duyên.', 'oc-que-tho-tone-blue-size-s.jpg'),
(423, 'Bó Tú cầu hồng - 10 cành', 2000000.00, 'bo-tu-cau-hong-10-canh.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-tu-cau-hong-10-canh.jpg'),
(424, 'Bó Tú cầu trắng - 10 cành', 2000000.00, 'bo-tu-cau-trang-10-canh.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-tu-cau-trang-10-canh.jpg'),
(425, 'Set Tulip Đỏ - (19-20B)', 1350000.00, 'set-tulip-do-19-20b.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 0, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'set-tulip-do-19-20b.jpg'),
(426, 'Set Tulip Đỏ - (19-20B)', 1350000.00, 'set-tulip-do-19-20b.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Không có món quà nào lãng mạn hơn một bó hoa bất ngờ. Hãy để những cánh hoa này thay vạn lời yêu thương chưa nói.', 'set-tulip-do-19-20b.jpg'),
(427, 'Set hồng đỏ mix lá - Size S (10-12B)', 380000.00, 'set-hong-do-mix-la-size-s-10-12b.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'set-hong-do-mix-la-size-s-10-12b.jpg'),
(428, 'Bó hoa thỏ nhỏ mix sao xanh', 380000.00, 'bo-hoa-tho-nho-mix-sao-xanh.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-tho-nho-mix-sao-xanh.jpg'),
(429, 'Bó hoa thỏ nhỏ tone hồng', 380000.00, 'bo-hoa-tho-nho-tone-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Giữa hàng vạn người lướt qua nhau, ta tìm thấy nhau. Đóa hoa này là món quà dành tặng cho sự diệu kỳ của nhân duyên.', 'bo-hoa-tho-nho-tone-hong.jpg'),
(430, 'Ốc quế Meo Meo', 360000.00, 'oc-que-meo-meo.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Tình yêu đích thực giống như loài hoa quý, cần sự nâng niu và chăm sóc mỗi ngày để mãi mãi tỏa ngát hương thơm.', 'oc-que-meo-meo.jpg'),
(431, 'Bó hoa ly hồng mix - Size L', 1050000.00, 'bo-hoa-ly-hong-mix-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-ly-hong-mix-size-l.jpg'),
(432, 'Mini Pink O\'hara Bouquet mix kèm hoa', 155000.00, 'mini-pink-o-hara-bouquet-mix-kem-hoa.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'mini-pink-o-hara-bouquet-mix-kem-hoa.jpg'),
(433, 'Bó ốc quế mini Tulip mix', 180000.00, 'bo-oc-que-mini-tulip-mix.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-oc-que-mini-tulip-mix.jpg'),
(434, 'Bó hoa ốc quế Thỏ hồng Mini', 135000.00, 'bo-hoa-oc-que-tho-hong-mini.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'bo-hoa-oc-que-tho-hong-mini.jpg'),
(435, 'Tú cầu trắng mix hoa phụ - Bó Mini', 250000.00, 'tu-cau-trang-mix-hoa-phu-bo-mini.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'tu-cau-trang-mix-hoa-phu-bo-mini.jpg'),
(436, 'Tú cầu xanh Đà Lạt', 129000.00, 'tu-cau-xanh-da-lat.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'tu-cau-xanh-da-lat.jpg'),
(437, 'Hướng Dương Mix Baby (Mini)', 130000.00, 'huong-duong-mix-baby-mini.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'huong-duong-mix-baby-mini.jpg'),
(438, 'Bó ốc quế mini hoa đồng tiền', 180000.00, 'bo-oc-que-mini-hoa-dong-tien.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'bo-oc-que-mini-hoa-dong-tien.jpg'),
(439, 'Tú cầu xanh Đà Lạt - Bó Mini', 150000.00, 'tu-cau-xanh-da-lat-bo-mini.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'tu-cau-xanh-da-lat-bo-mini.jpg'),
(440, 'Mini Pink O\'hara Bouquet', 120000.00, 'mini-pink-o-hara-bouquet.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Ánh mắt trao nhau, nụ cười hé mở... Đóa hoa này là một nốt nhạc ngọt ngào trong bản tình ca của hai chúng ta.', 'mini-pink-o-hara-bouquet.jpg'),
(441, 'Tú cầu trắng Đà Lạt - Mini', 180000.00, 'tu-cau-trang-da-lat-mini.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'tu-cau-trang-da-lat-mini.jpg'),
(442, 'Bó hoa mini hoa lan tường', 125000.00, 'bo-hoa-mini-hoa-lan-tuong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'bo-hoa-mini-hoa-lan-tuong.jpg'),
(443, 'Bó hoa thỏ trắng mix cúc tana mini', 135000.00, 'bo-hoa-tho-trang-mix-cuc-tana-mini.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-tho-trang-mix-cuc-tana-mini.jpg'),
(444, 'Bó ốc quế mini hồng đỏ', 120000.00, 'bo-oc-que-mini-hong-do.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Ánh mắt trao nhau, nụ cười hé mở... Đóa hoa này là một nốt nhạc ngọt ngào trong bản tình ca của hai chúng ta.', 'bo-oc-que-mini-hong-do.jpg'),
(445, 'Bó hồng trắng mix Mini', 125000.00, 'bo-hong-trang-mix-mini.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-trang-mix-mini.jpg'),
(446, 'Cappuccino Rose - Single Rose', 89000.00, 'cappuccino-rose-single-rose.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Tình yêu đích thực giống như loài hoa quý, cần sự nâng niu và chăm sóc mỗi ngày để mãi mãi tỏa ngát hương thơm.', 'cappuccino-rose-single-rose.jpg'),
(447, 'Single Sunflower', 79000.00, 'single-sunflower.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'single-sunflower.jpg'),
(448, 'White Tulip - Mini Bouquet', 150000.00, 'white-tulip-mini-bouquet.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'white-tulip-mini-bouquet.jpg'),
(449, 'White Tulip - Mini Bouquet', 150000.00, 'white-tulip-mini-bouquet.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'white-tulip-mini-bouquet.jpg'),
(450, 'Bó hoa Mini Tốt nghiệp cúc Ping pong', 135000.00, 'bo-hoa-mini-tot-nghiep-cuc-ping-pong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-hoa-mini-tot-nghiep-cuc-ping-pong.jpg'),
(451, 'Tulip hồng nhạt - Mini Bouquet', 150000.00, 'tulip-hong-nhat-mini-bouquet.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'tulip-hong-nhat-mini-bouquet.jpg'),
(452, 'Mini Tana Bouquet', 120000.00, 'mini-tana-bouquet.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Yêu là trao đi không mưu cầu nhận lại, cũng như đóa hoa này dâng hiến hương sắc để làm đẹp cho đời.', 'mini-tana-bouquet.jpg'),
(453, 'Mini Red Rose Bouquet', 120000.00, 'mini-red-rose-bouquet.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Sự lãng mạn không cần phải quá cầu kỳ. Đôi khi, chỉ một bó hoa tươi thắm cũng đủ để thắp sáng nụ cười của người bạn yêu thương.', 'mini-red-rose-bouquet.jpg'),
(454, 'Purple Tulip - Mini Bouquet', 150000.00, 'purple-tulip-mini-bouquet.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'purple-tulip-mini-bouquet.jpg'),
(455, 'Single Rose - Bó 1 bông Hoa hồng', 75000.00, 'single-rose-bo-1-bong-hoa-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Sự lãng mạn không cần phải quá cầu kỳ. Đôi khi, chỉ một bó hoa tươi thắm cũng đủ để thắp sáng nụ cười của người bạn yêu thương.', 'single-rose-bo-1-bong-hoa-hong.jpg'),
(456, 'White Tulip - Mini Bouquet', 150000.00, 'white-tulip-mini-bouquet.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Mỗi đóa hoa tại Floral Haven đều mang một thông điệp tình yêu duy nhất, được gửi gắm qua từng nhánh lá và hương thơm nhẹ nhàng.', 'white-tulip-mini-bouquet.jpg'),
(457, 'Bó hoa hướng dương mix - Size S', 180000.00, 'bo-hoa-huong-duong-mix-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-hoa-huong-duong-mix-size-s.jpg'),
(458, 'Latte Spray Roses - Bó hoa mix size M', 450000.00, 'latte-spray-roses-bo-hoa-mix-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'latte-spray-roses-bo-hoa-mix-size-m.jpg'),
(459, 'Bó hoa ly xanh mix - Size M', 650000.00, 'bo-hoa-ly-xanh-mix-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-ly-xanh-mix-size-m.jpg'),
(460, 'Garden of Ophelia - Bó hoa sắc màu từ hoa nhập khẩu', 2000000.00, 'garden-of-ophelia-bo-hoa-sac-mau-tu-hoa-nhap-khau.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Mỗi đóa hoa tại Floral Haven đều mang một thông điệp tình yêu duy nhất, được gửi gắm qua từng nhánh lá và hương thơm nhẹ nhàng.', 'garden-of-ophelia-bo-hoa-sac-mau-tu-hoa-nhap-khau.jpg'),
(461, 'Bó hoa tone hồng mix màu sắc - Size M (hoa mix màu theo mùa)', 680000.00, 'bo-hoa-tone-hong-mix-mau-sac-size-m-hoa-mix-mau-theo-mua.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-tone-hong-mix-mau-sac-size-m-hoa-mix-mau-theo-mua.jpg'),
(462, 'Bó hoa tone hồng pastel - gói Style Hàn Quốc - Size M+', 590000.00, 'bo-hoa-tone-hong-pastel-goi-style-han-quoc-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Yêu là trao đi không mưu cầu nhận lại, cũng như đóa hoa này dâng hiến hương sắc để làm đẹp cho đời.', 'bo-hoa-tone-hong-pastel-goi-style-han-quoc-size-m.jpg'),
(463, 'Bó hồng đỏ mix trắng - Size M', 520000.00, 'bo-hong-do-mix-trang-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-do-mix-trang-size-m.jpg'),
(464, 'Bó hoa Tú cầu trắng dáng tròn', 890000.00, 'bo-hoa-tu-cau-trang-dang-tron.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-hoa-tu-cau-trang-dang-tron.jpg'),
(465, 'Orchid Sunset - Size M - Giấy Xé', 699000.00, 'orchid-sunset-size-m-giay-xe.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Mỗi đóa hoa tại Floral Haven đều mang một thông điệp tình yêu duy nhất, được gửi gắm qua từng nhánh lá và hương thơm nhẹ nhàng.', 'orchid-sunset-size-m-giay-xe.jpg'),
(466, 'Bó tulip mix (cam, vàng, trắng) và hoa phụ (bó 15b mix)', 1215000.00, 'bo-tulip-mix-cam-vang-trang-va-hoa-phu-bo-15b-mix.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-tulip-mix-cam-vang-trang-va-hoa-phu-bo-15b-mix.jpg'),
(467, 'Bó tulip mix Cam vàng - Set 10B', 720000.00, 'bo-tulip-mix-cam-vang-set-10b.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-tulip-mix-cam-vang-set-10b.jpg'),
(468, 'Violet Mix Signature - Size M+ (Panxe tím)', 650000.00, 'violet-mix-signature-size-m-panxe-tim.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'violet-mix-signature-size-m-panxe-tim.jpg'),
(469, 'Bó hoa ly hồng mix - size M', 520000.00, 'bo-hoa-ly-hong-mix-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-ly-hong-mix-size-m.jpg'),
(470, 'Bó hồng đỏ mix tulip size M', 890000.00, 'bo-hong-do-mix-tulip-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-do-mix-tulip-size-m.jpg'),
(471, 'Cosmic Iris & Lily Bloom', 1000000.00, 'cosmic-iris-lily-bloom.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Em là đóa hoa đẹp nhất trong khu vườn trái tim anh. Gửi tặng em bó hoa này như một minh chứng cho tình yêu vĩnh cửu.', 'cosmic-iris-lily-bloom.jpg'),
(472, 'Bó hồng đỏ mix nơ đỏ - 8 Bông', 420000.00, 'bo-hong-do-mix-no-do-8-bong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-do-mix-no-do-8-bong.jpg'),
(473, 'FS BOX - Bó hồng Ohara mix cúc bách nhật (set kèm hộp)', 620000.00, 'fs-box-bo-hong-ohara-mix-cuc-bach-nhat-set-kem-hop.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'fs-box-bo-hong-ohara-mix-cuc-bach-nhat-set-kem-hop.jpg'),
(474, 'FS BOX - Bó hoa ly xanh blue mix (Set kèm hộp)', 650000.00, 'fs-box-bo-hoa-ly-xanh-blue-mix-set-kem-hop.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'fs-box-bo-hoa-ly-xanh-blue-mix-set-kem-hop.jpg'),
(475, 'Ocean Twilight Bouquet - Bó hoa mix tone Tím xanh đậm', 1150000.00, 'ocean-twilight-bouquet-bo-hoa-mix-tone-tim-xanh-dam.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'ocean-twilight-bouquet-bo-hoa-mix-tone-tim-xanh-dam.jpg'),
(476, 'FS BOX - Bó hoa size M (tone hồng vàng) - Set kèm hộp', 650070.00, 'fs-box-bo-hoa-size-m-tone-hong-vang-set-kem-hop.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'fs-box-bo-hoa-size-m-tone-hong-vang-set-kem-hop.jpg'),
(477, 'Orchid Sunset - Butterfly', 650000.00, 'orchid-sunset-butterfly.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'orchid-sunset-butterfly.jpg'),
(478, 'Tulip hồng nhạt - bó 20 bông', 1350000.00, 'tulip-hong-nhat-bo-20-bong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Giữa hàng vạn người lướt qua nhau, ta tìm thấy nhau. Đóa hoa này là món quà dành tặng cho sự diệu kỳ của nhân duyên.', 'tulip-hong-nhat-bo-20-bong.jpg'),
(479, 'Bó hồng đỏ Red Naomi mix nơ đỏ - 40 Bông', 1800000.00, 'bo-hong-do-red-naomi-mix-no-do-40-bong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-do-red-naomi-mix-no-do-40-bong.jpg'),
(480, 'Bó 99 bông hồng kem dâu', 2000000.00, 'bo-99-bong-hong-kem-dau.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Em là đóa hoa đẹp nhất trong khu vườn trái tim anh. Gửi tặng em bó hoa này như một minh chứng cho tình yêu vĩnh cửu.', 'bo-99-bong-hong-kem-dau.jpg'),
(481, 'Bó 100 bông Blue Rose - Hoa hồng phớt xanh blue', 2500000.00, 'bo-100-bong-blue-rose-hoa-hong-phot-xanh-blue.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Mỗi đóa hoa tại Floral Haven đều mang một thông điệp tình yêu duy nhất, được gửi gắm qua từng nhánh lá và hương thơm nhẹ nhàng.', 'bo-100-bong-blue-rose-hoa-hong-phot-xanh-blue.jpg'),
(482, 'Peach & Pink Dream Bouquet - Bó hoa mix nhiều loại tone Hồng Cam', 2000000.00, 'peach-pink-dream-bouquet-bo-hoa-mix-nhieu-loai-tone-hong-cam.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'peach-pink-dream-bouquet-bo-hoa-mix-nhieu-loai-tone-hong-cam.jpg'),
(483, 'Bó hồng Ohara 70B', 3000000.00, 'bo-hong-ohara-70b.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Ánh mắt trao nhau, nụ cười hé mở... Đóa hoa này là một nốt nhạc ngọt ngào trong bản tình ca của hai chúng ta.', 'bo-hong-ohara-70b.jpg'),
(484, 'Bó tú cầu xanh 5b mix hoa lá phụ', 1200000.00, 'bo-tu-cau-xanh-5b-mix-hoa-la-phu.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-tu-cau-xanh-5b-mix-hoa-la-phu.jpg'),
(485, 'Bó hồng đỏ mix ohara và lan tường', 2000000.00, 'bo-hong-do-mix-ohara-va-lan-tuong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-do-mix-ohara-va-lan-tuong.jpg'),
(486, 'Bó hoa Tulip Hồng Trắng - Super Big Size', 3150000.00, 'bo-hoa-tulip-hong-trang-super-big-size.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'bo-hoa-tulip-hong-trang-super-big-size.jpg'),
(487, 'Bó Hồng Ohara mix Tulip trắng và hoa lá phụ', 2070000.00, 'bo-hong-ohara-mix-tulip-trang-va-hoa-la-phu.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-ohara-mix-tulip-trang-va-hoa-la-phu.jpg'),
(488, 'Bó mix nhiều loại hoa tone hồng - Style garden - Size L', 1200000.00, 'bo-mix-nhieu-loai-hoa-tone-hong-style-garden-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-mix-nhieu-loai-hoa-tone-hong-style-garden-size-l.jpg'),
(489, 'Bó hoa tú cầu hồng mix tulip và hoa phụ  trắng - Super Big Size', 2000000.00, 'bo-hoa-tu-cau-hong-mix-tulip-va-hoa-phu-trang-super-big-size.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-hoa-tu-cau-hong-mix-tulip-va-hoa-phu-trang-super-big-size.jpg'),
(490, 'Bó hoa Cúc Mẫu đơn màu Cam (10b mix hoa phụ) - Super Big Size', 1250000.00, 'bo-hoa-cuc-mau-don-mau-cam-10b-mix-hoa-phu-super-big-size.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuc-mau-don-mau-cam-10b-mix-hoa-phu-super-big-size.jpg'),
(491, 'Cúc Mẫu đơn Cafe 10b mix hoa phụ - Super Big Size', 1250000.00, 'cuc-mau-don-cafe-10b-mix-hoa-phu-super-big-size.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'cuc-mau-don-cafe-10b-mix-hoa-phu-super-big-size.jpg'),
(492, 'Cúc Mẫu đơn Cafe mix tone nâu - Super Big Size', 1250000.00, 'cuc-mau-don-cafe-mix-tone-nau-super-big-size.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'cuc-mau-don-cafe-mix-tone-nau-super-big-size.jpg'),
(493, 'Bó hoa Tulip Cam Trắng - Super Big Size', 3500000.00, 'bo-hoa-tulip-cam-trang-super-big-size.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'bo-hoa-tulip-cam-trang-super-big-size.jpg'),
(494, 'Bó Tulip mix 3 màu - Set 20 bông', 1440000.00, 'bo-tulip-mix-3-mau-set-20-bong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-tulip-mix-3-mau-set-20-bong.jpg'),
(495, 'Tú cầu hồng mix (Blue) - Big Size', 1200000.00, 'tu-cau-hong-mix-blue-big-size.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'tu-cau-hong-mix-blue-big-size.jpg'),
(496, 'Bó hoa tú cầu xanh - trắng', 1500000.00, 'bo-hoa-tu-cau-xanh-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-hoa-tu-cau-xanh-trang.jpg'),
(497, 'Bó hồng đỏ Đà Lạt - 100 Bông Red Rose', 2000000.00, 'bo-hong-do-da-lat-100-bong-red-rose.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'bo-hong-do-da-lat-100-bong-red-rose.jpg'),
(498, 'Toffee Rose - Super Big Size (25B)', 1200000.00, 'toffee-rose-super-big-size-25b.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'toffee-rose-super-big-size-25b.jpg'),
(499, 'Bó hồng đỏ Đà Lạt - 100 Bông Red Rose mix Baby', 2000000.00, 'bo-hong-do-da-lat-100-bong-red-rose-mix-baby.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-do-da-lat-100-bong-red-rose-mix-baby.jpg'),
(500, 'Cúc Mẫu đơn xanh mix trắng - Super Big Size', 1250000.00, 'cuc-mau-don-xanh-mix-trang-super-big-size.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'cuc-mau-don-xanh-mix-trang-super-big-size.jpg'),
(501, 'Bó Ohara hồng 30b mix lá bạc', 1200000.00, 'bo-ohara-hong-30b-mix-la-bac.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-ohara-hong-30b-mix-la-bac.jpg'),
(502, 'Bó hoa tone hồng mix Diên vỹ', 1500000.00, 'bo-hoa-tone-hong-mix-dien-vy.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-tone-hong-mix-dien-vy.jpg'),
(503, 'Bó hoa Peony mix tone trắng xanh', 1260000.00, 'bo-hoa-peony-mix-tone-trang-xanh.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-peony-mix-tone-trang-xanh.jpg'),
(504, 'Bó hoa Ly trắng mix - Size L', 790000.00, 'bo-hoa-ly-trang-mix-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-ly-trang-mix-size-l.jpg'),
(505, 'Bó Tulip 30b mix trắng hồng (Giấy xé trắng)', 2070000.00, 'bo-tulip-30b-mix-trang-hong-giay-xe-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-tulip-30b-mix-trang-hong-giay-xe-trang.jpg'),
(506, 'Bó hoa tú cầu hồng mix tone Hồng Cam - Size L', 1200000.00, 'bo-hoa-tu-cau-hong-mix-tone-hong-cam-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-hoa-tu-cau-hong-mix-tone-hong-cam-size-l.jpg'),
(507, 'Violet Dreams Bouquet - Bó hoa mix tone hồng tím - size L', 1000000.00, 'violet-dreams-bouquet-bo-hoa-mix-tone-hong-tim-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'violet-dreams-bouquet-bo-hoa-mix-tone-hong-tim-size-l.jpg'),
(508, 'Bó hoa Lan Vũ Nữ mix tone Vàng trắng', 890000.00, 'bo-hoa-lan-vu-nu-mix-tone-vang-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-lan-vu-nu-mix-tone-vang-trang.jpg'),
(509, 'Bó tú cầu xanh blue mix lan hồ điệp', 750000.00, 'bo-tu-cau-xanh-blue-mix-lan-ho-diep.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-tu-cau-xanh-blue-mix-lan-ho-diep.jpg'),
(510, 'Bó hoa hồng Juilet - 30 Bông - Size L', 750000.00, 'bo-hoa-hong-juilet-30-bong-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Tình yêu không chỉ là những lời hứa, mà là sự hiện diện. Đóa hoa này thay cho một lời nhắn nhủ: \'Mình luôn ở đây, bên cạnh bạn\'.', 'bo-hoa-hong-juilet-30-bong-size-l.jpg'),
(511, 'Bó hoa hướng dương mix tú cầu - Size L', 600000.00, 'bo-hoa-huong-duong-mix-tu-cau-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-hoa-huong-duong-mix-tu-cau-size-l.jpg'),
(512, 'Bó hoa Style Garden - Pink Floyd mix - Dáng tròn', 1200000.00, 'bo-hoa-style-garden-pink-floyd-mix-dang-tron.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-style-garden-pink-floyd-mix-dang-tron.jpg'),
(513, 'Bó hồng Ecuador Xanh Biển - 10B mix lá phụ', 1200000.00, 'bo-hong-ecuador-xanh-bien-10b-mix-la-phu.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-ecuador-xanh-bien-10b-mix-la-phu.jpg'),
(514, 'Bó 3 bông tú cầu hồng mix baby lá bạc', 900000.00, 'bo-3-bong-tu-cau-hong-mix-baby-la-bac.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-3-bong-tu-cau-hong-mix-baby-la-bac.jpg'),
(515, 'Deep Ocean Blue Bouquet - Bó hoa tone Xanh đậm - Size L', 2000000.00, 'deep-ocean-blue-bouquet-bo-hoa-tone-xanh-dam-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Tình yêu đích thực giống như loài hoa quý, cần sự nâng niu và chăm sóc mỗi ngày để mãi mãi tỏa ngát hương thơm.', 'deep-ocean-blue-bouquet-bo-hoa-tone-xanh-dam-size-l.jpg'),
(516, 'Bó hoa Tulip hồng 20B', 1350000.00, 'bo-hoa-tulip-hong-20b.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Sự lãng mạn không cần phải quá cầu kỳ. Đôi khi, chỉ một bó hoa tươi thắm cũng đủ để thắp sáng nụ cười của người bạn yêu thương.', 'bo-hoa-tulip-hong-20b.jpg'),
(517, 'Bó hoa cẩm chướng mix lá (Panxe) - Size L', 750000.00, 'bo-hoa-cam-chuong-mix-la-panxe-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cam-chuong-mix-la-panxe-size-l.jpg'),
(518, 'Bó Cẩm tú cầu xanh blue mix Tulip Cam', 850000.00, 'bo-cam-tu-cau-xanh-blue-mix-tulip-cam.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-cam-tu-cau-xanh-blue-mix-tulip-cam.jpg'),
(519, 'Bó hoa tone Đỏ hồng mix tulip', 1200000.00, 'bo-hoa-tone-do-hong-mix-tulip.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-tone-do-hong-mix-tulip.jpg'),
(520, 'Bó hồng Ohara mix Lan tường kem - Giấy đen - Bó Size L', 950000.00, 'bo-hong-ohara-mix-lan-tuong-kem-giay-den-bo-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-ohara-mix-lan-tuong-kem-giay-den-bo-size-l.jpg'),
(521, 'Bó hoa Peony mix - Size L - Tone hồng cam', 1050000.00, 'bo-hoa-peony-mix-size-l-tone-hong-cam.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-peony-mix-size-l-tone-hong-cam.jpg'),
(522, 'Bó hoa Peony mix - Size L - Bó tròn', 1610000.00, 'bo-hoa-peony-mix-size-l-bo-tron.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-peony-mix-size-l-bo-tron.jpg'),
(523, 'Bó hoa Diên vĩ tím mix lá phụ (Iris) - Size M/L', 540000.00, 'bo-hoa-dien-vi-tim-mix-la-phu-iris-size-m-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-dien-vi-tim-mix-la-phu-iris-size-m-l.jpg'),
(524, 'Bó mix nhiều loại hoa style garden - Size L', 950000.00, 'bo-mix-nhieu-loai-hoa-style-garden-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-mix-nhieu-loai-hoa-style-garden-size-l.jpg'),
(525, 'Bó cúc mẫu đơn mix tone cam hồng mix - Size L', 1000000.00, 'bo-cuc-mau-don-mix-tone-cam-hong-mix-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-cuc-mau-don-mix-tone-cam-hong-mix-size-l.jpg'),
(526, 'Latte Spray Roses - Bó dáng xòe Size L', 850000.00, 'latte-spray-roses-bo-dang-xoe-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'latte-spray-roses-bo-dang-xoe-size-l.jpg'),
(527, 'Bó hoa Tulip Cam Size L - Bó 15B', 1080000.00, 'bo-hoa-tulip-cam-size-l-bo-15b.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Ánh mắt trao nhau, nụ cười hé mở... Đóa hoa này là một nốt nhạc ngọt ngào trong bản tình ca của hai chúng ta.', 'bo-hoa-tulip-cam-size-l-bo-15b.jpg'),
(528, 'Bó ốc quế size S - Tú cầu xanh', 300000.00, 'bo-oc-que-size-s-tu-cau-xanh.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-oc-que-size-s-tu-cau-xanh.jpg'),
(529, 'Hướng Dương Mix - 3B', 280000.00, 'huong-duong-mix-3b.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'huong-duong-mix-3b.jpg'),
(530, 'Bó hoa ly tone hồng - Size S', 480000.00, 'bo-hoa-ly-tone-hong-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Giữa hàng vạn người lướt qua nhau, ta tìm thấy nhau. Đóa hoa này là món quà dành tặng cho sự diệu kỳ của nhân duyên.', 'bo-hoa-ly-tone-hong-size-s.jpg'),
(531, 'Bó hoa Ly xanh mix size S', 490000.00, 'bo-hoa-ly-xanh-mix-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-ly-xanh-mix-size-s.jpg'),
(532, 'Hồng Mela - Set 10b (Hoa cần đặt trước)', 450000.00, 'hong-mela-set-10b-hoa-can-dat-truoc.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Ánh mắt trao nhau, nụ cười hé mở... Đóa hoa này là một nốt nhạc ngọt ngào trong bản tình ca của hai chúng ta.', 'hong-mela-set-10b-hoa-can-dat-truoc.jpg'),
(533, 'Ốc quế hoa chúc mừng tốt nghiệp', 350000.00, 'oc-que-hoa-chuc-mung-tot-nghiep.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'oc-que-hoa-chuc-mung-tot-nghiep.jpg'),
(534, 'Bó Hướng dương mix tone cam - Size S', 290000.00, 'bo-huong-duong-mix-tone-cam-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-huong-duong-mix-tone-cam-size-s.jpg'),
(535, 'FS BOX - Sunshine of Spring - Bó hoa tone cam vàng mix -Size S (set kèm hộp)', 490000.00, 'fs-box-sunshine-of-spring-bo-hoa-tone-cam-vang-mix-size-s-set-kem-hop.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'fs-box-sunshine-of-spring-bo-hoa-tone-cam-vang-mix-size-s-set-kem-hop.jpg'),
(536, 'FS BOX - Bó hoa size S (tone cam) - Set kèm hộp', 390600.00, 'fs-box-bo-hoa-size-s-tone-cam-set-kem-hop.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'fs-box-bo-hoa-size-s-tone-cam-set-kem-hop.jpg'),
(537, 'Bó hoa tú cầu xanh mix hoa phụ', 320000.00, 'bo-hoa-tu-cau-xanh-mix-hoa-phu.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-hoa-tu-cau-xanh-mix-hoa-phu.jpg'),
(538, 'Bó hoa hồng Juliet', 350000.00, 'bo-hoa-hong-juliet.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'bo-hoa-hong-juliet.jpg'),
(539, 'Ốc quế hoa Shimmer - Size S', 320000.00, 'oc-que-hoa-shimmer-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Em là đóa hoa đẹp nhất trong khu vườn trái tim anh. Gửi tặng em bó hoa này như một minh chứng cho tình yêu vĩnh cửu.', 'oc-que-hoa-shimmer-size-s.jpg'),
(540, 'Bó hoa tone hồng pastel - gói giấy Hàn Quốc', 380000.00, 'bo-hoa-tone-hong-pastel-goi-giay-han-quoc.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Ánh mắt trao nhau, nụ cười hé mở... Đóa hoa này là một nốt nhạc ngọt ngào trong bản tình ca của hai chúng ta.', 'bo-hoa-tone-hong-pastel-goi-giay-han-quoc.jpg'),
(541, 'Bó hồng trắng mix sao xanh - Size S', 250000.00, 'bo-hong-trang-mix-sao-xanh-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-trang-mix-sao-xanh-size-s.jpg'),
(542, 'Tiểu tinh - Bó lam tinh size S', 260000.00, 'tieu-tinh-bo-lam-tinh-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Mỗi đóa hoa tại Floral Haven đều mang một thông điệp tình yêu duy nhất, được gửi gắm qua từng nhánh lá và hương thơm nhẹ nhàng.', 'tieu-tinh-bo-lam-tinh-size-s.jpg'),
(543, 'Mộng Mơ - Giấc mơ màu xanh - Hồng trắng mix Lam tinh', 499000.00, 'mong-mo-giac-mo-mau-xanh-hong-trang-mix-lam-tinh.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'mong-mo-giac-mo-mau-xanh-hong-trang-mix-lam-tinh.jpg'),
(544, 'Breeze Ailes - Bó hoa cánh bướm tone xanh blue', 380000.00, 'breeze-ailes-bo-hoa-canh-buom-tone-xanh-blue.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'breeze-ailes-bo-hoa-canh-buom-tone-xanh-blue.jpg'),
(545, 'Bó tulip hồng - set 5b', 405000.00, 'bo-tulip-hong-set-5b.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'bo-tulip-hong-set-5b.jpg'),
(546, 'Bó hồng Ohara mix tulip trắng', 550000.00, 'bo-hong-ohara-mix-tulip-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-ohara-mix-tulip-trang.jpg'),
(547, 'Bó Juliet mix tone cam - Size S - Giấy Báo', 350000.00, 'bo-juliet-mix-tone-cam-size-s-giay-bao.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-juliet-mix-tone-cam-size-s-giay-bao.jpg'),
(548, 'GIỏ hoa Peony mix tone hồng Pastel', 1365000.00, 'gio-hoa-peony-mix-tone-hong-pastel.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'gio-hoa-peony-mix-tone-hong-pastel.jpg'),
(549, 'Giỏ hoa đa sắc (Tulip cam vàng mix cùng hoa ly, delphinium)', 2100000.00, 'gio-hoa-da-sac-tulip-cam-vang-mix-cung-hoa-ly-delphinium.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'gio-hoa-da-sac-tulip-cam-vang-mix-cung-hoa-ly-delphinium.jpg'),
(550, 'Giỏ hoa hướng dương mix tone vàng', 850000.00, 'gio-hoa-huong-duong-mix-tone-vang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'gio-hoa-huong-duong-mix-tone-vang.jpg'),
(551, 'Hộp hoa Peony mix tone rực rỡ - Big Size', 2800000.00, 'hop-hoa-peony-mix-tone-ruc-ro-big-size.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-peony-mix-tone-ruc-ro-big-size.jpg'),
(552, 'Giỏ hoa Peony mix mao lương và hoa phụ tone hồng', 1365000.00, 'gio-hoa-peony-mix-mao-luong-va-hoa-phu-tone-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'gio-hoa-peony-mix-mao-luong-va-hoa-phu-tone-hong.jpg'),
(553, 'Bó hoa Peony mix Tulip trắng', 2100000.00, 'bo-hoa-peony-mix-tulip-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-peony-mix-tulip-trang.jpg'),
(554, 'Giỏ hoa Tú cầu hồng mix mao lương size L', 1650000.00, 'gio-hoa-tu-cau-hong-mix-mao-luong-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'gio-hoa-tu-cau-hong-mix-mao-luong-size-l.jpg'),
(555, 'Giỏ Mica hồng đỏ mix tulip viền trắng', 1850000.00, 'gio-mica-hong-do-mix-tulip-vien-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'gio-mica-hong-do-mix-tulip-vien-trang.jpg'),
(556, 'Hộp hoa Bento (Màu: Hồng/ Trắng/ Xanh/ Cam/ Đỏ)', 280000.00, 'hop-hoa-bento-mau-hong-trang-xanh-cam-do.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-bento-mau-hong-trang-xanh-cam-do.jpg'),
(557, 'Giỏ hoa Mica - Cosmic Iris & Lily Bloom', 2000000.00, 'gio-hoa-mica-cosmic-iris-lily-bloom.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Em là đóa hoa đẹp nhất trong khu vườn trái tim anh. Gửi tặng em bó hoa này như một minh chứng cho tình yêu vĩnh cửu.', 'gio-hoa-mica-cosmic-iris-lily-bloom.jpg'),
(558, 'Hộp hoa Tú cầu mix Hồng trắng', 2300000.00, 'hop-hoa-tu-cau-mix-hong-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-tu-cau-mix-hong-trang.jpg'),
(559, 'Giỏ mây nhỏ Tone vàng - Size S', 299000.00, 'gio-may-nho-tone-vang-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'gio-may-nho-tone-vang-size-s.jpg'),
(560, 'Cốc ốc quế hoa Tone nâu', 650000.00, 'coc-oc-que-hoa-tone-nau.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'coc-oc-que-hoa-tone-nau.jpg'),
(561, 'Bình hoa Tú cầu xanh viền trắng mix tone Vàng', 1800000.00, 'binh-hoa-tu-cau-xanh-vien-trang-mix-tone-vang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'binh-hoa-tu-cau-xanh-vien-trang-mix-tone-vang.jpg'),
(562, 'Giỏ hoa Tone Hồng Cam - Giỏ Oval - Size M', 790000.00, 'gio-hoa-tone-hong-cam-gio-oval-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'gio-hoa-tone-hong-cam-gio-oval-size-m.jpg'),
(563, 'Giỏ hoa tone hồng trắng mix cúc gỗ (Giỏ oval - size M)', 680000.00, 'gio-hoa-tone-hong-trang-mix-cuc-go-gio-oval-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'gio-hoa-tone-hong-trang-mix-cuc-go-gio-oval-size-m.jpg');
INSERT INTO `products` (`product_id`, `name`, `price`, `image_url`, `description`, `stock_quantity`, `category_id`, `is_active`, `story_text`, `story_image`) VALUES
(564, 'Hộp hoa mica tone vàng - Size 35x30cm', 1200000.00, 'hop-hoa-mica-tone-vang-size-35x30cm.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-mica-tone-vang-size-35x30cm.jpg'),
(565, 'Hộp hoa tone Blue - Size M', 890000.00, 'hop-hoa-tone-blue-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-tone-blue-size-m.jpg'),
(566, 'Giỏ hoa mây Cúc mẫu đơn mix tone Cam - size M', 550000.00, 'gio-hoa-may-cuc-mau-don-mix-tone-cam-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'gio-hoa-may-cuc-mau-don-mix-tone-cam-size-m.jpg'),
(567, 'Giỏ hoa Tú cầu mix cúc mẫu đơn, thỏ ping, diên vỹ', 1650000.00, 'gio-hoa-tu-cau-mix-cuc-mau-don-tho-ping-dien-vy.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'gio-hoa-tu-cau-mix-cuc-mau-don-tho-ping-dien-vy.jpg'),
(568, 'Giỏ hoa tone hồng size L (Tú cầu, tulip, lạc thần)', 1200000.00, 'gio-hoa-tone-hong-size-l-tu-cau-tulip-lac-than.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'gio-hoa-tone-hong-size-l-tu-cau-tulip-lac-than.jpg'),
(569, 'Cốc ốc quế hoa Ly Hồng mix - Size M', 750000.00, 'coc-oc-que-hoa-ly-hong-mix-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'coc-oc-que-hoa-ly-hong-mix-size-m.jpg'),
(570, 'Hộp hoa Mica - Tone Tím hồng - 22x27cm', 790000.00, 'hop-hoa-mica-tone-tim-hong-22x27cm.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-mica-tone-tim-hong-22x27cm.jpg'),
(571, 'Cosmic Iris & Lily Bloom - Flower Cup', 1000000.00, 'cosmic-iris-lily-bloom-flower-cup.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'cosmic-iris-lily-bloom-flower-cup.jpg'),
(572, 'Cốc ốc quế hoa Ly trắng tone Hồng - Size M', 650000.00, 'coc-oc-que-hoa-ly-trang-tone-hong-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Em là đóa hoa đẹp nhất trong khu vườn trái tim anh. Gửi tặng em bó hoa này như một minh chứng cho tình yêu vĩnh cửu.', 'coc-oc-que-hoa-ly-trang-tone-hong-size-m.jpg'),
(573, 'Hộp hoa Mica size S tone trắng', 890000.00, 'hop-hoa-mica-size-s-tone-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-mica-size-s-tone-trang.jpg'),
(574, 'Sweet Bunny Surprise - Giỏ hoa thỏ hồng', 950000.00, 'sweet-bunny-surprise-gio-hoa-tho-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Tình yêu không chỉ là những lời hứa, mà là sự hiện diện. Đóa hoa này thay cho một lời nhắn nhủ: \'Mình luôn ở đây, bên cạnh bạn\'.', 'sweet-bunny-surprise-gio-hoa-tho-hong.jpg'),
(575, 'Golden Bloom Basket - Giỏ hoa hồng vàng', 950000.00, 'golden-bloom-basket-gio-hoa-hong-vang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Ánh mắt trao nhau, nụ cười hé mở... Đóa hoa này là một nốt nhạc ngọt ngào trong bản tình ca của hai chúng ta.', 'golden-bloom-basket-gio-hoa-hong-vang.jpg'),
(576, 'Hộp hoa Mica size nhỏ - Red Rose', 580000.00, 'hop-hoa-mica-size-nho-red-rose.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-mica-size-nho-red-rose.jpg'),
(577, 'Hộp Mica Tốt nghiệp tone xanh Blue', 590000.00, 'hop-mica-tot-nghiep-tone-xanh-blue.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'hop-mica-tot-nghiep-tone-xanh-blue.jpg'),
(578, '\"Hồng Trà Lam Tinh\" - Giỏ cói hoa tone Hồng mix Lam tinh', 950000.00, 'hong-tra-lam-tinh-gio-coi-hoa-tone-hong-mix-lam-tinh.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'hong-tra-lam-tinh-gio-coi-hoa-tone-hong-mix-lam-tinh.jpg'),
(579, 'Giỏ hoa tone đỏ mix Tulip', 790000.00, 'gio-hoa-tone-do-mix-tulip.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'gio-hoa-tone-do-mix-tulip.jpg'),
(580, 'Box Mica - Tone hồng - Size S - 25x25cm', 850000.00, 'box-mica-tone-hong-size-s-25x25cm.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Tình yêu đích thực giống như loài hoa quý, cần sự nâng niu và chăm sóc mỗi ngày để mãi mãi tỏa ngát hương thơm.', 'box-mica-tone-hong-size-s-25x25cm.jpg'),
(581, 'Flower Pot - Chậu hoa thỏ nhỏ xinh', 350000.00, 'flower-pot-chau-hoa-tho-nho-xinh.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Ánh mắt trao nhau, nụ cười hé mở... Đóa hoa này là một nốt nhạc ngọt ngào trong bản tình ca của hai chúng ta.', 'flower-pot-chau-hoa-tho-nho-xinh.jpg'),
(582, 'Hộp hoa Mica tone hồng', 580000.00, 'hop-hoa-mica-tone-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-mica-tone-hong.jpg'),
(583, 'Box Mica - Tone đỏ - size S', 950000.00, 'box-mica-tone-do-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Sự lãng mạn không cần phải quá cầu kỳ. Đôi khi, chỉ một bó hoa tươi thắm cũng đủ để thắp sáng nụ cười của người bạn yêu thương.', 'box-mica-tone-do-size-s.jpg'),
(584, 'Box Mica - Tone hồng - Size S', 807500.00, 'box-mica-tone-hong-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Không có món quà nào lãng mạn hơn một bó hoa bất ngờ. Hãy để những cánh hoa này thay vạn lời yêu thương chưa nói.', 'box-mica-tone-hong-size-s.jpg'),
(585, 'Giỏ Mica hồng đỏ mix tulip - Size S', 1200000.00, 'gio-mica-hong-do-mix-tulip-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'gio-mica-hong-do-mix-tulip-size-s.jpg'),
(586, 'Giỏ hoa hồng nhỏ xinh tone trắng - Size S', 299000.00, 'gio-hoa-hong-nho-xinh-tone-trang-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Mỗi đóa hoa tại Floral Haven đều mang một thông điệp tình yêu duy nhất, được gửi gắm qua từng nhánh lá và hương thơm nhẹ nhàng.', 'gio-hoa-hong-nho-xinh-tone-trang-size-s.jpg'),
(587, 'Giỏ mây nhỏ - Tone Hồng/ cam/ vàng', 299000.00, 'gio-may-nho-tone-hong-cam-vang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'gio-may-nho-tone-hong-cam-vang.jpg'),
(588, 'Giỏ hoa mây Thỏ hồng size S', 390000.00, 'gio-hoa-may-tho-hong-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Ánh mắt trao nhau, nụ cười hé mở... Đóa hoa này là một nốt nhạc ngọt ngào trong bản tình ca của hai chúng ta.', 'gio-hoa-may-tho-hong-size-s.jpg'),
(589, 'Giỏ hoa mây tone Hồng Cam mix Tulip - size M', 650000.00, 'gio-hoa-may-tone-hong-cam-mix-tulip-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'gio-hoa-may-tone-hong-cam-mix-tulip-size-m.jpg'),
(590, 'Giỏ mây nhỏ tone hồng mix tulip - Size S', 350000.00, 'gio-may-nho-tone-hong-mix-tulip-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'gio-may-nho-tone-hong-mix-tulip-size-s.jpg'),
(591, 'Giỏ hoa nhỏ xinh tone Cam Hồng mix tulip', 390000.00, 'gio-hoa-nho-xinh-tone-cam-hong-mix-tulip.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'gio-hoa-nho-xinh-tone-cam-hong-mix-tulip.jpg'),
(592, 'Giỏ hoa nhỏ xinh tone Cam', 350000.00, 'gio-hoa-nho-xinh-tone-cam.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'gio-hoa-nho-xinh-tone-cam.jpg'),
(593, 'Cốc Hoa Tone Hồng Cam', 590000.00, 'coc-hoa-tone-hong-cam.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Mỗi đóa hoa tại Floral Haven đều mang một thông điệp tình yêu duy nhất, được gửi gắm qua từng nhánh lá và hương thơm nhẹ nhàng.', 'coc-hoa-tone-hong-cam.jpg'),
(594, 'Giỏ hoa Summer\'s Kiss  - Tone vàng cam', 950000.00, 'gio-hoa-summer-s-kiss-tone-vang-cam.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'gio-hoa-summer-s-kiss-tone-vang-cam.jpg'),
(595, 'Giỏ Hoa Vườn Thỏ con', 550000.00, 'gio-hoa-vuon-tho-con.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Không có món quà nào lãng mạn hơn một bó hoa bất ngờ. Hãy để những cánh hoa này thay vạn lời yêu thương chưa nói.', 'gio-hoa-vuon-tho-con.jpg'),
(596, 'Giỏ hoa tím hồng mix lan hồ điệp', 680000.00, 'gio-hoa-tim-hong-mix-lan-ho-diep.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'gio-hoa-tim-hong-mix-lan-ho-diep.jpg'),
(597, 'Giỏ hoa Peony mix tone Cam hồng', 1260000.00, 'gio-hoa-peony-mix-tone-cam-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'gio-hoa-peony-mix-tone-cam-hong.jpg'),
(598, 'Giỏ hoa mây ton hồng Pastel (có lan) - size M+', 790000.00, 'gio-hoa-may-ton-hong-pastel-co-lan-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Tình yêu đích thực giống như loài hoa quý, cần sự nâng niu và chăm sóc mỗi ngày để mãi mãi tỏa ngát hương thơm.', 'gio-hoa-may-ton-hong-pastel-co-lan-size-m.jpg'),
(599, 'Giỏ hoa Peony bán nguyệt', 1050000.00, 'gio-hoa-peony-ban-nguyet.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'gio-hoa-peony-ban-nguyet.jpg'),
(600, 'Giỏ hoa Tulip trắng mix hoa phụ', 855000.00, 'gio-hoa-tulip-trang-mix-hoa-phu.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'gio-hoa-tulip-trang-mix-hoa-phu.jpg'),
(601, 'Hộp hoa kính Mica - Tone Dark Blue Violet (Xanh tím)', 1750000.00, 'hop-hoa-kinh-mica-tone-dark-blue-violet-xanh-tim.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-kinh-mica-tone-dark-blue-violet-xanh-tim.jpg'),
(602, 'Giỏ hoa mây tone cam - Size M+', 750000.00, 'gio-hoa-may-tone-cam-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'gio-hoa-may-tone-cam-size-m.jpg'),
(603, 'Giỏ hoa mây Thỏ hồng size M', 590000.00, 'gio-hoa-may-tho-hong-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Yêu là trao đi không mưu cầu nhận lại, cũng như đóa hoa này dâng hiến hương sắc để làm đẹp cho đời.', 'gio-hoa-may-tho-hong-size-m.jpg'),
(604, 'Giỏ hoa mây Cúc mẫu đơn mix ton hồng Pastel - size M', 550000.00, 'gio-hoa-may-cuc-mau-don-mix-ton-hong-pastel-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'gio-hoa-may-cuc-mau-don-mix-ton-hong-pastel-size-m.jpg'),
(605, 'Giỏ hoa mây ton hồng Pastel - size M+', 690000.00, 'gio-hoa-may-ton-hong-pastel-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Yêu là trao đi không mưu cầu nhận lại, cũng như đóa hoa này dâng hiến hương sắc để làm đẹp cho đời.', 'gio-hoa-may-ton-hong-pastel-size-m.jpg'),
(606, 'Hộp hoa kính Mica - Mix 7 màu', 1500000.00, 'hop-hoa-kinh-mica-mix-7-mau.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-kinh-mica-mix-7-mau.jpg'),
(607, 'Hộp hoa kính Mica - Tone hồng Pink Floyd', 1150000.00, 'hop-hoa-kinh-mica-tone-hong-pink-floyd.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-kinh-mica-tone-hong-pink-floyd.jpg'),
(608, 'Hộp hoa kính Mica - Tone hồng cam', 1140000.00, 'hop-hoa-kinh-mica-tone-hong-cam.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-kinh-mica-tone-hong-cam.jpg'),
(609, 'Pink Blossom Basket - Giỏ mây oval - Tone hồng mix', 1200000.00, 'pink-blossom-basket-gio-may-oval-tone-hong-mix.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'pink-blossom-basket-gio-may-oval-tone-hong-mix.jpg'),
(610, 'Giỏ Mica hồng đỏ mix tulip - Size L', 1850000.00, 'gio-mica-hong-do-mix-tulip-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'gio-mica-hong-do-mix-tulip-size-l.jpg'),
(611, 'Blooming House - Summer Garden', 2500000.00, 'blooming-house-summer-garden.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Em là đóa hoa đẹp nhất trong khu vườn trái tim anh. Gửi tặng em bó hoa này như một minh chứng cho tình yêu vĩnh cửu.', 'blooming-house-summer-garden.jpg'),
(612, 'Blooming House - Golden Orchid', 2000000.00, 'blooming-house-golden-orchid.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Yêu là trao đi không mưu cầu nhận lại, cũng như đóa hoa này dâng hiến hương sắc để làm đẹp cho đời.', 'blooming-house-golden-orchid.jpg'),
(613, 'Giỏ hoa mây - Tone Nâu Cafe', 950000.00, 'gio-hoa-may-tone-nau-cafe.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'gio-hoa-may-tone-nau-cafe.jpg'),
(614, 'Pink Blossom Basket - Giỏ hoa bán nguyệt - Tone hồng mix', 1200000.00, 'pink-blossom-basket-gio-hoa-ban-nguyet-tone-hong-mix.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'pink-blossom-basket-gio-hoa-ban-nguyet-tone-hong-mix.jpg'),
(615, 'Giỏ hoa Tú cầu mix cúc mẫu đơn và hoa phụ - Size L', 1290000.00, 'gio-hoa-tu-cau-mix-cuc-mau-don-va-hoa-phu-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'gio-hoa-tu-cau-mix-cuc-mau-don-va-hoa-phu-size-l.jpg'),
(616, 'Hộp hoa Baby trắng size L', 1000000.00, 'hop-hoa-baby-trang-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-baby-trang-size-l.jpg'),
(617, 'Giỏ hoa mica - Hồng đỏ mix tuyết mai', 1200000.00, 'gio-hoa-mica-hong-do-mix-tuyet-mai.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'gio-hoa-mica-hong-do-mix-tuyet-mai.jpg'),
(618, 'Giỏ hoa Cúc mẫu đơn xanh mix', 950000.00, 'gio-hoa-cuc-mau-don-xanh-mix.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'gio-hoa-cuc-mau-don-xanh-mix.jpg'),
(619, 'Giỏ hoa tone đỏ nâu size L', 1490000.00, 'gio-hoa-tone-do-nau-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'gio-hoa-tone-do-nau-size-l.jpg'),
(620, 'Giỏ mây bán nguyệt - Tone Đỏ Cam - Size L', 890000.00, 'gio-may-ban-nguyet-tone-do-cam-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'gio-may-ban-nguyet-tone-do-cam-size-l.jpg'),
(621, 'Hộp hoa Tone Đỏ cam sang trọng', 1700000.00, 'hop-hoa-tone-do-cam-sang-trong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-tone-do-cam-sang-trong.jpg'),
(622, 'Giỏ mây size lớn - Tone Vàng cam', 890000.00, 'gio-may-size-lon-tone-vang-cam.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'gio-may-size-lon-tone-vang-cam.jpg'),
(623, 'Giỏ mây bán nguyệt - Tone Tím - Size L', 1500000.00, 'gio-may-ban-nguyet-tone-tim-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'gio-may-ban-nguyet-tone-tim-size-l.jpg'),
(624, 'Giỏ hoa Tú cầu mix cúc mẫu đơn và hoa phụ - Size L', 1250000.00, 'gio-hoa-tu-cau-mix-cuc-mau-don-va-hoa-phu-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'gio-hoa-tu-cau-mix-cuc-mau-don-va-hoa-phu-size-l.jpg'),
(625, 'Giỏ mây size lớn - Tone hồng Pastel', 900000.00, 'gio-may-size-lon-tone-hong-pastel.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'gio-may-size-lon-tone-hong-pastel.jpg'),
(626, 'Giỏ mây bán nguyệt - Tone hồng Pastel', 850000.00, 'gio-may-ban-nguyet-tone-hong-pastel.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'gio-may-ban-nguyet-tone-hong-pastel.jpg'),
(627, 'Giỏ hoa Cúc mẫu đơn tone cam - size L', 850000.00, 'gio-hoa-cuc-mau-don-tone-cam-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'gio-hoa-cuc-mau-don-tone-cam-size-l.jpg'),
(628, 'Giỏ hoa Cúc mẫu đơn tone hồng - size L', 820000.00, 'gio-hoa-cuc-mau-don-tone-hong-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Giữa hàng vạn người lướt qua nhau, ta tìm thấy nhau. Đóa hoa này là món quà dành tặng cho sự diệu kỳ của nhân duyên.', 'gio-hoa-cuc-mau-don-tone-hong-size-l.jpg'),
(629, 'Hộp hoa Juliet sang trọng', 1250000.00, 'hop-hoa-juliet-sang-trong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-juliet-sang-trong.jpg'),
(630, 'Hộp hoa Tone cam sang trọng', 1350000.00, 'hop-hoa-tone-cam-sang-trong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-tone-cam-sang-trong.jpg'),
(631, 'Combo Hoa xe cưới và hoa cầm tay cô dâu (Tone Xanh Tím)', 5000000.00, 'combo-hoa-xe-cuoi-va-hoa-cam-tay-co-dau-tone-xanh-tim.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Tình yêu không chỉ là những lời hứa, mà là sự hiện diện. Đóa hoa này thay cho một lời nhắn nhủ: \'Mình luôn ở đây, bên cạnh bạn\'.', 'combo-hoa-xe-cuoi-va-hoa-cam-tay-co-dau-tone-xanh-tim.jpg'),
(632, 'Hoa Xe cưới tone Tím xanh - Wedding Car - 2 line hoa', 3500000.00, 'hoa-xe-cuoi-tone-tim-xanh-wedding-car-2-line-hoa.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Không có món quà nào lãng mạn hơn một bó hoa bất ngờ. Hãy để những cánh hoa này thay vạn lời yêu thương chưa nói.', 'hoa-xe-cuoi-tone-tim-xanh-wedding-car-2-line-hoa.jpg'),
(633, 'Bó hoa cưới tone Tím Xanh - Tú cầu, Lan hồ điệp', 2000000.00, 'bo-hoa-cuoi-tone-tim-xanh-tu-cau-lan-ho-diep.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-hoa-cuoi-tone-tim-xanh-tu-cau-lan-ho-diep.jpg'),
(634, 'Bó hoa Lam tinh (Chụp Pre-wedding)', 650000.00, 'bo-hoa-lam-tinh-chup-pre-wedding.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Yêu là trao đi không mưu cầu nhận lại, cũng như đóa hoa này dâng hiến hương sắc để làm đẹp cho đời.', 'bo-hoa-lam-tinh-chup-pre-wedding.jpg'),
(635, 'Quạt hoa cưới Peony hồng', 840000.00, 'quat-hoa-cuoi-peony-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'quat-hoa-cuoi-peony-hong.jpg'),
(636, 'Bó hoa cưới Custom - Phong cách Bohemian', 1800000.00, 'bo-hoa-cuoi-custom-phong-cach-bohemian.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Mỗi đóa hoa tại Floral Haven đều mang một thông điệp tình yêu duy nhất, được gửi gắm qua từng nhánh lá và hương thơm nhẹ nhàng.', 'bo-hoa-cuoi-custom-phong-cach-bohemian.jpg'),
(637, 'Tulip mix calla, thiên nga, thùy châu', 1850000.00, 'tulip-mix-calla-thien-nga-thuy-chau.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'tulip-mix-calla-thien-nga-thuy-chau.jpg'),
(638, 'Bó hoa cưới dạ lan hương mix Calla lily', 2000000.00, 'bo-hoa-cuoi-da-lan-huong-mix-calla-lily.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-da-lan-huong-mix-calla-lily.jpg'),
(639, 'Bó hoa cưới Dạ lan hương mix mao lương trắng', 1500000.00, 'bo-hoa-cuoi-da-lan-huong-mix-mao-luong-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-da-lan-huong-mix-mao-luong-trang.jpg'),
(640, 'Bó hoa cưới Tulip trắng (dáng tim)', 1600000.00, 'bo-hoa-cuoi-tulip-trang-dang-tim.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Sự lãng mạn không cần phải quá cầu kỳ. Đôi khi, chỉ một bó hoa tươi thắm cũng đủ để thắp sáng nụ cười của người bạn yêu thương.', 'bo-hoa-cuoi-tulip-trang-dang-tim.jpg'),
(641, 'Bó hoa cưới tone tím nhạt', 1250000.00, 'bo-hoa-cuoi-tone-tim-nhat.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Em là đóa hoa đẹp nhất trong khu vườn trái tim anh. Gửi tặng em bó hoa này như một minh chứng cho tình yêu vĩnh cửu.', 'bo-hoa-cuoi-tone-tim-nhat.jpg'),
(642, 'Quạt hoa tone trắng hồng', 550000.00, 'quat-hoa-tone-trang-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Không có món quà nào lãng mạn hơn một bó hoa bất ngờ. Hãy để những cánh hoa này thay vạn lời yêu thương chưa nói.', 'quat-hoa-tone-trang-hong.jpg'),
(643, 'Quạt hoa Tulip mix hồng đỏ', 950000.00, 'quat-hoa-tulip-mix-hong-do.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'quat-hoa-tulip-mix-hong-do.jpg'),
(644, 'Quạt hoa tone hồng Pastel', 490000.00, 'quat-hoa-tone-hong-pastel.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'quat-hoa-tone-hong-pastel.jpg'),
(645, 'Bó hoa cưới Dạ lan hương trắng mix hoa phụ', 1350000.00, 'bo-hoa-cuoi-da-lan-huong-trang-mix-hoa-phu.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-da-lan-huong-trang-mix-hoa-phu.jpg'),
(646, 'Bó hoa cưới dạ lan hương mix tulip trắng', 1500000.00, 'bo-hoa-cuoi-da-lan-huong-mix-tulip-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-da-lan-huong-mix-tulip-trang.jpg'),
(647, 'Bó hoa cưới - Mini Ana mix Tulip - Dáng thác đổ', 1090000.00, 'bo-hoa-cuoi-mini-ana-mix-tulip-dang-thac-do.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-mini-ana-mix-tulip-dang-thac-do.jpg'),
(648, 'Bó hoa cưới Tulip hồng mix dền rủ trắng', 1350000.00, 'bo-hoa-cuoi-tulip-hong-mix-den-ru-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-tulip-hong-mix-den-ru-trang.jpg'),
(649, 'Bó hoa cưới tone hồng mix tulip trắng', 890000.00, 'bo-hoa-cuoi-tone-hong-mix-tulip-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-tone-hong-mix-tulip-trang.jpg'),
(650, 'Bó hoa cưới mix Tulip Cam', 950000.00, 'bo-hoa-cuoi-mix-tulip-cam.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-mix-tulip-cam.jpg'),
(651, 'Bó hoa cưới tone trắng - Phi yến mix Tulip', 890000.00, 'bo-hoa-cuoi-tone-trang-phi-yen-mix-tulip.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-tone-trang-phi-yen-mix-tulip.jpg'),
(652, 'Vòng hoa cưới Calla mix lan hồ điệp, dền rủ', 1200000.00, 'vong-hoa-cuoi-calla-mix-lan-ho-diep-den-ru.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'vong-hoa-cuoi-calla-mix-lan-ho-diep-den-ru.jpg'),
(653, 'Bó hoa cưới Calla mix thùy châu', 1850000.00, 'bo-hoa-cuoi-calla-mix-thuy-chau.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-calla-mix-thuy-chau.jpg'),
(654, 'Bó hoa cưới tone Đỏ mix lan hồ điệp', 950000.00, 'bo-hoa-cuoi-tone-do-mix-lan-ho-diep.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-tone-do-mix-lan-ho-diep.jpg'),
(655, 'Quạt hoa Tulip mix mao lương, thùy châu trắng', 1200000.00, 'quat-hoa-tulip-mix-mao-luong-thuy-chau-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'quat-hoa-tulip-mix-mao-luong-thuy-chau-trang.jpg'),
(656, 'Bó hoa cưới tone cam đào mix Clematis', 2000000.00, 'bo-hoa-cuoi-tone-cam-dao-mix-clematis.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-tone-cam-dao-mix-clematis.jpg'),
(657, 'Bó hoa cưới Tulip phớt hồng mix thùy châu', 1200000.00, 'bo-hoa-cuoi-tulip-phot-hong-mix-thuy-chau.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-tulip-phot-hong-mix-thuy-chau.jpg'),
(658, 'Bó hoa cưới Calla lily mix Tulip trắng và hoa phụ', 2000000.00, 'bo-hoa-cuoi-calla-lily-mix-tulip-trang-va-hoa-phu.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-calla-lily-mix-tulip-trang-va-hoa-phu.jpg'),
(659, 'Bó hoa cưới Lan Hồ Điệp Trắng dáng tròn', 1000000.00, 'bo-hoa-cuoi-lan-ho-diep-trang-dang-tron.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'bo-hoa-cuoi-lan-ho-diep-trang-dang-tron.jpg'),
(660, 'Quạt hoa tone đỏ mix tulip', 680000.00, 'quat-hoa-tone-do-mix-tulip.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'quat-hoa-tone-do-mix-tulip.jpg'),
(661, 'Bó hoa cưới Calla Lily mix Astible và hoa phụ', 2000000.00, 'bo-hoa-cuoi-calla-lily-mix-astible-va-hoa-phu.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-calla-lily-mix-astible-va-hoa-phu.jpg'),
(662, 'Bó hoa cưới tone trắng mix Lan Hồ Điệp, phi yến', 850000.00, 'bo-hoa-cuoi-tone-trang-mix-lan-ho-diep-phi-yen.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-tone-trang-mix-lan-ho-diep-phi-yen.jpg'),
(663, 'Bó hoa cưới tone hồng kem (mix tulip và lan HĐ)', 950000.00, 'bo-hoa-cuoi-tone-hong-kem-mix-tulip-va-lan-hd.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-tone-hong-kem-mix-tulip-va-lan-hd.jpg'),
(664, 'Bó hoa cưới thác đổ - Tone Xanh Tiffany', 1450000.00, 'bo-hoa-cuoi-thac-do-tone-xanh-tiffany.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Cuộc sống đôi lứa sẽ có lúc thăng lúc trầm, nhưng mong rằng sự rạng rỡ của đóa hoa cưới sẽ mãi nhắc nhở hai bạn về khoảnh khắc đẹp nhất này.', 'bo-hoa-cuoi-thac-do-tone-xanh-tiffany.jpg'),
(665, 'Wedding Car - Hoa xe cưới tone hồng Lan Hồ điệp', 2800000.00, 'wedding-car-hoa-xe-cuoi-tone-hong-lan-ho-diep.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Hạnh phúc là tìm được một bàn tay nắm lấy tay mình giữa giông bão. Đóa hoa này tượng trưng cho sự gắn kết thiêng liêng ấy.', 'wedding-car-hoa-xe-cuoi-tone-hong-lan-ho-diep.jpg'),
(666, 'Wedding Car - Xe cưới tone trắng Luxury', 3000000.00, 'wedding-car-xe-cuoi-tone-trang-luxury.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Hạnh phúc là tìm được một bàn tay nắm lấy tay mình giữa giông bão. Đóa hoa này tượng trưng cho sự gắn kết thiêng liêng ấy.', 'wedding-car-xe-cuoi-tone-trang-luxury.jpg'),
(667, 'Wedding Car - Hoa mix tone xanh trắng', 3000000.00, 'wedding-car-hoa-mix-tone-xanh-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'wedding-car-hoa-mix-tone-xanh-trang.jpg'),
(668, 'Wedding Car - Hoa mix tone trắng 02', 2500000.00, 'wedding-car-hoa-mix-tone-trang-02.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'wedding-car-hoa-mix-tone-trang-02.jpg'),
(669, 'Wedding Car - Tone Trắng - Dáng dài rủ', 2500000.00, 'wedding-car-tone-trang-dang-dai-ru.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Hạnh phúc là tìm được một bàn tay nắm lấy tay mình giữa giông bão. Đóa hoa này tượng trưng cho sự gắn kết thiêng liêng ấy.', 'wedding-car-tone-trang-dang-dai-ru.jpg'),
(670, 'Wedding Car - Tone trắng line hoa dài', 3000000.00, 'wedding-car-tone-trang-line-hoa-dai.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Hôn nhân không phải là bến đỗ, mà là hành trình tuyệt đẹp mà hai người cùng bước đi. Chúc tình yêu của các bạn luôn tươi thắm như hoa.', 'wedding-car-tone-trang-line-hoa-dai.jpg'),
(671, 'Wedding Car - Tone Hồng trắng', 2500000.00, 'wedding-car-tone-hong-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Hai trái tim đã hòa chung một nhịp đập. Bó hoa cưới rực rỡ này xin thay lời chúc phúc ngọt ngào nhất gửi đến tân lang và tân nương.', 'wedding-car-tone-hong-trang.jpg'),
(672, 'Wedding Car - Tone Hồng đất', 2300000.00, 'wedding-car-tone-hong-dat.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Chúc hai bạn bạc đầu răng long, tình yêu mãi nồng nàn, đắm say như hương thơm quyến rũ của những cánh hoa tươi tắn ngày cưới.', 'wedding-car-tone-hong-dat.jpg'),
(673, 'Wedding Car - Tone Trắng', 2500000.00, 'wedding-car-tone-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Cuộc sống đôi lứa sẽ có lúc thăng lúc trầm, nhưng mong rằng sự rạng rỡ của đóa hoa cưới sẽ mãi nhắc nhở hai bạn về khoảnh khắc đẹp nhất này.', 'wedding-car-tone-trang.jpg'),
(674, 'Wedding Car - Tone Cam Đào', 2500000.00, 'wedding-car-tone-cam-dao.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'wedding-car-tone-cam-dao.jpg'),
(675, 'Set hoa để bàn trang trí tiệc cưới/ ăn hỏi tại gia', 1500000.00, 'set-hoa-de-ban-trang-tri-tiec-cuoi-an-hoi-tai-gia.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Cầm trên tay bó hoa cưới, bạn là cô dâu rạng rỡ nhất. Tình yêu của hai bạn sẽ luôn tươi mới và đẹp đẽ như chính đóa hoa này.', 'set-hoa-de-ban-trang-tri-tiec-cuoi-an-hoi-tai-gia.jpg'),
(676, 'Bó tin nhắn tulip mix tím trắng', 765000.00, 'bo-tin-nhan-tulip-mix-tim-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-tin-nhan-tulip-mix-tim-trang.jpg'),
(677, 'Bó hoa tin nhắn tú cầu hồng mix tone hồng cam', 550000.00, 'bo-hoa-tin-nhan-tu-cau-hong-mix-tone-hong-cam.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-hoa-tin-nhan-tu-cau-hong-mix-tone-hong-cam.jpg'),
(678, 'Bó tin nhắn - Tulip Trắng mix hồng - Set 10 bông', 720000.00, 'bo-tin-nhan-tulip-trang-mix-hong-set-10-bong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-tin-nhan-tulip-trang-mix-hong-set-10-bong.jpg'),
(679, 'Bó tin nhắn - Tulip Trắng mix cam - Set 8 bông', 700000.00, 'bo-tin-nhan-tulip-trang-mix-cam-set-8-bong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-tin-nhan-tulip-trang-mix-cam-set-8-bong.jpg'),
(680, 'Bó tin nhắn - Tulip Trắng mix hồng - Set 7 bông', 612000.00, 'bo-tin-nhan-tulip-trang-mix-hong-set-7-bong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-tin-nhan-tulip-trang-mix-hong-set-7-bong.jpg'),
(681, 'Bó tin nhắn - Tulip Tím nhạt 3b - Giấy bóng kính', 350000.00, 'bo-tin-nhan-tulip-tim-nhat-3b-giay-bong-kinh.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Mỗi đóa hoa tại Floral Haven đều mang một thông điệp tình yêu duy nhất, được gửi gắm qua từng nhánh lá và hương thơm nhẹ nhàng.', 'bo-tin-nhan-tulip-tim-nhat-3b-giay-bong-kinh.jpg'),
(682, 'Bó tin nhắn - Tulip Trắng 5b - Giấy bóng kính', 405000.00, 'bo-tin-nhan-tulip-trang-5b-giay-bong-kinh.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'bo-tin-nhan-tulip-trang-5b-giay-bong-kinh.jpg'),
(683, 'Bó tin nhắn - Tulip Hồng 3b', 350000.00, 'bo-tin-nhan-tulip-hong-3b.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'bo-tin-nhan-tulip-hong-3b.jpg'),
(684, 'Bó tin nhắn - Tulip Trắng 3b', 350000.00, 'bo-tin-nhan-tulip-trang-3b.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Sự lãng mạn không cần phải quá cầu kỳ. Đôi khi, chỉ một bó hoa tươi thắm cũng đủ để thắp sáng nụ cười của người bạn yêu thương.', 'bo-tin-nhan-tulip-trang-3b.jpg'),
(685, 'Hộp hoa Mini Mica - Tone Hồng/ Cam/ Xanh', 320000.00, 'hop-hoa-mini-mica-tone-hong-cam-xanh.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-mini-mica-tone-hong-cam-xanh.jpg'),
(686, 'Hộp hoa Mica Mini - Tone Blue', 320000.00, 'hop-hoa-mica-mini-tone-blue.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-mica-mini-tone-blue.jpg'),
(687, 'Kệ hoa khai trương - Tone Tím Hồng (kệ chân sắt)', 1750000.00, 'ke-hoa-khai-truong-tone-tim-hong-ke-chan-sat.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Màu sắc rực rỡ của đóa hoa như một nguồn năng lượng tích cực, chúc cho con đường kinh doanh luôn thuận buồm xuôi gió và phát đạt.', 'ke-hoa-khai-truong-tone-tim-hong-ke-chan-sat.jpg'),
(688, 'Kệ hoa khai trương - Khung tranh Tone Hồng', 1750000.00, 'ke-hoa-khai-truong-khung-tranh-tone-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Như những bông hoa vươn mình đón nắng mai, chúc doanh nghiệp của bạn luôn tỏa sáng và dẫn đầu trên thị trường.', 'ke-hoa-khai-truong-khung-tranh-tone-hong.jpg'),
(689, 'Kệ hoa khai trương - Tone Blue', 1750000.00, 'ke-hoa-khai-truong-tone-blue.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Đại cát đại lợi, mã đáo thành công! Hãy để những nụ hoa tươi tắn này mang đến luồng sinh khí mới cho ngày khai trương rực rỡ.', 'ke-hoa-khai-truong-tone-blue.jpg'),
(690, 'Kệ hoa khai trương - Tone Vàng', 1500000.00, 'ke-hoa-khai-truong-tone-vang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'ke-hoa-khai-truong-tone-vang.jpg'),
(691, 'Kệ hoa khai trương - Tone Tím Hồng', 1750000.00, 'ke-hoa-khai-truong-tone-tim-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Như những bông hoa vươn mình đón nắng mai, chúc doanh nghiệp của bạn luôn tỏa sáng và dẫn đầu trên thị trường.', 'ke-hoa-khai-truong-tone-tim-hong.jpg'),
(692, 'Kệ hoa khai trương - Vintage Tone Nâu Đỏ', 1750000.00, 'ke-hoa-khai-truong-vintage-tone-nau-do.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Một khởi đầu mới luôn cần những lời chúc tốt đẹp nhất. Lẵng hoa này là biểu tượng của sự thịnh vượng, may mắn và thành công rực rỡ.', 'ke-hoa-khai-truong-vintage-tone-nau-do.jpg'),
(693, 'Bình Hoa Tân Cổ Điển - Tone Hồng Đậm', 2500000.00, 'binh-hoa-tan-co-dien-tone-hong-dam.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'binh-hoa-tan-co-dien-tone-hong-dam.jpg'),
(694, 'Kệ hoa khai trương - Khung tranh Tone Vàng', 1750000.00, 'ke-hoa-khai-truong-khung-tranh-tone-vang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'ke-hoa-khai-truong-khung-tranh-tone-vang.jpg'),
(695, 'Kệ hoa khai trương -  Chân sắt Tone Vàng', 1500000.00, 'ke-hoa-khai-truong-chan-sat-tone-vang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'ke-hoa-khai-truong-chan-sat-tone-vang.jpg'),
(696, 'Bó hoa hướng dương mix Ping Pong tốt nghiệp', 380000.00, 'bo-hoa-huong-duong-mix-ping-pong-tot-nghiep.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Khép lại một chặng đường nỗ lực, mở ra một chân trời mới. Đóa hoa này là lời chúc mừng cho những cố gắng không ngừng nghỉ của bạn.', 'bo-hoa-huong-duong-mix-ping-pong-tot-nghiep.jpg'),
(697, 'Bó hoa tốt nghiệp Cúc ping pong tone Hồng', 420000.00, 'bo-hoa-tot-nghiep-cuc-ping-pong-tone-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Thành công hôm nay là kết quả của những nỗ lực bền bỉ. Hãy tự hào về bản thân và vững bước trên con đường tương lai rộng mở!', 'bo-hoa-tot-nghiep-cuc-ping-pong-tone-hong.jpg'),
(698, 'Bó hoa tone hồng tặng tốt nghiệp', 300000.00, 'bo-hoa-tone-hong-tang-tot-nghiep.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và bó hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-hoa-tone-hong-tang-tot-nghiep.jpg'),
(699, 'Bó hoa tú cầu xanh tone Blue', 370000.00, 'bo-hoa-tu-cau-xanh-tone-blue.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Khép lại một chặng đường nỗ lực, mở ra một chân trời mới. Đóa hoa này là lời chúc mừng cho những cố gắng không ngừng nghỉ của bạn.', 'bo-hoa-tu-cau-xanh-tone-blue.jpg'),
(700, 'Bó hoa tốt nghiệp Cúc ping pong tone Xanh/ Hồng', 420000.00, 'bo-hoa-tot-nghiep-cuc-ping-pong-tone-xanh-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Lễ tốt nghiệp không phải là kết thúc, mà là sự khởi đầu. Bó hoa rạng rỡ này là phần thưởng xứng đáng cho những đêm dài không ngủ.', 'bo-hoa-tot-nghiep-cuc-ping-pong-tone-xanh-hong.jpg'),
(701, 'Hướng Dương Mix - 5B', 450000.00, 'huong-duong-mix-5b.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chặng đường học vấn đầy tự hào đã đơm hoa kết trái. Chúc bạn luôn giữ mãi khát vọng và gặt hái thành công trên nấc thang mới.', 'huong-duong-mix-5b.jpg'),
(702, 'Hướng Dương Mix - Size L', 490000.00, 'huong-duong-mix-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và bó hoa này để tự tin chinh phục những đỉnh cao mới.', 'huong-duong-mix-size-l.jpg'),
(703, 'Bó hoa cưới hoa lụa Tulip mix - Dáng vát 1 mặt - Tone trắng kem', 500000.00, 'bo-hoa-cuoi-hoa-lua-tulip-mix-dang-vat-1-mat-tone-trang-kem.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-hoa-lua-tulip-mix-dang-vat-1-mat-tone-trang-kem.jpg'),
(704, 'Bó hoa cưới hoa lụa Mao lương mix - Dáng vát 1 mặt - Tone Hồng', 420000.00, 'bo-hoa-cuoi-hoa-lua-mao-luong-mix-dang-vat-1-mat-tone-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-hoa-lua-mao-luong-mix-dang-vat-1-mat-tone-hong.jpg'),
(705, 'Bó hoa cưới hoa lụa - Dáng tròn - Tone màu Trắng Kem Cam', 420000.00, 'bo-hoa-cuoi-hoa-lua-dang-tron-tone-mau-trang-kem-cam.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Ánh mắt trao nhau, nụ cười hé mở... Đóa hoa này là một nốt nhạc ngọt ngào trong bản tình ca của hai chúng ta.', 'bo-hoa-cuoi-hoa-lua-dang-tron-tone-mau-trang-kem-cam.jpg'),
(706, 'Hộp hoa lụa mica - tone Xanh Blue (30x35cm)', 680000.00, 'hop-hoa-lua-mica-tone-xanh-blue-30x35cm.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-lua-mica-tone-xanh-blue-30x35cm.jpg'),
(707, 'Hộp hoa lụa Mica - Tone Blue (20x27cm)', 500000.00, 'hop-hoa-lua-mica-tone-blue-20x27cm.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-lua-mica-tone-blue-20x27cm.jpg'),
(708, 'Hộp tim hoa lụa tone hồng cam', 399000.00, 'hop-tim-hoa-lua-tone-hong-cam.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Sự lãng mạn không cần phải quá cầu kỳ. Đôi khi, chỉ một bó hoa tươi thắm cũng đủ để thắp sáng nụ cười của người bạn yêu thương.', 'hop-tim-hoa-lua-tone-hong-cam.jpg'),
(709, 'Hộp hoa lụa mica - tone tím hồng (30x35cm)', 680000.00, 'hop-hoa-lua-mica-tone-tim-hong-30x35cm.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-lua-mica-tone-tim-hong-30x35cm.jpg'),
(710, 'Hộp hoa lụa mica - tone đỏ cam (30x35cm)', 680000.00, 'hop-hoa-lua-mica-tone-do-cam-30x35cm.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-lua-mica-tone-do-cam-30x35cm.jpg'),
(711, 'Bó hoa khô tone hồng - Size L', 890000.00, 'bo-hoa-kho-tone-hong-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Tình yêu không chỉ là những lời hứa, mà là sự hiện diện. Đóa hoa này thay cho một lời nhắn nhủ: \'Mình luôn ở đây, bên cạnh bạn\'.', 'bo-hoa-kho-tone-hong-size-l.jpg'),
(712, 'Hộp hoa khô Mica - Tone hồng', 500000.00, 'hop-hoa-kho-mica-tone-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-kho-mica-tone-hong.jpg'),
(713, 'Bó hoa khô - Cẩm tú cầu (1 cành hoa)', 290000.00, 'bo-hoa-kho-cam-tu-cau-1-canh-hoa.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-hoa-kho-cam-tu-cau-1-canh-hoa.jpg'),
(714, 'Hộp tim hoa lụa tone xanh Blue', 399000.00, 'hop-tim-hoa-lua-tone-xanh-blue.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Không có món quà nào lãng mạn hơn một bó hoa bất ngờ. Hãy để những cánh hoa này thay vạn lời yêu thương chưa nói.', 'hop-tim-hoa-lua-tone-xanh-blue.jpg'),
(715, 'Hộp hoa lụa tone Hồng (có chỗ để kèm quà tặng)', 399000.00, 'hop-hoa-lua-tone-hong-co-cho-de-kem-qua-tang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-lua-tone-hong-co-cho-de-kem-qua-tang.jpg'),
(716, 'Hộp hoa lụa tone Vàng (có chỗ để kèm quà tặng)', 399000.00, 'hop-hoa-lua-tone-vang-co-cho-de-kem-qua-tang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'hop-hoa-lua-tone-vang-co-cho-de-kem-qua-tang.jpg'),
(717, 'Bình hoa lụa tone Hồng vỏ đỗ - Size M - 1 mặt', 630000.00, 'binh-hoa-lua-tone-hong-vo-do-size-m-1-mat.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'binh-hoa-lua-tone-hong-vo-do-size-m-1-mat.jpg'),
(718, 'Bó hoa lụa size L - Tone Xanh dương', 600000.00, 'bo-hoa-lua-size-l-tone-xanh-duong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Mỗi đóa hoa tại Floral Haven đều mang một thông điệp tình yêu duy nhất, được gửi gắm qua từng nhánh lá và hương thơm nhẹ nhàng.', 'bo-hoa-lua-size-l-tone-xanh-duong.jpg'),
(719, 'Bó hoa lụa Size L - Tone nâu cafe (tặng kèm túi)', 550000.00, 'bo-hoa-lua-size-l-tone-nau-cafe-tang-kem-tui.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Sự lãng mạn không cần phải quá cầu kỳ. Đôi khi, chỉ một bó hoa tươi thắm cũng đủ để thắp sáng nụ cười của người bạn yêu thương.', 'bo-hoa-lua-size-l-tone-nau-cafe-tang-kem-tui.jpg'),
(720, 'Bó hoa lụa mix tone tím hồng - Size M', 380000.00, 'bo-hoa-lua-mix-tone-tim-hong-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-lua-mix-tone-tim-hong-size-m.jpg'),
(721, 'Bó hoa lụa Size M - Dãng Tròn - Tone Cafe', 380000.00, 'bo-hoa-lua-size-m-dang-tron-tone-cafe.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Tình yêu không chỉ là những lời hứa, mà là sự hiện diện. Đóa hoa này thay cho một lời nhắn nhủ: \'Mình luôn ở đây, bên cạnh bạn\'.', 'bo-hoa-lua-size-m-dang-tron-tone-cafe.jpg'),
(722, 'Bó hoa lụa size M - Dáng tròn - Tone xanh dương', 320000.00, 'bo-hoa-lua-size-m-dang-tron-tone-xanh-duong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Tình yêu đích thực giống như loài hoa quý, cần sự nâng niu và chăm sóc mỗi ngày để mãi mãi tỏa ngát hương thơm.', 'bo-hoa-lua-size-m-dang-tron-tone-xanh-duong.jpg'),
(723, 'Bó hoa lụa Size S - Tone Cafe', 250000.00, 'bo-hoa-lua-size-s-tone-cafe.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'bo-hoa-lua-size-s-tone-cafe.jpg'),
(724, 'Bó hoa lụa size S - Hoa hồng cafe', 199000.00, 'bo-hoa-lua-size-s-hoa-hong-cafe.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Ánh mắt trao nhau, nụ cười hé mở... Đóa hoa này là một nốt nhạc ngọt ngào trong bản tình ca của hai chúng ta.', 'bo-hoa-lua-size-s-hoa-hong-cafe.jpg'),
(725, 'Bó hoa lụa size S - Tone Xanh dương', 250000.00, 'bo-hoa-lua-size-s-tone-xanh-duong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Tình yêu đích thực giống như loài hoa quý, cần sự nâng niu và chăm sóc mỗi ngày để mãi mãi tỏa ngát hương thơm.', 'bo-hoa-lua-size-s-tone-xanh-duong.jpg');
INSERT INTO `products` (`product_id`, `name`, `price`, `image_url`, `description`, `stock_quantity`, `category_id`, `is_active`, `story_text`, `story_image`) VALUES
(726, 'Bó hoa lụa size S - Tone vàng', 250000.00, 'bo-hoa-lua-size-s-tone-vang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-lua-size-s-tone-vang.jpg'),
(727, 'Bó hoa lụa mini 1B - Hoa hồng', 69000.00, 'bo-hoa-lua-mini-1b-hoa-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'bo-hoa-lua-mini-1b-hoa-hong.jpg'),
(728, 'Bó hoa lụa mini 1B - Hoa hồng trắng', 69000.00, 'bo-hoa-lua-mini-1b-hoa-hong-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'bo-hoa-lua-mini-1b-hoa-hong-trang.jpg'),
(729, 'Bó hoa lụa mini 1B - Hoa hồng xanh', 69000.00, 'bo-hoa-lua-mini-1b-hoa-hong-xanh.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'bo-hoa-lua-mini-1b-hoa-hong-xanh.jpg'),
(730, 'Bó hoa lụa mini 1B - Hoa hồng đỏ', 69000.00, 'bo-hoa-lua-mini-1b-hoa-hong-do.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'bo-hoa-lua-mini-1b-hoa-hong-do.jpg'),
(731, 'Bó hoa lụa mini - Hoa hồng cafe 1 Bông', 62000.00, 'bo-hoa-lua-mini-hoa-hong-cafe-1-bong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'bo-hoa-lua-mini-hoa-hong-cafe-1-bong.jpg'),
(732, 'Bó hoa lụa size S - Tone hồng', 299000.00, 'bo-hoa-lua-size-s-tone-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'bo-hoa-lua-size-s-tone-hong.jpg'),
(733, 'Bó hoa \"Candy Kiss\" - Tone Hồng - Size M', 550000.00, 'bo-hoa-candy-kiss-tone-hong-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Sự lãng mạn không cần phải quá cầu kỳ. Đôi khi, chỉ một bó hoa tươi thắm cũng đủ để thắp sáng nụ cười của người bạn yêu thương.', 'bo-hoa-candy-kiss-tone-hong-size-m.jpg'),
(734, 'Bó hồng đỏ mix tuyết mai - size M', 690000.00, 'bo-hong-do-mix-tuyet-mai-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-do-mix-tuyet-mai-size-m.jpg'),
(735, 'Bó hồng Ohara mix Panxe hồng - Bó dáng tròn Princess', 650000.00, 'bo-hong-ohara-mix-panxe-hong-bo-dang-tron-princess.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-ohara-mix-panxe-hong-bo-dang-tron-princess.jpg'),
(736, 'Bó hồng đỏ mix giấy bạc - Size S', 250000.00, 'bo-hong-do-mix-giay-bac-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-do-mix-giay-bac-size-s.jpg'),
(737, 'Bó hồng dâu mix cỏ đồng tiền - size S- dáng tròn', 290000.00, 'bo-hong-dau-mix-co-dong-tien-size-s-dang-tron.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-dau-mix-co-dong-tien-size-s-dang-tron.jpg'),
(738, 'Bó hoa hồng đỏ - 5B - Size S', 250000.00, 'bo-hoa-hong-do-5b-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Em là đóa hoa đẹp nhất trong khu vườn trái tim anh. Gửi tặng em bó hoa này như một minh chứng cho tình yêu vĩnh cửu.', 'bo-hoa-hong-do-5b-size-s.jpg'),
(739, 'Bó hồng đỏ  - Red Rose Premium size M+', 850000.00, 'bo-hong-do-red-rose-premium-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Em là đóa hoa đẹp nhất trong khu vườn trái tim anh. Gửi tặng em bó hoa này như một minh chứng cho tình yêu vĩnh cửu.', 'bo-hong-do-red-rose-premium-size-m.jpg'),
(740, 'Bó hồng đỏ Ex mix tuyết mai', 750000.00, 'bo-hong-do-ex-mix-tuyet-mai.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hong-do-ex-mix-tuyet-mai.jpg'),
(741, 'Hồng đỏ Red Naomi - Bó size S - 10 Bông', 490000.00, 'hong-do-red-naomi-bo-size-s-10-bong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Tình yêu không chỉ là những lời hứa, mà là sự hiện diện. Đóa hoa này thay cho một lời nhắn nhủ: \'Mình luôn ở đây, bên cạnh bạn\'.', 'hong-do-red-naomi-bo-size-s-10-bong.jpg'),
(742, 'Bó hồng đỏ pháp size S', 399000.00, 'bo-hong-do-phap-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Giữa hàng vạn người lướt qua nhau, ta tìm thấy nhau. Đóa hoa này là món quà dành tặng cho sự diệu kỳ của nhân duyên.', 'bo-hong-do-phap-size-s.jpg'),
(743, 'Bó hồng đỏ Explorer Đà Lạt - bó 30b - Size L', 790000.00, 'bo-hong-do-explorer-da-lat-bo-30b-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Mỗi đóa hoa tại Floral Haven đều mang một thông điệp tình yêu duy nhất, được gửi gắm qua từng nhánh lá và hương thơm nhẹ nhàng.', 'bo-hong-do-explorer-da-lat-bo-30b-size-l.jpg'),
(744, 'Red Rose Mix Baby', 550000.00, 'red-rose-mix-baby.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'red-rose-mix-baby.jpg'),
(745, 'Bó hoa Tulip Đỏ - Size M', 720000.00, 'bo-hoa-tulip-do-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Tình yêu không chỉ là những lời hứa, mà là sự hiện diện. Đóa hoa này thay cho một lời nhắn nhủ: \'Mình luôn ở đây, bên cạnh bạn\'.', 'bo-hoa-tulip-do-size-m.jpg'),
(746, 'Hồng kem dâu mix Baby', 520000.00, 'hong-kem-dau-mix-baby.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'hong-kem-dau-mix-baby.jpg'),
(747, 'Pink O\'hara - Bó vát size M', 590000.00, 'pink-o-hara-bo-vat-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Tình yêu không chỉ là những lời hứa, mà là sự hiện diện. Đóa hoa này thay cho một lời nhắn nhủ: \'Mình luôn ở đây, bên cạnh bạn\'.', 'pink-o-hara-bo-vat-size-m.jpg'),
(748, 'Bó hồng đỏ pháp Size M', 650000.00, 'bo-hong-do-phap-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Tình yêu đích thực giống như loài hoa quý, cần sự nâng niu và chăm sóc mỗi ngày để mãi mãi tỏa ngát hương thơm.', 'bo-hong-do-phap-size-m.jpg'),
(749, 'Pink O\'hara & Red Rose - Bó tròn size M', 490000.00, 'pink-o-hara-red-rose-bo-tron-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Ánh mắt trao nhau, nụ cười hé mở... Đóa hoa này là một nốt nhạc ngọt ngào trong bản tình ca của hai chúng ta.', 'pink-o-hara-red-rose-bo-tron-size-m.jpg'),
(750, 'Rose Setta - Red Naomi (Premium Red Rose)', 890000.00, 'rose-setta-red-naomi-premium-red-rose.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Em là đóa hoa đẹp nhất trong khu vườn trái tim anh. Gửi tặng em bó hoa này như một minh chứng cho tình yêu vĩnh cửu.', 'rose-setta-red-naomi-premium-red-rose.jpg'),
(751, 'Pink O\'hara - Big Size', 850000.00, 'pink-o-hara-big-size.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'pink-o-hara-big-size.jpg'),
(752, 'Bình hoa Tết: Kim Ngọc Cát Tường', 3200000.00, 'binh-hoa-tet-kim-ngoc-cat-tuong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'binh-hoa-tet-kim-ngoc-cat-tuong.jpg'),
(753, 'Bình Hoa Tết: Tài Vượng Xuân Hoa', 4500000.00, 'binh-hoa-tet-tai-vuong-xuan-hoa.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'binh-hoa-tet-tai-vuong-xuan-hoa.jpg'),
(754, 'Thược Dược Kim Diễm trang trí Tết', 500000.00, 'thuoc-duoc-kim-diem-trang-tri-tet.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Yêu là trao đi không mưu cầu nhận lại, cũng như đóa hoa này dâng hiến hương sắc để làm đẹp cho đời.', 'thuoc-duoc-kim-diem-trang-tri-tet.jpg'),
(755, 'Bình hoa Phú Quý Mãn Đường', 2900000.00, 'binh-hoa-phu-quy-man-duong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'binh-hoa-phu-quy-man-duong.jpg'),
(756, 'Bình hoa Xuân Hòa Cát Tường', 2500000.00, 'binh-hoa-xuan-hoa-cat-tuong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 2, 1, 'Một chút điểm xuyết nhỏ bé nhưng tinh tế sẽ làm cho món quà của bạn trở nên trọn vẹn và ý nghĩa hơn.', 'binh-hoa-xuan-hoa-cat-tuong.jpg'),
(757, 'Đào đông đỏ - Set 5c - 60cm', 950000.00, 'dao-dong-do-set-5c-60cm.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Hoa có thể tàn, nhưng tình yêu anh dành cho em thì mãi mãi vẹn nguyên. Bó hoa này là lời hứa sắt son từ tận đáy lòng.', 'dao-dong-do-set-5c-60cm.jpg'),
(758, 'Dark Blue - Double Tulip', 1500000.00, 'dark-blue-double-tulip.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Không có món quà nào lãng mạn hơn một bó hoa bất ngờ. Hãy để những cánh hoa này thay vạn lời yêu thương chưa nói.', 'dark-blue-double-tulip.jpg'),
(759, 'Bó hoa cưới tone Xanh trắng (thiên nga, tulip)', 1200000.00, 'bo-hoa-cuoi-tone-xanh-trang-thien-nga-tulip.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Giữa hàng vạn người lướt qua nhau, ta tìm thấy nhau. Đóa hoa này là món quà dành tặng cho sự diệu kỳ của nhân duyên.', 'bo-hoa-cuoi-tone-xanh-trang-thien-nga-tulip.jpg'),
(760, 'Bó hoa cưới Tulip mix thiên nga', 1500000.00, 'bo-hoa-cuoi-tulip-mix-thien-nga.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-tulip-mix-thien-nga.jpg'),
(761, 'Bó tulip xanh dương đậm (Dark Blue) - Set 12 bông', 950000.00, 'bo-tulip-xanh-duong-dam-dark-blue-set-12-bong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Sự lãng mạn không cần phải quá cầu kỳ. Đôi khi, chỉ một bó hoa tươi thắm cũng đủ để thắp sáng nụ cười của người bạn yêu thương.', 'bo-tulip-xanh-duong-dam-dark-blue-set-12-bong.jpg'),
(762, 'Bó Tulip trắng 20 bông', 1350000.00, 'bo-tulip-trang-20-bong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'bo-tulip-trang-20-bong.jpg'),
(763, 'Bó Tulip Mix màu gói hiện đại', 675000.00, 'bo-tulip-mix-mau-goi-hien-dai.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-tulip-mix-mau-goi-hien-dai.jpg'),
(764, 'Bó Tulip hồng mix 5B', 468000.00, 'bo-tulip-hong-mix-5b.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-tulip-hong-mix-5b.jpg'),
(765, 'Bó tulip đỏ - 5 Bông', 405000.00, 'bo-tulip-do-5-bong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Có những cảm xúc không thể diễn tả bằng lời, chỉ có thể mượn vẻ đẹp của những cánh hoa để nói thay tiếng lòng sâu kín nhất.', 'bo-tulip-do-5-bong.jpg'),
(766, 'Bó tulip hồng kép - Size M', 720000.00, 'bo-tulip-hong-kep-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Ánh mắt trao nhau, nụ cười hé mở... Đóa hoa này là một nốt nhạc ngọt ngào trong bản tình ca của hai chúng ta.', 'bo-tulip-hong-kep-size-m.jpg'),
(767, 'Bó Tulip Hồng Trắng mix hoa lá phụ', 765000.00, 'bo-tulip-hong-trang-mix-hoa-la-phu.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-tulip-hong-trang-mix-hoa-la-phu.jpg'),
(768, 'Bó hoa cưới Calla Lily mix Tulip dáng rủ', 1650000.00, 'bo-hoa-cuoi-calla-lily-mix-tulip-dang-ru.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-calla-lily-mix-tulip-dang-ru.jpg'),
(769, 'Bó hoa cưới Tulip trắng', 1600000.00, 'bo-hoa-cuoi-tulip-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Em là đóa hoa đẹp nhất trong khu vườn trái tim anh. Gửi tặng em bó hoa này như một minh chứng cho tình yêu vĩnh cửu.', 'bo-hoa-cuoi-tulip-trang.jpg'),
(770, 'Bó hoa cưới Calla Lily mix Tulip trắng', 1950000.00, 'bo-hoa-cuoi-calla-lily-mix-tulip-trang.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-calla-lily-mix-tulip-trang.jpg'),
(771, 'Bó hoa hồng O\'hara mix lá bạc', 280000.00, 'bo-hoa-hong-o-hara-mix-la-bac.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-hong-o-hara-mix-la-bac.jpg'),
(772, 'Bó hoa Ohara mix Tulip', 1500000.00, 'bo-hoa-ohara-mix-tulip.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-ohara-mix-tulip.jpg'),
(773, 'Pink O\'hara - Big Size - Bó tròn', 790000.00, 'pink-o-hara-big-size-bo-tron.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Ánh mắt trao nhau, nụ cười hé mở... Đóa hoa này là một nốt nhạc ngọt ngào trong bản tình ca của hai chúng ta.', 'pink-o-hara-big-size-bo-tron.jpg'),
(774, 'Bó hoa Tú Cầu trắng mix Peony Sarah', 1400000.00, 'bo-hoa-tu-cau-trang-mix-peony-sarah.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-hoa-tu-cau-trang-mix-peony-sarah.jpg'),
(775, 'Bó hoa tone hồng mix tú cầu và (Orchid)', 650000.00, 'bo-hoa-tone-hong-mix-tu-cau-va-orchid.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-hoa-tone-hong-mix-tu-cau-va-orchid.jpg'),
(776, 'Bó tú cầu hồng mix hồng trắng điểm hoa phụ', 650000.00, 'bo-tu-cau-hong-mix-hong-trang-diem-hoa-phu.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-tu-cau-hong-mix-hong-trang-diem-hoa-phu.jpg'),
(777, 'Bó hoa Cẩm tú cầu hồng mix Tulip', 1050000.00, 'bo-hoa-cam-tu-cau-hong-mix-tulip.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-hoa-cam-tu-cau-hong-mix-tulip.jpg'),
(778, 'Tú cầu tím mix baby', 300000.00, 'tu-cau-tim-mix-baby.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'tu-cau-tim-mix-baby.jpg'),
(779, 'Tú cầu hồng mix', 350000.00, 'tu-cau-hong-mix.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'tu-cau-hong-mix.jpg'),
(780, 'Tú cầu xanh mix', 600000.00, 'tu-cau-xanh-mix.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'tu-cau-xanh-mix.jpg'),
(781, 'Tú cầu hồng mix', 520000.00, 'tu-cau-hong-mix.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'tu-cau-hong-mix.jpg'),
(782, 'Tú cầu mix tone blue', 420000.00, 'tu-cau-mix-tone-blue.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'tu-cau-mix-tone-blue.jpg'),
(783, 'Tú cầu hồng mix', 320000.00, 'tu-cau-hong-mix.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'tu-cau-hong-mix.jpg'),
(784, 'Tú cầu xanh mix hoa phụ', 400000.00, 'tu-cau-xanh-mix-hoa-phu.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'tu-cau-xanh-mix-hoa-phu.jpg'),
(785, 'Tú cầu xanh mix hoa hồng', 380000.00, 'tu-cau-xanh-mix-hoa-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'tu-cau-xanh-mix-hoa-hong.jpg'),
(786, 'Tú cầu hồng mix - Vải thô', 580000.00, 'tu-cau-hong-mix-vai-tho.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'tu-cau-hong-mix-vai-tho.jpg'),
(787, 'Bó tú cầu hồng mix hoa hồng - Tone cam hồng - Size L', 650000.00, 'bo-tu-cau-hong-mix-hoa-hong-tone-cam-hong-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-tu-cau-hong-mix-hoa-hong-tone-cam-hong-size-l.jpg'),
(788, 'Bó tú cầu hồng mix hoa hồng - Tone cam hồng', 550000.00, 'bo-tu-cau-hong-mix-hoa-hong-tone-cam-hong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-tu-cau-hong-mix-hoa-hong-tone-cam-hong.jpg'),
(789, 'Juliet Rose mix lá bạc  - Size M', 390000.00, 'juliet-rose-mix-la-bac-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'juliet-rose-mix-la-bac-size-m.jpg'),
(790, 'Bó hoa Juliet mix tone Cam - Size M', 550000.00, 'bo-hoa-juliet-mix-tone-cam-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-juliet-mix-tone-cam-size-m.jpg'),
(791, 'Bó hoa cưới - Juliet vs Tulip (Tone cam) - 02', 890000.00, 'bo-hoa-cuoi-juliet-vs-tulip-tone-cam-02.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-juliet-vs-tulip-tone-cam-02.jpg'),
(792, 'Bó hoa cưới  - Juliet vs Tulip (Tone cam)', 890000.00, 'bo-hoa-cuoi-juliet-vs-tulip-tone-cam.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bo-hoa-cuoi-juliet-vs-tulip-tone-cam.jpg'),
(793, 'Bó hoa cưới - Juliet Rose x Lan tường', 699000.00, 'bo-hoa-cuoi-juliet-rose-x-lan-tuong.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 5, 1, 'Yêu là trao đi không mưu cầu nhận lại, cũng như đóa hoa này dâng hiến hương sắc để làm đẹp cho đời.', 'bo-hoa-cuoi-juliet-rose-x-lan-tuong.jpg'),
(794, 'Giỏ hoa Hướng dương - Size M', 450000.00, 'gio-hoa-huong-duong-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'gio-hoa-huong-duong-size-m.jpg'),
(795, 'Giỏ hoa Hướng dương - Size L', 650000.00, 'gio-hoa-huong-duong-size-l.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'gio-hoa-huong-duong-size-l.jpg'),
(796, 'Bó ốc quế - Tulip Tím nhạt 5b', 450000.00, 'bo-oc-que-tulip-tim-nhat-5b.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Ánh mắt trao nhau, nụ cười hé mở... Đóa hoa này là một nốt nhạc ngọt ngào trong bản tình ca của hai chúng ta.', 'bo-oc-que-tulip-tim-nhat-5b.jpg'),
(797, 'FS BOX - Bó hồng đỏ mix Tulip', 950000.00, 'fs-box-bo-hong-do-mix-tulip.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'fs-box-bo-hong-do-mix-tulip.jpg'),
(798, 'BOX CARTON - Flower Secret Box - Phù hợp các bó Size M/ M+', 65000.00, 'box-carton-flower-secret-box-phu-hop-cac-bo-size-m-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 6, 1, 'Mỗi đóa hoa tại Floral Haven đều mang một thông điệp tình yêu duy nhất, được gửi gắm qua từng nhánh lá và hương thơm nhẹ nhàng.', 'box-carton-flower-secret-box-phu-hop-cac-bo-size-m-m.jpg'),
(799, 'Quạt hoa Peony mix Lan Hồ điệp', 1500000.00, 'quat-hoa-peony-mix-lan-ho-diep.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'quat-hoa-peony-mix-lan-ho-diep.jpg'),
(800, 'Winter Sky - Bó hồng trắng mix Lam tinh - Size M', 1200000.00, 'winter-sky-bo-hong-trang-mix-lam-tinh-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'winter-sky-bo-hong-trang-mix-lam-tinh-size-m.jpg'),
(801, 'Bleu Rêve - Bó hoa hồng trắng mix tone Blue và Lan HĐ', 450000.00, 'bleu-reve-bo-hoa-hong-trang-mix-tone-blue-va-lan-hd.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'bleu-reve-bo-hoa-hong-trang-mix-tone-blue-va-lan-hd.jpg'),
(802, 'Mộng Lam - Bó hoa sao xanh mix phi yến (hoa lam tinh)', 620000.00, 'mong-lam-bo-hoa-sao-xanh-mix-phi-yen-hoa-lam-tinh.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 3, 1, 'Thêm một tuổi mới là thêm một chặng đường tuyệt đẹp. Bó hoa này là lời chúc cho một thanh xuân rực rỡ.', 'mong-lam-bo-hoa-sao-xanh-mix-phi-yen-hoa-lam-tinh.jpg'),
(803, 'Mộng Lam - Bó hoa sao xanh (lam tinh) Size M', 490000.00, 'mong-lam-bo-hoa-sao-xanh-lam-tinh-size-m.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Không có món quà nào lãng mạn hơn một bó hoa bất ngờ. Hãy để những cánh hoa này thay vạn lời yêu thương chưa nói.', 'mong-lam-bo-hoa-sao-xanh-lam-tinh-size-m.jpg'),
(804, 'Bó ốc quế size S - Tone trắng xanh', 350000.00, 'bo-oc-que-size-s-tone-trang-xanh.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Tình yêu không chỉ là những lời hứa, mà là sự hiện diện. Đóa hoa này thay cho một lời nhắn nhủ: \'Mình luôn ở đây, bên cạnh bạn\'.', 'bo-oc-que-size-s-tone-trang-xanh.jpg'),
(805, 'Bó hoa tin nhắn - Tone Xanh Blue', 380000.00, 'bo-hoa-tin-nhan-tone-xanh-blue.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Giữa hàng vạn người lướt qua nhau, ta tìm thấy nhau. Đóa hoa này là món quà dành tặng cho sự diệu kỳ của nhân duyên.', 'bo-hoa-tin-nhan-tone-xanh-blue.jpg'),
(806, 'Bó tú cầu xanh Blue 1 Cành', 250000.00, 'bo-tu-cau-xanh-blue-1-canh.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 4, 1, 'Chúc mừng bạn đã chạm tay đến ước mơ! Hãy mang theo hành trang tri thức và đóa hoa này để tự tin chinh phục những đỉnh cao mới.', 'bo-tu-cau-xanh-blue-1-canh.jpg'),
(807, 'Bó hoa Diên vĩ tím (Iris) - Size S', 490000.00, 'bo-hoa-dien-vi-tim-iris-size-s.jpg', 'Hoa tươi nhập khẩu từ Iris Florist', 20, 1, 1, 'Không có món quà nào lãng mạn hơn một bó hoa bất ngờ. Hãy để những cánh hoa này thay vạn lời yêu thương chưa nói.', 'bo-hoa-dien-vi-tim-iris-size-s.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `login_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT 1,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `login_name`, `password`, `email`, `phone`, `address`, `role_id`, `status`) VALUES
(1, 'Quản trị viên', 'admin', '1', 'admin@floralhaven.vn', '0988000999', 'Hệ thống', 2, 1),
(2, 'Long Hoàng', 'longhoang', '1', 'longhoang@gmail.com', '0988111222', 'Hà Nội', 1, 1),
(3, 'Hồ Thị Lan Hương', 'lanhuong', '1', 'lanhuong@gmail.com', '0988333444', 'Hà Nội', 1, 1),
(4, 'Lý Linh', 'lylinh', '1', 'lylinh@gmail.com', '0988555666', 'Hà Nội', 1, 1),
(5, 'Ngọc Linh', 'ngoclinh', '1', 'ngoclinh@gmail.com', '0988777888', 'Hà Nội', 1, 1),
(6, 'Ngọcc Chii', 'ngocchi', '1', 'ngocchi@gmail.com', '0988999000', 'Hà Nội', 1, 1),
(7, 'Nguyễn Dương', 'nguyenduong', '1', 'nguyenduong@gmail.com', '0988222333', 'Hà Nội', 1, 1),
(8, 'Hữu Dũng', 'huudung', '1', 'huudung@gmail.com', '0912345678', 'TP. Hồ Chí Minh', 1, 1),
(9, 'Trần Thảo', 'tranthao', '1', 'thao.tran@gmail.com', '0912444555', 'Đà Nẵng', 1, 1),
(10, 'Trương Huy Đông', 'huydong', '1', 'dong.truong@gmail.com', '0912666777', 'Hải Phòng', 1, 1),
(11, 'Vũ Trường', 'vutruong', '1', 'truong.vu@gmail.com', '0912888999', 'Cần Thơ', 1, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `login_name` (`login_name`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=808;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
