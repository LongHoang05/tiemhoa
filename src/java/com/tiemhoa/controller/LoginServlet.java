/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller;

import com.tiemhoa.dao.UserDAO;
import com.tiemhoa.model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Chuyển error/message từ session sang request (nếu có)
        if (session.getAttribute("error") != null) {
            request.setAttribute("error", session.getAttribute("error"));
            session.removeAttribute("error");
        }
        if (session.getAttribute("message") != null) {
            request.setAttribute("message", session.getAttribute("message"));
            session.removeAttribute("message");
        }

        request.setAttribute("view", "/pages/login.jsp");
        request.setAttribute("pageTitle", "Đăng nhập - Floral Haven");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String loginName = request.getParameter("loginName");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.login(loginName, password);

        if (user != null) {
            // Đăng nhập thành công, lưu user vào session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // KIỂM TRA XEM CÓ TRANG NÀO ĐANG ĐỢI KHÔNG
            String redirectUrl = (String) session.getAttribute("redirectAfterLogin");
            
            if (redirectUrl != null) {
                // Xóa để lần sau login không bị dính lại
                session.removeAttribute("redirectAfterLogin");
                // Ưu tiên: Trở về trang đang làm dở (ví dụ: /checkout)
                response.sendRedirect(request.getContextPath() + redirectUrl);
            } else {
                // Luồng bình thường: Kiểm tra role
                if (user.getRoleId() == 0) {
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                } else {
                    response.sendRedirect(request.getContextPath() + "/home");
                }
            }
        } else {
            // Đăng nhập thất bại
            request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
            request.setAttribute("view", "/pages/login.jsp");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
