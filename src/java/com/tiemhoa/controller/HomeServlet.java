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
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1. Thiết lập tiếng Việt cho request và response
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        int countNewProduct = 8;
        int countBestSellerProduct = 8;
        
        try {
            ProductDAO productDAO = new ProductDAO();

            // 2. Lấy dữ liệu từ DAO
            List<Product> topNewProducts = productDAO.getTopNewProducts(countNewProduct); 
            List<Product> bestSellerProducts = productDAO.getBestSellerProducts(countBestSellerProduct);

            // 3. Đẩy dữ liệu Sản phẩm vào Request Attribute
            request.setAttribute("topNewProducts", topNewProducts);
            request.setAttribute("bestSellerProducts", bestSellerProducts);

            // 4. BÁO CHO INDEX.JSP BIẾT CẦN HIỂN THỊ TRANG NÀO
            request.setAttribute("view", "/pages/home-content.jsp");
            request.setAttribute("pageTitle", "Trang chủ");

            // 5. Chuyển hướng (Forward) sang trang index.jsp làm khung giao diện
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            // Xử lý lỗi nếu cần
        }
    }
}
