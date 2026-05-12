/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller.admin;

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
@WebServlet(name = "AdminProductServlet", urlPatterns = {"/admin/product-management"})
public class AdminProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        // --------------------------------------------------------
        // 1. XỬ LÝ BỘ LỌC DANH MỤC
        // --------------------------------------------------------
        String categoryIdStr = request.getParameter("filter"); // Đồng nhất với tham số "filter" của AJAX
        int categoryId = (categoryIdStr != null && !categoryIdStr.isEmpty()) ? Integer.parseInt(categoryIdStr) : 0;

        // --------------------------------------------------------
        // 2. XỬ LÝ LOGIC PHÂN TRANG
        // --------------------------------------------------------
        int totalProducts = (categoryId > 0) ? 
                           productDAO.getTotalProductsByCategory(categoryId) : 
                           productDAO.getTotalProducts();
        
        PaginationHelper pagination = new PaginationHelper(request, totalProducts, 5);

        List<Product> productList;
        if (categoryId > 0) {
            productList = productDAO.getProductsByCategoryAndPage(categoryId, pagination.getCurrentPage(), pagination.getPageSize());
        } else {
            productList = productDAO.getProductsByPage(pagination.getCurrentPage(), pagination.getPageSize());
        }
        
        // --------------------------------------------------------
        // 3. CHUẨN BỊ DỮ LIỆU ĐẨY LÊN GIAO DIỆN
        // --------------------------------------------------------
        List<Category> categoryList = categoryDAO.getAllCategories();

        request.setAttribute("productList", productList);
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("selectedCategoryId", categoryId); // Để giữ trạng thái dropdown
        request.setAttribute("pageTitle", "Quản lý Sản phẩm - Floral Haven");
        request.setAttribute("contentPage", "/admin/product/list.jsp");

        // 4. Thiết lập URL phân trang (Cần giữ lại filter nếu có)
        String url = request.getContextPath() + "/admin/product-management";
        if (categoryId > 0) {
            url += "?filter=" + categoryId;
        }
        pagination.setPaginationAttributes(request, url);

        // 5. Forward sang base.jsp
        request.getRequestDispatcher("/admin/base.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
