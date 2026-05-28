package com.tiemhoa.util;

public class SecurityUtil {
    
    // Hàm mã hóa mật khẩu sử dụng BCrypt
    public static String hashPassword(String password) {
        if (password == null) {
            return null;
        }
        try {
            return BCrypt.hashpw(password, BCrypt.gensalt(12));
        } catch (Exception ex) {
            throw new RuntimeException("Lỗi mã hóa mật khẩu BCrypt", ex);
        }
    }

    // Hàm kiểm tra mật khẩu
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        if (plainPassword == null || hashedPassword == null) {
            return false;
        }
        // Hỗ trợ mật khẩu chưa mã hóa hoặc băm bằng cách khác nếu đang trùng
        if (plainPassword.equals(hashedPassword)) {
            return true;
        }
        try {
            return BCrypt.checkpw(plainPassword, hashedPassword);
        } catch (Exception e) {
            return false;
        }
    }
}
