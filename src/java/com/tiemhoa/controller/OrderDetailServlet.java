package com.tiemhoa.controller;

import com.tiemhoa.dao.OrderDAO;
import com.tiemhoa.model.Order;
import com.tiemhoa.model.OrderDetail;
import com.tiemhoa.model.User;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "OrderDetailServlet", urlPatterns = {"/order-detail"})
public class OrderDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/profile");
            return;
        }

        int orderId = Integer.parseInt(idParam);
        OrderDAO orderDAO = new OrderDAO();
        Order order = orderDAO.getOrderById(orderId);

        // Security check: Ensure order belongs to logged-in user
        if (order == null || order.getUserId() != user.getUserId()) {
            response.sendRedirect(request.getContextPath() + "/profile");
            return;
        }

        List<OrderDetail> detailList = orderDAO.getOrderDetailsByOrderId(orderId);

        request.setAttribute("order", order);
        request.setAttribute("detailList", detailList);
        request.setAttribute("view", "/pages/order-detail.jsp");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
