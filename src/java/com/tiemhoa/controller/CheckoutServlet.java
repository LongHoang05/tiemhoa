/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller;

import com.tiemhoa.dao.OrderDAO;
import com.tiemhoa.model.Cart;
import com.tiemhoa.model.User;
import jakarta.servlet.http.HttpSession;
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

@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");

        // 1. KIỂM TRA ĐĂNG NHẬP TRƯỚC
        if (currentUser == null) {
            // Lưu lại đích đến để lát đăng nhập xong quay lại đây
            session.setAttribute("redirectAfterLogin", "/checkout");
            response.sendRedirect(request.getContextPath() + "/login");
            return; // Dừng luôn, không chạy xuống dưới
        }

        // 2. KIỂM TRA GIỎ HÀNG
        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        // 3. ĐÃ ĐĂNG NHẬP VÀ CÓ HÀNG -> CHO VÀO TRANG THANH TOÁN
        request.setAttribute("view", "/pages/checkout.jsp");
        request.setAttribute("pageTitle", "Thanh toán - Floral Haven");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // Chỉnh tiếng Việt cho form
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        // Lấy thông tin từ Form Checkout
        String recipientName = request.getParameter("fullName");
        String recipientPhone = request.getParameter("phone");
        String address = request.getParameter("address");
        String note = request.getParameter("note"); 
        String paymentMethod = request.getParameter("paymentMethod"); 

        User currentUser = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");

        // Chốt chặn an toàn lần 2 khi submit form
        if (currentUser == null) {
            session.setAttribute("redirectAfterLogin", "/checkout");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        if (cart != null && !cart.getItems().isEmpty()) {
            
            OrderDAO orderDAO = new OrderDAO();
            boolean isSuccess = orderDAO.createOrder(
                cart, 
                currentUser.getUserId(), 
                recipientName, 
                recipientPhone, 
                address, 
                note, 
                paymentMethod
            );

            if (isSuccess) {
                // Thành công: Xóa giỏ hàng và báo tin vui
                session.removeAttribute("cart"); 
                
                request.setAttribute("view", "/pages/checkout-success.jsp");
                request.setAttribute("pageTitle", "Đặt hàng thành công - Floral Haven");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            } else {
                // Thất bại: Giữ lại giỏ hàng và báo lỗi
                request.setAttribute("message", "Có lỗi xảy ra khi lưu đơn hàng, vui lòng thử lại!");
                response.sendRedirect(request.getContextPath() + "/cart");
            }
            
        } else {
            System.out.println("Lỗi: Cart=" + cart + ", User=" + currentUser); 
            response.sendRedirect(request.getContextPath() + "/cart");
        }
    }
}
