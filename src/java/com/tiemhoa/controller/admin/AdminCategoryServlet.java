/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.CategoryDAO;
import com.tiemhoa.model.Category;
import com.tiemhoa.util.PaginationHelper;
import jakarta.servlet.ServletException;
import java.util.List;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AdminCategoryServlet", urlPatterns = {"/admin/category-management"})
public class AdminCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        CategoryDAO categoryDAO = new CategoryDAO();
        int totalCategories = categoryDAO.getTotalCategories();
        
        // Sử dụng Helper bạn vừa làm
        PaginationHelper pagination = new PaginationHelper(request, totalCategories, 5);
        List<Category> categoryList = categoryDAO.getCategoriesByPage(pagination.getCurrentPage(), pagination.getPageSize());

        request.setAttribute("categoryList", categoryList);
        request.setAttribute("pageTitle", "Quản lý danh mục - Floral Haven");
        request.setAttribute("contentPage", "/admin/category/list.jsp");

        pagination.setPaginationAttributes(request, request.getContextPath() + "/admin/category-management");

        request.getRequestDispatcher("/admin/base.jsp").forward(request, response);
    }
}
