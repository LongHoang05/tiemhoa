/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.CategoryDAO;
import com.tiemhoa.model.Category;
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
@WebServlet(name = "SearchCategoryServlet", urlPatterns = {"/admin/search-category"})
public class SearchCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
       response.setContentType("text/html;charset=UTF-8");
        
        // Lấy từ khóa khách hàng gõ
        String query = request.getParameter("query");
        
        // Gọi DAO (Bạn cần có hàm searchCategoryByName trong CategoryDAO nhé)
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> list = categoryDAO.searchCategoryByName(query); 
        
        // Đẩy list kết quả sang JSP phụ
        request.setAttribute("categoryList", list);
        request.getRequestDispatcher("/admin/category/search-results.jsp").forward(request, response);
    }
}
