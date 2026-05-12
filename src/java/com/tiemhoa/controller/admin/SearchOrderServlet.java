package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.OrderDAO;
import com.tiemhoa.model.Order;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchOrderServlet", urlPatterns = {"/admin/search-order"})
public class SearchOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String query = request.getParameter("query");
        String status = request.getParameter("filter");
        OrderDAO orderDAO = new OrderDAO();
        List<Order> list = orderDAO.searchOrders(query, status);
        
        request.setAttribute("orderList", list);
        request.getRequestDispatcher("/admin/order/search-results.jsp").forward(request, response);
    }
}
