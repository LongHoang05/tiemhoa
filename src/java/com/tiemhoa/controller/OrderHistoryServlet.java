package com.tiemhoa.controller;

import com.tiemhoa.dao.OrderDAO;
import com.tiemhoa.model.Order;
import com.tiemhoa.model.User;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "OrderHistoryServlet", urlPatterns = {"/order-history"})
public class OrderHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        OrderDAO orderDAO = new OrderDAO();
        List<Order> orderHistory = orderDAO.getOrdersByUserId(user.getUserId());

        request.setAttribute("orderHistory", orderHistory);
        request.setAttribute("view", "/pages/order-history.jsp");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}