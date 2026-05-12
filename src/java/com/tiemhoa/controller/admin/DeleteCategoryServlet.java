/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.CategoryDAO;
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
@WebServlet(name = "DeleteCategoryServlet", urlPatterns = {"/admin/delete-category"})
public class DeleteCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            CategoryDAO categoryDAO = new CategoryDAO();

            // Thực hiện xóa
            boolean isSuccess = categoryDAO.deleteCategory(id);

            if (isSuccess) {
                // Xóa thành công
                request.getSession().setAttribute("toastMsg", "Đã xóa danh mục thành công!");
            } else {
                // Xóa thất bại (Thường là do có sản phẩm đang dùng danh mục này - Lỗi Khóa Ngoại SQL)
                request.getSession().setAttribute("toastMsg", "LỖI: Không thể xóa! Danh mục này đang chứa sản phẩm.");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("toastMsg", "Lỗi hệ thống không thể xóa!");
        }
        
        // Dù thành công hay thất bại cũng quay thẳng về trang danh sách để xem kết quả
        response.sendRedirect(request.getContextPath() + "/admin/category-management");
    }
}
