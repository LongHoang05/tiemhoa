/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.CategoryDAO;
import com.tiemhoa.model.Category;
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
@WebServlet(name = "AddCategoryServlet", urlPatterns = {"/admin/add-category"})
public class AddCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("pageTitle", "Thêm danh mục mới - Floral Haven");
        request.setAttribute("contentPage", "/admin/category/add.jsp"); 
        
        request.getRequestDispatcher("/admin/base.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // 1. Lấy dữ liệu từ ô input
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        
        // 2. Kiểm tra dữ liệu rỗng (Validate cơ bản)
        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("error", "Tên danh mục không được để trống!");
            doGet(request, response);
            return;
        }

        // 3. Đóng gói dữ liệu vào Model
        Category category = new Category();
        category.setName(name);
        category.setDescription(description);

        // 4. Gọi DAO để lưu vào CSDL
        CategoryDAO categoryDAO = new CategoryDAO();
        boolean isSuccess = categoryDAO.addCategory(category);

        if (isSuccess) {
            // Nếu thành công: Báo toast message và chuyển hướng về trang danh sách
            request.getSession().setAttribute("toastMsg", "Đã thêm danh mục: " + name);
            response.sendRedirect(request.getContextPath() + "/admin/category-management");
        } else {
            // Nếu thất bại (Lỗi DB): Báo lỗi và giữ nguyên trang hiện tại
            request.setAttribute("error", "Đã xảy ra lỗi hệ thống, không thể thêm danh mục!");
            doGet(request, response);
        }
    }
}
