/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.ProductDAO;
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
@WebServlet(name = "DeleteProductServlet", urlPatterns = {"/admin/delete-product"})
public class DeleteProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1. Lấy ID sản phẩm cần xóa từ URL
        String idRaw = request.getParameter("id");
        
        try {
            int productId = Integer.parseInt(idRaw);
            
            // 2. Gọi DAO để thực hiện "xóa mềm"
            ProductDAO productDAO = new ProductDAO();
            productDAO.deleteProduct(productId);
            
        } catch (Exception e) {
            System.out.println("Lỗi khi xóa sản phẩm: " + e.getMessage());
        }
        
        // 3. Xóa xong (hoặc có lỗi) thì đều tự động quay về trang danh sách (kèm filter/page)
        String page = request.getParameter("page");
        String filter = request.getParameter("filter");
        String query = request.getParameter("query");

        String redirectUrl = request.getContextPath() + "/admin/product-management";
        StringBuilder params = new StringBuilder();
        if (page != null && !page.isEmpty()) params.append("page=").append(page);
        if (filter != null && !filter.isEmpty()) {
            if (params.length() > 0) params.append("&");
            params.append("filter=").append(filter);
        }
        if (query != null && !query.isEmpty()) {
            if (params.length() > 0) params.append("&");
            params.append("query=").append(query);
        }

        if (params.length() > 0) {
            redirectUrl += "?" + params.toString();
        }
        
        response.sendRedirect(redirectUrl);
    }
}
