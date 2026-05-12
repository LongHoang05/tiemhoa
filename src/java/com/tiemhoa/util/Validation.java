/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tiemhoa.util;

import java.util.regex.Pattern;

/**
 * Lớp tiện ích dùng để kiểm tra dữ liệu đầu vào (Server-side Validation)
 * @author ASUS
 */
public class Validation {

    // 1. Kiểm tra chuỗi trống hoặc chỉ chứa khoảng trắng
    public static boolean isEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }

    // 2. Kiểm tra định dạng Email
    public static boolean isValidEmail(String email) {
        if (isEmpty(email)) return false;
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        return Pattern.compile(emailRegex).matcher(email).matches();
    }

    // 3. Kiểm tra số điện thoại (Định dạng Việt Nam: 10 số, bắt đầu bằng 0 hoặc +84)
    public static boolean isValidPhone(String phone) {
        if (isEmpty(phone)) return false;
        String phoneRegex = "^(0|\\+84)(\\d{9})$";
        return Pattern.compile(phoneRegex).matcher(phone).matches();
    }

    // 4. Kiểm tra số dương (Dùng cho giá tiền, số lượng kho)
    public static boolean isPositive(double value) {
        return value > 0;
    }
    
    public static boolean isPositive(int value) {
        return value > 0;
    }

    // 5. Kiểm tra số không âm (Dùng cho số lượng có thể bằng 0)
    public static boolean isNonNegative(double value) {
        return value >= 0;
    }

    // 6. Kiểm tra độ dài tối thiểu của chuỗi (Dùng cho mật khẩu, tên đăng nhập)
    public static boolean isMinLength(String str, int min) {
        if (str == null) return false;
        return str.trim().length() >= min;
    }

    // 7. Kiểm tra xem một chuỗi có phải là số hay không
    public static boolean isNumeric(String str) {
        if (isEmpty(str)) return false;
        try {
            Double.parseDouble(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
