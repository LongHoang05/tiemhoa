/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller;

import com.tiemhoa.dao.ProductDAO;
import com.tiemhoa.model.Product;
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
@WebServlet(name = "ProductDetailServlet", urlPatterns = {"/product-detail"})
public class ProductDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // 1. Lấy ID sản phẩm từ URL
            String idStr = request.getParameter("id");
            
            if (idStr != null) {
                int productId = Integer.parseInt(idStr);
                ProductDAO dao = new ProductDAO();
                
                // 2. Lấy sản phẩm chính
                Product p = dao.getProductById(productId);
                
                if (p != null) {
                    // =========================================================
                    // 3. LẤY DANH SÁCH SẢN PHẨM TƯƠNG TỰ (Cùng Category)
                    // Chúng ta lấy 4 sản phẩm, trừ sản phẩm hiện tại ra nhé
                    List<Product> similarProducts = dao.getSimilarProducts(p.getCategoryId(), productId, 4);
                    request.setAttribute("similarProducts", similarProducts);
                    // =========================================================

                    // 4. Gói hàng gửi sang JSP
                    request.setAttribute("p", p);
                    request.setAttribute("view", "/pages/product-detail.jsp");
                    request.setAttribute("pageTitle", p.getName() + " - Floral Haven");
                    
                } else {
                    response.sendRedirect("products");
                    return;
                }
            } else {
                response.sendRedirect("products");
                return;
            }

            request.getRequestDispatcher("/index.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("products");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
