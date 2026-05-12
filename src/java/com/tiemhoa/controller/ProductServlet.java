/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller;

import com.tiemhoa.dao.CategoryDAO;
import com.tiemhoa.dao.ProductDAO;
import com.tiemhoa.model.Category;
import com.tiemhoa.model.Product;
import com.tiemhoa.util.PaginationHelper;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/products"})
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        try {
            ProductDAO productDAO = new ProductDAO();
            CategoryDAO categoryDAO = new CategoryDAO(); // Khởi tạo CategoryDAO

            // 1. LẤY CÁC THAM SỐ LỌC TỪ URL
            String categoryIdStr = request.getParameter("categoryId");
            String priceRange = request.getParameter("priceRange");
            String sort = request.getParameter("sort");
            
            int categoryId = 0; 
            if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
                categoryId = Integer.parseInt(categoryIdStr);
            }

            // 2. LẤY TỔNG SỐ SẢN PHẨM SAU KHI LỌC
            int totalRecords = productDAO.getTotalFilteredProducts(categoryId, priceRange);

            // 3. SỬ DỤNG PAGINATION HELPER (Hiển thị 12 SP/trang)
            PaginationHelper pagination = new PaginationHelper(request, totalRecords, 12);

            // 4. LẤY DANH SÁCH SẢN PHẨM THEO TẤT CẢ TIÊU CHÍ
            List<Product> productList = productDAO.getFilteredProducts(
                categoryId, 
                priceRange, 
                sort, 
                pagination.getCurrentPage(), 
                pagination.getPageSize()
            );

            // 5. TẠO URL CHO NÚT PHÂN TRANG (Phải giữ lại các tham số lọc)
            StringBuilder paginationUrl = new StringBuilder(request.getContextPath() + "/products?");
            if (categoryId > 0) paginationUrl.append("categoryId=").append(categoryId).append("&");
            if (priceRange != null) paginationUrl.append("priceRange=").append(priceRange).append("&");
            if (sort != null) paginationUrl.append("sort=").append(sort).append("&");
            
            String finalUrl = paginationUrl.toString();
            if (finalUrl.endsWith("&") || finalUrl.endsWith("?")) {
                finalUrl = finalUrl.substring(0, finalUrl.length() - 1);
            }
            
            // TỰ ĐỘNG THIẾT LẬP: currentPage, totalPages, startPage, endPage, paginationUrl
            pagination.setPaginationAttributes(request, finalUrl);

            // =========================================================
            // ĐÂY LÀ PHẦN LẤY DANH MỤC BỊ THIẾU
            List<Category> categoryList = categoryDAO.getAllCategories();
            request.setAttribute("categoryList", categoryList);
            // =========================================================

            // 6. TRUYỀN DỮ LIỆU SANG JSP
            request.setAttribute("productList", productList);
            request.setAttribute("categoryId", categoryId); 
            request.setAttribute("totalRecords", totalRecords);

            // 7. CẤU HÌNH LAYOUT VÀ FORWARD
            request.setAttribute("view", "/pages/products.jsp");
            request.setAttribute("pageTitle", "Bộ Sưu Tập Hoa");

            request.getRequestDispatcher("/index.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println("Lỗi tại ProductServlet: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
