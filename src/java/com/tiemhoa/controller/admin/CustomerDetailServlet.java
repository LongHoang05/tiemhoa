package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.OrderDAO;
import com.tiemhoa.dao.UserDAO;
import com.tiemhoa.model.Order;
import com.tiemhoa.model.User;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CustomerDetailServlet", urlPatterns = {"/admin/customer-detail"})
public class CustomerDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idRaw = request.getParameter("id");
        try {
            int userId = Integer.parseInt(idRaw);
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserById(userId);

            if (user == null || user.getRoleId() != 1) {
                response.sendRedirect(request.getContextPath() + "/admin/customer-management");
                return;
            }

            OrderDAO orderDAO = new OrderDAO();
            List<Order> orderList = orderDAO.getOrdersByUserId(userId);

            request.setAttribute("customer", user);
            request.setAttribute("orderList", orderList);
            request.setAttribute("pageTitle", "Chi tiết khách hàng - " + user.getUsername());
            request.setAttribute("contentPage", "/admin/customer/detail.jsp");

            request.getRequestDispatcher("/admin/base.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/admin/customer-management");
        }
    }
}
