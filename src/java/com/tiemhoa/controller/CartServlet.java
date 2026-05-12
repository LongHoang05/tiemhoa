/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller;

import com.tiemhoa.dao.ProductDAO;
import com.tiemhoa.model.Cart;
import com.tiemhoa.model.CartItem;
import com.tiemhoa.model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ProductDAO productDAO = new ProductDAO();
        com.tiemhoa.dao.CategoryDAO categoryDAO = new com.tiemhoa.dao.CategoryDAO();
        
        // Tìm ID của danh mục "Phụ kiện" một cách linh hoạt
        int accessoryId = -1;
        List<com.tiemhoa.model.Category> categories = categoryDAO.getAllCategories();
        for (com.tiemhoa.model.Category cat : categories) {
            if (cat.getName().toLowerCase().contains("phụ kiện")) {
                accessoryId = cat.getCategoryId();
                break;
            }
        }

        List<Product> accessoryList = null;
        if (accessoryId != -1) {
            accessoryList = productDAO.getProductsByCategory(accessoryId);
            if (accessoryList != null && !accessoryList.isEmpty()) {
                java.util.Collections.shuffle(accessoryList); // Xáo trộn ngẫu nhiên
            }
        }
        
        request.setAttribute("accessoryList", accessoryList);
        request.setAttribute("view", "/pages/cart.jsp");
        request.setAttribute("pageTitle", "Giỏ hàng của bạn - Floral Haven");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
        }

        try {
            if ("add".equals(action)) {
                int productId = Integer.parseInt(request.getParameter("productId"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                
                ProductDAO dao = new ProductDAO();
                Product product = dao.getProductById(productId);
                
                if (product != null) {
                    CartItem item = new CartItem(product, quantity);
                    cart.addItem(item);
                }
            } 
            else if ("update".equals(action)) {
                // Nhận ID sản phẩm và số lượng thay đổi (+1 hoặc -1)
                int productId = Integer.parseInt(request.getParameter("productId"));
                int amount = Integer.parseInt(request.getParameter("amount"));
                
                // Gọi hàm updateQty trong Cart model (Cần viết thêm ở Cart.java)
                cart.updateQuantity(productId, amount);
            }
            else if ("remove".equals(action)) {
                // Nhận ID sản phẩm cần xóa
                int productId = Integer.parseInt(request.getParameter("productId"));
                cart.removeItem(productId);
            }
            
            // Cập nhật lại giỏ hàng vào Session
            session.setAttribute("cart", cart);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // Trả về kết quả
        String redirect = request.getParameter("redirect");
        String requestedWith = request.getHeader("X-Requested-With");
        
        if ("XMLHttpRequest".equals(requestedWith)) {
            // Nếu là AJAX, trả về số lượng sản phẩm mới trong giỏ
            response.setContentType("text/plain");
            response.getWriter().write(String.valueOf(cart.getItems().size()));
        } else if ("stay".equals(redirect)) {
            String referer = request.getHeader("referer");
            response.sendRedirect(referer != null ? referer : request.getContextPath() + "/products");
        } else {
            response.sendRedirect(request.getContextPath() + "/cart");
        }
    }
}
