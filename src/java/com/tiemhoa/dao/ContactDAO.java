/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tiemhoa.dao;


import com.tiemhoa.model.Contact;
import com.tiemhoa.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author ASUS
 */

public class ContactDAO {

    // Hàm thêm mới một liên hệ vào database
    public boolean insertContact(Contact contact) {
        // Dùng NOW() để MySQL tự động lấy giờ hệ thống hiện tại cho cột created_at
        String sql = "INSERT INTO contacts (sender_name, sender_email, subject, message, created_at) VALUES (?, ?, ?, ?, NOW())";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            // Gán dữ liệu vào các dấu chấm hỏi (?)
            ps.setString(1, contact.getSenderName());
            ps.setString(2, contact.getSenderEmail());
            ps.setString(3, contact.getSubject());
            ps.setString(4, contact.getMessage());
            
            // Thực thi lệnh và kiểm tra xem có dòng nào được thêm thành công không
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Lấy tất cả danh sách liên hệ (dành cho Admin)
    public java.util.List<Contact> getAllContacts() {
        java.util.List<Contact> list = new java.util.ArrayList<>();
        String sql = "SELECT * FROM contacts ORDER BY created_at DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             java.sql.ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Contact c = new Contact();
                c.setContactId(rs.getInt("contact_id"));
                c.setSenderName(rs.getString("sender_name"));
                c.setSenderEmail(rs.getString("sender_email"));
                c.setSubject(rs.getString("subject"));
                c.setMessage(rs.getString("message"));
                c.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Xóa một liên hệ
    public boolean deleteContact(int contactId) {
        String sql = "DELETE FROM contacts WHERE contact_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, contactId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int getTotalContacts() {
        String sql = "SELECT COUNT(*) FROM contacts";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             java.sql.ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public java.util.List<Contact> getRecentContacts(int limit) {
        java.util.List<Contact> list = new java.util.ArrayList<>();
        String sql = "SELECT * FROM contacts ORDER BY created_at DESC LIMIT ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, limit);
            try (java.sql.ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Contact c = new Contact();
                    c.setContactId(rs.getInt("contact_id"));
                    c.setSenderName(rs.getString("sender_name"));
                    c.setSenderEmail(rs.getString("sender_email"));
                    c.setSubject(rs.getString("subject"));
                    c.setMessage(rs.getString("message"));
                    c.setCreatedAt(rs.getTimestamp("created_at"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}