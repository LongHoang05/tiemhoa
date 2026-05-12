/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.OrderDAO;
import com.tiemhoa.model.Order;
import com.tiemhoa.model.OrderDetail;
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
@WebServlet(name = "AdminOrderDetailServlet", urlPatterns = {"/admin/order-detail"})
public class AdminOrderDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null) {
            int orderId = Integer.parseInt(idParam);
            
            OrderDAO orderDAO = new OrderDAO();
            Order order = orderDAO.getOrderById(orderId);
            List<OrderDetail> detailList = orderDAO.getOrderDetailsByOrderId(orderId);
            
            if (order != null) {
                request.setAttribute("order", order);
                request.setAttribute("detailList", detailList);
                
                // ĐÃ SỬA THÀNH contentPage ĐỂ KHỚP VỚI base.jsp
                request.setAttribute("contentPage", "/admin/order/detail.jsp");
                request.setAttribute("pageTitle", "Chi tiết đơn hàng #" + orderId);
                
                request.getRequestDispatcher("/admin/base.jsp").forward(request, response);
                return;
            }
        }
        response.sendRedirect(request.getContextPath() + "/admin/order-management");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
