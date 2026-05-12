package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.CategoryDAO;
import com.tiemhoa.dao.ContactDAO;
import com.tiemhoa.dao.OrderDAO;
import com.tiemhoa.dao.ProductDAO;
import com.tiemhoa.dao.UserDAO;
import com.tiemhoa.model.Order;
import com.tiemhoa.model.Product;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DashboardServlet", urlPatterns = {"/admin/dashboard"})
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        OrderDAO orderDAO = new OrderDAO();
        ProductDAO productDAO = new ProductDAO();
        UserDAO userDAO = new UserDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        ContactDAO contactDAO = new ContactDAO();

        // 1. Fetch Summary Stats
        double totalRevenue = orderDAO.getTotalRevenue();
        int totalOrders = orderDAO.getTotalOrders();
        int totalProducts = productDAO.getTotalProducts();
        int totalCustomers = userDAO.getTotalUsers();
        int totalCategories = categoryDAO.getTotalCategories();
        int totalContacts = contactDAO.getTotalContacts();

        // 2. Fetch Recent Data
        List<Order> recentOrders = orderDAO.getRecentOrders(5);
        List<Product> topSellingProducts = productDAO.getTopSellingProducts(5);
        List<com.tiemhoa.model.Contact> recentContacts = contactDAO.getRecentContacts(5);

        // 3. Set Attributes
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalCustomers", totalCustomers);
        request.setAttribute("totalCategories", totalCategories);
        request.setAttribute("totalContacts", totalContacts);
        request.setAttribute("recentOrders", recentOrders);
        request.setAttribute("topSellingProducts", topSellingProducts);
        request.setAttribute("recentContacts", recentContacts);

        request.setAttribute("pageTitle", "Tổng quan - Floral Haven");
        request.setAttribute("contentPage", "/admin/dashboard/dashboard-content.jsp");
        request.getRequestDispatcher("/admin/base.jsp").forward(request, response);
    }
}
