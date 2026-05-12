/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller;

import com.tiemhoa.dao.UserDAO;
import com.tiemhoa.model.User;
import com.tiemhoa.util.Validation;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("view", "/pages/register.jsp");
        request.setAttribute("pageTitle", "Đăng ký - Floral Haven");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String username = request.getParameter("username"); // Họ tên
        String loginName = request.getParameter("loginName"); // Tên đăng nhập
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // --- VALIDATION PHÍA SERVER ---
        if (Validation.isEmpty(username)) {
            request.setAttribute("error", "Họ tên không được để trống!");
            request.setAttribute("invalidField", "username");
            sendBackData(request, username, loginName, email, phone, address);
            request.setAttribute("view", "/pages/register.jsp");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }
        if (Validation.isEmpty(loginName)) {
            request.setAttribute("error", "Tên đăng nhập không được để trống!");
            request.setAttribute("invalidField", "loginName");
            sendBackData(request, username, loginName, email, phone, address);
            request.setAttribute("view", "/pages/register.jsp");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }
        if (!Validation.isMinLength(password, 6)) {
            request.setAttribute("error", "Mật khẩu phải có ít nhất 6 ký tự!");
            request.setAttribute("invalidField", "password");
            sendBackData(request, username, loginName, email, phone, address);
            request.setAttribute("view", "/pages/register.jsp");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }
        if (!Validation.isValidEmail(email)) {
            request.setAttribute("error", "Email không đúng định dạng!");
            request.setAttribute("invalidField", "email");
            sendBackData(request, username, loginName, email, phone, address);
            request.setAttribute("view", "/pages/register.jsp");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }
        if (!Validation.isValidPhone(phone)) {
            request.setAttribute("error", "Số điện thoại không hợp lệ (phải đủ 10 số)!");
            request.setAttribute("invalidField", "phone");
            sendBackData(request, username, loginName, email, phone, address);
            request.setAttribute("view", "/pages/register.jsp");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        UserDAO userDAO = new UserDAO();
        
        // Kiểm tra xem tên đăng nhập có bị trùng không
        if (userDAO.checkLoginNameExist(loginName)) {
            request.setAttribute("error", "Tên đăng nhập này đã được sử dụng!");
            request.setAttribute("invalidField", "loginName");
            sendBackData(request, username, loginName, email, phone, address);
            request.setAttribute("view", "/pages/register.jsp");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        // Tạo user mới (mặc định roleId = 1 trong DAO)
        User newUser = new User(0, username, loginName, password, email, phone, address, 1);
        
        if (userDAO.registerUser(newUser)) {
            request.setAttribute("message", "Đăng ký thành công! Vui lòng đăng nhập.");
            request.setAttribute("view", "/pages/login.jsp");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Lỗi hệ thống, vui lòng thử lại sau!");
            request.setAttribute("view", "/pages/register.jsp");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
    private void sendBackData(HttpServletRequest request, String username, String loginName, String email, String phone, String address) {
        request.setAttribute("oldUsername", username);
        request.setAttribute("oldLoginName", loginName);
        request.setAttribute("oldEmail", email);
        request.setAttribute("oldPhone", phone);
        request.setAttribute("oldAddress", address);
    }
}
