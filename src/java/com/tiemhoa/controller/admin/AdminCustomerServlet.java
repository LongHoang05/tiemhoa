/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.UserDAO;
import com.tiemhoa.model.User;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AdminCustomerServlet", urlPatterns = {"/admin/customer-management"})
public class AdminCustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();

        // 1. Logic phân trang
        int totalCustomers = userDAO.getTotalCustomers();
        com.tiemhoa.util.PaginationHelper pagination = new com.tiemhoa.util.PaginationHelper(request, totalCustomers, 10);
        
        // 2. Lấy danh sách khách hàng theo trang
        List<User> customerList = userDAO.getCustomersByPage(pagination.getCurrentPage(), pagination.getPageSize());

        // 3. Đẩy dữ liệu lên giao diện
        request.setAttribute("customerList", customerList);
        request.setAttribute("pageTitle", "Quản lý Khách hàng - Floral Haven");
        request.setAttribute("contentPage", "/admin/customer/list.jsp");

        // 4. Thiết lập thuộc tính phân trang
        pagination.setPaginationAttributes(request, request.getContextPath() + "/admin/customer-management");

        // Forward sang base.jsp để giữ layout chung
        request.getRequestDispatcher("/admin/base.jsp").forward(request, response);
    }
}
