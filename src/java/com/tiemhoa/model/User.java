/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tiemhoa.model;

/**
 *
 * @author ASUS
 */
public class User {
    private int userId;
    private String username;
    private String loginName;
    private String password;
    private String email;
    private String phone;
    private String address;
    private int roleId;
    private int status;

    public User() {}

    public User(int userId, String username, String loginName, String password, 
                String email, String phone, String address, int roleId, int status) {
        this.userId = userId;
        this.username = username;
        this.loginName = loginName;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.roleId = roleId;
        this.status = status;
    }

    // Constructor cũ (8 tham số) - Mặc định status = 1
    public User(int userId, String username, String loginName, String password, 
                String email, String phone, String address, int roleId) {
        this(userId, username, loginName, password, email, phone, address, roleId, 1);
    }

    // Getters và Setters cho tất cả các trường...
    // (Lưu ý: Không nên hiển thị mật khẩu ở các tầng View để đảm bảo bảo mật)
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getLoginName() { return loginName; }
    public void setLoginName(String loginName) { this.loginName = loginName; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public int getRoleId() { return roleId; }
    public void setRoleId(int roleId) { this.roleId = roleId; }

    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }
}
