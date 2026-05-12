/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.CategoryDAO;
import com.tiemhoa.dao.ProductDAO;
import com.tiemhoa.model.Category;
import com.tiemhoa.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "SearchProductServlet", urlPatterns = {"/admin/search-product"})
public class SearchProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String query = request.getParameter("query");
        // Hàm initAdminSearch gửi filter qua tham số "filter"
        String filterParam = request.getParameter("filter");
        int categoryId = (filterParam != null && !filterParam.isEmpty()) ? Integer.parseInt(filterParam) : 0;
        
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        
        List<Product> list;
        if (query != null && !query.trim().isEmpty()) {
            // Trường hợp có tìm kiếm: Giới hạn 5 sản phẩm như yêu cầu của bạn
            list = productDAO.searchProducts(query, categoryId, 5);
        } else if (categoryId > 0) {
            // Trường hợp chỉ lọc danh mục (không tìm kiếm): Hiển thị tất cả sản phẩm của danh mục đó
            list = productDAO.getProductsByCategory(categoryId);
        } else {
            // Không có tìm kiếm và không có lọc: Lấy danh sách mặc định (Top 10 hoặc All)
            list = productDAO.getAllProducts(); 
        }
        
        List<Category> categoryList = categoryDAO.getAllCategories();
        
        // Đẩy sang JSP
        request.setAttribute("productList", list);
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("query", query);
        request.setAttribute("filter", filterParam);
        
        // Forward tới file kết quả phụ
        request.getRequestDispatcher("/admin/product/search-results.jsp").forward(request, response);
    }
}
