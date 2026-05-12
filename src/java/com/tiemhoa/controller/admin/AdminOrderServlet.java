/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.OrderDAO;
import com.tiemhoa.model.Order;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AdminOrderServlet", urlPatterns = {"/admin/order-management"})
public class AdminOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO orderDAO = new OrderDAO();

        // 1. Logic phân trang
        int totalOrders = orderDAO.getTotalOrders();
        com.tiemhoa.util.PaginationHelper pagination = new com.tiemhoa.util.PaginationHelper(request, totalOrders, 10);
        
        // 2. Lấy danh sách đơn hàng theo trang
        List<Order> orderList = orderDAO.getOrdersByPage(pagination.getCurrentPage(), pagination.getPageSize());
        
        request.setAttribute("orderList", orderList);
        
        // 3. Thiết lập thuộc tính phân trang
        pagination.setPaginationAttributes(request, request.getContextPath() + "/admin/order-management");
        
        // ĐÃ SỬA THÀNH contentPage ĐỂ KHỚP VỚI base.jsp
        request.setAttribute("contentPage", "/admin/order/list.jsp");
        request.setAttribute("pageTitle", "Quản lý đơn hàng - Floral Haven");
        
        request.getRequestDispatcher("/admin/base.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        
        if ("updateStatus".equals(action)) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String newStatus = request.getParameter("status");
            
            OrderDAO orderDAO = new OrderDAO();
            boolean isUpdated = orderDAO.updateOrderStatus(orderId, newStatus);
            
            if(isUpdated) {
                request.getSession().setAttribute("toastMsg", "Cập nhật đơn #" + orderId + " thành công!");
            }
        }
        
        // ĐÃ SỬA ĐƯỜNG DẪN REDIRECT Ở ĐÂY
        response.sendRedirect(request.getContextPath() + "/admin/order-management");
    }
}
