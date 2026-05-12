/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tiemhoa.dao;

import com.tiemhoa.model.Product;
import com.tiemhoa.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */

public class ProductDAO {

    // 1. READ: Lấy danh sách tất cả sản phẩm đang bán (is_active = 1)
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE is_active = 1 ORDER BY product_id DESC";

        try ( Connection conn = DBConnection.getConnection();  PreparedStatement ps = conn.prepareStatement(sql);  ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image_url"),
                        rs.getString("description"),
                        rs.getInt("stock_quantity"),
                        rs.getInt("category_id"),
                        rs.getInt("is_active")
                );
                p.setStoryText(rs.getString("story_text"));
                p.setStoryImage(rs.getString("story_image"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println("Lỗi Lấy danh sách hoa: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    // 2. CREATE: Thêm hoa mới vào CSDL
    public boolean addProduct(Product p) {
        String sql = "INSERT INTO products (name, price, image_url, description, stock_quantity, category_id, is_active) VALUES (?, ?, ?, ?, ?, ?, 1)";
        try ( Connection conn = DBConnection.getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setDouble(2, p.getPrice());
            ps.setString(3, p.getImageUrl());
            ps.setString(4, p.getDescription());
            ps.setInt(5, p.getStockQuantity());
            ps.setInt(6, p.getCategoryId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Lỗi Thêm hoa mới: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    // 3. UPDATE: Cập nhật thông tin bó hoa
    public boolean updateProduct(Product p) {
        String sql = "UPDATE products SET name=?, price=?, image_url=?, description=?, stock_quantity=?, category_id=? WHERE product_id=?";
        try ( Connection conn = DBConnection.getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setDouble(2, p.getPrice());
            ps.setString(3, p.getImageUrl());
            ps.setString(4, p.getDescription());
            ps.setInt(5, p.getStockQuantity());
            ps.setInt(6, p.getCategoryId());
            ps.setInt(7, p.getProductId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Lỗi Cập nhật hoa: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    // 4. DELETE: Xóa mềm (Cập nhật trạng thái is_active = 0)
    public boolean deleteProduct(int productId) {
        String sql = "UPDATE products SET is_active = 0 WHERE product_id = ?";
        try ( Connection conn = DBConnection.getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Lỗi Xóa hoa: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    // Lấy thông tin 1 sản phẩm theo ID để đưa lên trang Chi tiết (đã thêm Story)
    public Product getProductById(int productId) {
        String sql = "SELECT * FROM products WHERE product_id = ?";
        try ( Connection conn = DBConnection.getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Product p = new Product(
                            rs.getInt("product_id"),
                            rs.getString("name"),
                            rs.getDouble("price"),
                            rs.getString("image_url"),
                            rs.getString("description"),
                            rs.getInt("stock_quantity"),
                            rs.getInt("category_id"),
                            rs.getInt("is_active")
                    );
                    p.setStoryText(rs.getString("story_text"));
                    p.setStoryImage(rs.getString("story_image"));
                    return p;
                }
            }
        } catch (Exception e) {
            System.out.println("Lỗi lấy sản phẩm theo ID: " + e.getMessage());
        }
        return null;
    }

    public List<Product> searchProducts(String query, int categoryId, int limit) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE is_active = 1 "
                + "AND name LIKE ? "
                + (categoryId > 0 ? "AND category_id = ? " : "")
                + "ORDER BY product_id DESC limit ?";

        try ( Connection conn = DBConnection.getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + query + "%");
            if (categoryId > 0) {
                ps.setInt(2, categoryId);
                ps.setInt(3, limit);
            } else {
                ps.setInt(2, limit);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image_url"),
                        rs.getString("description"),
                        rs.getInt("stock_quantity"),
                        rs.getInt("category_id"),
                        rs.getInt("is_active")
                );
                p.setStoryText(rs.getString("story_text"));
                p.setStoryImage(rs.getString("story_image"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalProducts() {
        String sql = "SELECT COUNT(*) FROM products WHERE is_active = 1";
        try ( Connection conn = DBConnection.getConnection();  PreparedStatement ps = conn.prepareStatement(sql);  ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Lấy danh sách sản phẩm theo số trang
    public List<Product> getProductsByPage(int page, int pageSize) {
        List<Product> list = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String sql = "SELECT * FROM products WHERE is_active = 1 ORDER BY product_id DESC LIMIT ? OFFSET ?";

        try ( Connection conn = DBConnection.getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, pageSize);
            ps.setInt(2, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("product_id"), rs.getString("name"), rs.getDouble("price"),
                        rs.getString("image_url"), rs.getString("description"), rs.getInt("stock_quantity"),
                        rs.getInt("category_id"), rs.getInt("is_active")
                );
                p.setStoryText(rs.getString("story_text"));
                p.setStoryImage(rs.getString("story_image"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Lấy danh sách Hàng Mới Về
    public List<Product> getTopNewProducts(int limit) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE is_active = 1 ORDER BY product_id DESC LIMIT ?";

        try ( Connection conn = DBConnection.getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("product_id"), rs.getString("name"), rs.getDouble("price"),
                        rs.getString("image_url"), rs.getString("description"), rs.getInt("stock_quantity"),
                        rs.getInt("category_id"), rs.getInt("is_active")
                );
                p.setStoryText(rs.getString("story_text"));
                p.setStoryImage(rs.getString("story_image"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println("Lỗi getTopNewProducts: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    // Lấy danh sách Hoa Bán Chạy
    public List<Product> getBestSellerProducts(int limit) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE is_active = 1 ORDER BY RAND() LIMIT ?";

        try ( Connection conn = DBConnection.getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("product_id"), rs.getString("name"), rs.getDouble("price"),
                        rs.getString("image_url"), rs.getString("description"), rs.getInt("stock_quantity"),
                        rs.getInt("category_id"), rs.getInt("is_active")
                );
                p.setStoryText(rs.getString("story_text"));
                p.setStoryImage(rs.getString("story_image"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println("Lỗi getBestSellerProducts: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    // Lấy danh sách sản phẩm lọc theo Danh mục
    public List<Product> getProductsByCategory(int categoryId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE is_active = 1 AND category_id = ? ORDER BY product_id DESC";

        try ( Connection conn = DBConnection.getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("product_id"), rs.getString("name"), rs.getDouble("price"),
                        rs.getString("image_url"), rs.getString("description"), rs.getInt("stock_quantity"),
                        rs.getInt("category_id"), rs.getInt("is_active")
                );
                p.setStoryText(rs.getString("story_text"));
                p.setStoryImage(rs.getString("story_image"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println("Lỗi getProductsByCategory: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    // Đếm tổng số sản phẩm trong 1 Danh mục cụ thể 
    public int getTotalProductsByCategory(int categoryId) {
        String sql = "SELECT COUNT(*) FROM products WHERE is_active = 1 AND category_id = ?";
        try ( Connection conn = DBConnection.getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, categoryId);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Lấy sản phẩm THEO DANH MỤC + PHÂN TRANG 
    public List<Product> getProductsByCategoryAndPage(int categoryId, int page, int pageSize) {
        List<Product> list = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String sql = "SELECT * FROM products WHERE is_active = 1 AND category_id = ? ORDER BY product_id DESC LIMIT ? OFFSET ?";

        try ( Connection conn = DBConnection.getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, categoryId);
            ps.setInt(2, pageSize);
            ps.setInt(3, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("product_id"), rs.getString("name"), rs.getDouble("price"),
                        rs.getString("image_url"), rs.getString("description"), rs.getInt("stock_quantity"),
                        rs.getInt("category_id"), rs.getInt("is_active")
                );
                p.setStoryText(rs.getString("story_text"));
                p.setStoryImage(rs.getString("story_image"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalFilteredProducts(int categoryId, String priceRange) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM products WHERE is_active = 1");
        if (categoryId > 0) sql.append(" AND category_id = ").append(categoryId);
        
        if (priceRange != null) {
            if (priceRange.equals("0-500")) sql.append(" AND price < 500000");
            else if (priceRange.equals("500-1500")) sql.append(" AND price BETWEEN 500000 AND 1500000");
            else if (priceRange.equals("1500-up")) sql.append(" AND price > 1500000");
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString());
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Product> getFilteredProducts(int categoryId, String priceRange, String sort, int page, int pageSize) {
        List<Product> list = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        StringBuilder sql = new StringBuilder("SELECT * FROM products WHERE is_active = 1");
        
        if (categoryId > 0) sql.append(" AND category_id = ").append(categoryId);
        
        if (priceRange != null) {
            if (priceRange.equals("0-500")) sql.append(" AND price < 500000");
            else if (priceRange.equals("500-1500")) sql.append(" AND price BETWEEN 500000 AND 1500000");
            else if (priceRange.equals("1500-up")) sql.append(" AND price > 1500000");
        }

        // Sắp xếp
        if ("price_asc".equals(sort)) sql.append(" ORDER BY price ASC");
        else if ("price_desc".equals(sort)) sql.append(" ORDER BY price DESC");
        else sql.append(" ORDER BY product_id DESC"); // latest

        sql.append(" LIMIT ? OFFSET ?");

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            ps.setInt(1, pageSize);
            ps.setInt(2, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("product_id"), rs.getString("name"), rs.getDouble("price"),
                        rs.getString("image_url"), rs.getString("description"), rs.getInt("stock_quantity"),
                        rs.getInt("category_id"), rs.getInt("is_active")
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 5. Lấy danh sách sản phẩm tương tự
    public List<Product> getSimilarProducts(int categoryId, int currentProductId, int limit) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE is_active = 1 AND category_id = ? AND product_id != ? ORDER BY RAND() LIMIT ?";
        
        try (Connection conn = DBConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, categoryId);
            ps.setInt(2, currentProductId);
            ps.setInt(3, limit);
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product(
                            rs.getInt("product_id"), 
                            rs.getString("name"), 
                            rs.getDouble("price"),
                            rs.getString("image_url"), 
                            rs.getString("description"), 
                            rs.getInt("stock_quantity"),
                            rs.getInt("category_id"), 
                            rs.getInt("is_active")
                    );
                    p.setStoryText(rs.getString("story_text"));
                    p.setStoryImage(rs.getString("story_image"));
                    list.add(p);
                }
            }
        } catch (Exception e) {
            System.out.println("Lỗi getSimilarProducts: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getLowStockProducts(int limit) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE is_active = 1 AND stock_quantity < 10 ORDER BY stock_quantity ASC LIMIT ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product(
                            rs.getInt("product_id"),
                            rs.getString("name"),
                            rs.getDouble("price"),
                            rs.getString("image_url"),
                            rs.getString("description"),
                            rs.getInt("stock_quantity"),
                            rs.getInt("category_id"),
                            rs.getInt("is_active")
                    );
                    list.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getTopSellingProducts(int limit) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.*, SUM(od.quantity) as sales_count " +
                     "FROM products p " +
                     "JOIN order_details od ON p.product_id = od.product_id " +
                     "WHERE p.is_active = 1 " +
                     "GROUP BY p.product_id " +
                     "ORDER BY sales_count DESC " +
                     "LIMIT ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product(
                            rs.getInt("product_id"),
                            rs.getString("name"),
                            rs.getDouble("price"),
                            rs.getString("image_url"),
                            rs.getString("description"),
                            rs.getInt("stock_quantity"),
                            rs.getInt("category_id"),
                            rs.getInt("is_active")
                    );
                    list.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
