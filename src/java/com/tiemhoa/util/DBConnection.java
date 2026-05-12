/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tiemhoa.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Ngọc Chi
 */
public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/tiemhoa";
    private static final String USER = "root"; 
    private static final String PASSWORD = ""; 

    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Load driver MySQL phiên bản mới
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Thực hiện mở kết nối
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.out.println("Lỗi: Chưa add thư viện MySQL JDBC Driver vào dự án!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Lỗi: Sai thông tin DB hoặc chưa bật MySQL/XAMPP!");
            e.printStackTrace();
        }
        return conn;
    }
}
