/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.CategoryDAO;
import com.tiemhoa.model.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "EditCategoryServlet", urlPatterns = {"/admin/edit-category"})
public class EditCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            CategoryDAO categoryDAO = new CategoryDAO();
            Category category = categoryDAO.getCategoryById(id);

            // Nếu tìm thấy danh mục, đẩy qua trang edit.jsp
            if (category != null) {
                request.setAttribute("category", category);
                request.setAttribute("pageTitle", "Sửa danh mục - Floral Haven");
                request.setAttribute("contentPage", "/admin/category/edit.jsp");
                request.getRequestDispatcher("/admin/base.jsp").forward(request, response);
            } else {
                // Nếu ID bậy bạ, đẩy về trang danh sách
                response.sendRedirect(request.getContextPath() + "/admin/category-management");
            }
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/admin/category-management");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");

            // Validate nhỏ: Không cho phép để trống tên
            if (name == null || name.trim().isEmpty()) {
                request.setAttribute("error", "Tên danh mục không được để trống!");
                doGet(request, response);
                return;
            }

            // Đóng gói và Update
            Category category = new Category(categoryId, name, description);
            CategoryDAO categoryDAO = new CategoryDAO();

            if (categoryDAO.updateCategory(category)) {
                request.getSession().setAttribute("toastMsg", "Cập nhật danh mục thành công!");
                response.sendRedirect(request.getContextPath() + "/admin/category-management");
            } else {
                request.setAttribute("error", "Lỗi Cập nhật Database. Vui lòng thử lại!");
                doGet(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Lỗi hệ thống: " + e.getMessage());
            doGet(request, response);
        }
    }
}
