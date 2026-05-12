/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tiemhoa.dao;

import com.tiemhoa.model.Cart;
import com.tiemhoa.model.CartItem;
import com.tiemhoa.model.Order;
import com.tiemhoa.model.OrderDetail;
import com.tiemhoa.model.Product;
import com.tiemhoa.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class OrderDAO {

    // =====================================================================
    // 1. CREATE: TẠO ĐƠN HÀNG MỚI 
    // =====================================================================
    public boolean createOrder(Cart cart, int userId, String recipientName, String recipientPhone, String address, String note, String paymentMethod) {
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false); // Bật Transaction

            // LƯU BẢNG ORDERS 
            double totalPayment = cart.getTotalMoney() + (cart.getTotalMoney() * 0.08) + 15000;

            String sqlOrder = "INSERT INTO orders (user_id, recipient_name, recipient_phone, shipping_address, order_note, payment_method, total_amount, status, created_at) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, 'Hoàn Thành', NOW())";

            PreparedStatement psOrder = conn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
            psOrder.setInt(1, userId);
            psOrder.setString(2, recipientName);
            psOrder.setString(3, recipientPhone);
            psOrder.setString(4, address);
            psOrder.setString(5, note);
            psOrder.setString(6, paymentMethod);
            psOrder.setDouble(7, totalPayment);

            int affectedRows = psOrder.executeUpdate();
            if (affectedRows == 0) {
                conn.rollback();
                return false;
            }

            // Lấy ID đơn hàng vừa tạo
            ResultSet rs = psOrder.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // LƯU BẢNG ORDER_DETAILS 
            String sqlDetail = "INSERT INTO order_details (order_id, product_id, quantity, unit_price) VALUES (?, ?, ?, ?)";
            PreparedStatement psDetail = conn.prepareStatement(sqlDetail);

            for (CartItem item : cart.getItems()) {
                psDetail.setInt(1, orderId);
                psDetail.setInt(2, item.getProduct().getProductId());
                psDetail.setInt(3, item.getQuantity());
                psDetail.setDouble(4, item.getProduct().getPrice());
                psDetail.addBatch();
            }
            psDetail.executeBatch();

            // CHỐT LƯU
            conn.commit();
            return true;

        } catch (Exception e) {
            System.out.println("Lỗi lưu đơn hàng: " + e.getMessage());
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (Exception ex) {
            }
        } finally {
            try {
                if (conn != null) {
                    conn.setAutoCommit(true);
                    conn.close();
                }
            } catch (Exception e) {
            }
        }
        return false;
    }

    // =====================================================================
    // 2. READ: LẤY TẤT CẢ ĐƠN HÀNG (DÀNH CHO TRANG QUẢN TRỊ ADMIN)
    // =====================================================================
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders ORDER BY created_at DESC"; // Đơn mới nhất xếp lên đầu

        try ( Connection conn = DBConnection.getConnection();  PreparedStatement ps = conn.prepareStatement(sql);  ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Order order = new Order(
                        rs.getInt("order_id"),
                        rs.getInt("user_id"),
                        rs.getString("recipient_name"),
                        rs.getString("recipient_phone"),
                        rs.getString("shipping_address"),
                        rs.getString("order_note"),
                        rs.getString("payment_method"),
                        rs.getDouble("total_amount"),
                        rs.getString("status"),
                        rs.getTimestamp("created_at")
                );
                list.add(order);
            }
        } catch (Exception e) {
            System.out.println("Lỗi getAllOrders: " + e.getMessage());
        }
        return list;
    }

    public int getTotalOrders() {
        String sql = "SELECT COUNT(*) FROM orders";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Order> getOrdersByPage(int page, int pageSize) {
        List<Order> list = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String sql = "SELECT * FROM orders ORDER BY created_at DESC LIMIT ? OFFSET ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, pageSize);
            ps.setInt(2, offset);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order(
                            rs.getInt("order_id"),
                            rs.getInt("user_id"),
                            rs.getString("recipient_name"),
                            rs.getString("recipient_phone"),
                            rs.getString("shipping_address"),
                            rs.getString("order_note"),
                            rs.getString("payment_method"),
                            rs.getDouble("total_amount"),
                            rs.getString("status"),
                            rs.getTimestamp("created_at")
                    );
                    list.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // =====================================================================
    // 3. READ: LẤY LỊCH SỬ ĐƠN HÀNG CỦA 1 KHÁCH HÀNG (TRANG CÁ NHÂN)
    // =====================================================================
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE user_id = ? ORDER BY created_at DESC";

        try ( Connection conn = DBConnection.getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            try ( ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order(
                            rs.getInt("order_id"),
                            rs.getInt("user_id"),
                            rs.getString("recipient_name"),
                            rs.getString("recipient_phone"),
                            rs.getString("shipping_address"),
                            rs.getString("order_note"),
                            rs.getString("payment_method"),
                            rs.getDouble("total_amount"),
                            rs.getString("status"),
                            rs.getTimestamp("created_at")
                    );
                    list.add(order);
                }
            }
        } catch (Exception e) {
            System.out.println("Lỗi getOrdersByUserId: " + e.getMessage());
        }
        return list;
    }

    // =====================================================================
    // 4. READ: XEM CHI TIẾT CÁC MÓN HÀNG TRONG 1 ĐƠN (JOIN BẢNG PRODUCTS)
    // =====================================================================
    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetail> list = new ArrayList<>();
        // Dùng lệnh JOIN để móc tên hoa và ảnh hoa từ bảng products sang
        String sql = "SELECT od.*, p.name, p.image_url "
                + "FROM order_details od "
                + "JOIN products p ON od.product_id = p.product_id "
                + "WHERE od.order_id = ?";

        try ( Connection conn = DBConnection.getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            try ( ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    OrderDetail detail = new OrderDetail(
                            rs.getInt("detail_id"),
                            rs.getInt("order_id"),
                            rs.getInt("product_id"),
                            rs.getInt("quantity"),
                            rs.getDouble("unit_price")
                    );

                    // Nhét tên và ảnh vào đối tượng Product đính kèm
                    Product p = new Product();
                    p.setName(rs.getString("name"));
                    p.setImageUrl(rs.getString("image_url"));
                    detail.setProduct(p);

                    list.add(detail);
                }
            }
        } catch (Exception e) {
            System.out.println("Lỗi getOrderDetailsByOrderId: " + e.getMessage());
        }
        return list;
    }

    // =====================================================================
    // 5. UPDATE: ADMIN CẬP NHẬT TRẠNG THÁI ĐƠN HÀNG
    // =====================================================================
    public boolean updateOrderStatus(int orderId, String newStatus) {
        String sql = "UPDATE orders SET status = ? WHERE order_id = ?";
        try ( Connection conn = DBConnection.getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, newStatus);
            ps.setInt(2, orderId);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("Lỗi cập nhật trạng thái đơn hàng: " + e.getMessage());
        }
        return false;
    }
    
    // =====================================================================
    // LẤY THÔNG TIN 1 ĐƠN HÀNG THEO ID (DÙNG CHO TRANG CHI TIẾT)
    // =====================================================================
    public Order getOrderById(int orderId) {
        String sql = "SELECT * FROM orders WHERE order_id = ?";
        try (Connection conn = DBConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
             
            ps.setInt(1, orderId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Order(
                        rs.getInt("order_id"),
                        rs.getInt("user_id"),
                        rs.getString("recipient_name"),
                        rs.getString("recipient_phone"),
                        rs.getString("shipping_address"),
                        rs.getString("order_note"),
                        rs.getString("payment_method"),
                        rs.getDouble("total_amount"),
                        rs.getString("status"),
                        rs.getTimestamp("created_at")
                    );
                }
            }
        } catch (Exception e) {
            System.out.println("Lỗi getOrderById: " + e.getMessage());
        }
        return null;
    }

    public List<Order> searchOrders(String query, String status) {
        List<Order> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM orders WHERE (recipient_name LIKE ? OR recipient_phone LIKE ? OR CAST(order_id AS CHAR) LIKE ?)");
        
        if (status != null && !status.isEmpty()) {
            sql.append(" AND status = ?");
        }
        
        sql.append(" ORDER BY created_at DESC");

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            String searchStr = "%" + query + "%";
            ps.setString(1, searchStr);
            ps.setString(2, searchStr);
            ps.setString(3, searchStr);
            if (status != null && !status.isEmpty()) {
                ps.setString(4, status);
            }
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order(
                            rs.getInt("order_id"),
                            rs.getInt("user_id"),
                            rs.getString("recipient_name"),
                            rs.getString("recipient_phone"),
                            rs.getString("shipping_address"),
                            rs.getString("order_note"),
                            rs.getString("payment_method"),
                            rs.getDouble("total_amount"),
                            rs.getString("status"),
                            rs.getTimestamp("created_at")
                    );
                    list.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public double getTotalRevenue() {
        String sql = "SELECT SUM(total_amount) FROM orders WHERE status = 'Hoàn Thành'";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getDouble(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public double getTodayRevenue() {
        String sql = "SELECT SUM(total_amount) FROM orders WHERE status = 'Hoàn Thành' AND DATE(created_at) = CURDATE()";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getDouble(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getTodayOrdersCount() {
        String sql = "SELECT COUNT(*) FROM orders WHERE DATE(created_at) = CURDATE()";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Order> getRecentOrders(int limit) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders ORDER BY created_at DESC LIMIT ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order(
                            rs.getInt("order_id"),
                            rs.getInt("user_id"),
                            rs.getString("recipient_name"),
                            rs.getString("recipient_phone"),
                            rs.getString("shipping_address"),
                            rs.getString("order_note"),
                            rs.getString("payment_method"),
                            rs.getDouble("total_amount"),
                            rs.getString("status"),
                            rs.getTimestamp("created_at")
                    );
                    list.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
