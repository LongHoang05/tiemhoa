/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.CategoryDAO;
import com.tiemhoa.dao.ProductDAO;
import com.tiemhoa.model.Category;
import com.tiemhoa.model.Product;
import com.tiemhoa.util.Validation;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.StandardCopyOption;
import java.nio.file.Files;

/**
 *
 * @author ASUS
 */

@WebServlet(name = "EditProductServlet", urlPatterns = {"/admin/edit-product"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 15    // 15MB
)
public class EditProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idRaw = request.getParameter("id");
        try {
            int productId = Integer.parseInt(idRaw);
            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.getProductById(productId);

            if (product == null) {
                response.sendRedirect(request.getContextPath() + "/admin/product-management");
                return;
            }

            CategoryDAO categoryDAO = new CategoryDAO();
            List<Category> categoryList = categoryDAO.getAllCategories();
            
            request.setAttribute("product", product);
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("page", request.getParameter("page"));
            request.setAttribute("filter", request.getParameter("filter"));
            request.setAttribute("query", request.getParameter("query"));
            request.setAttribute("pageTitle", "Sửa sản phẩm - Floral Haven");
            request.setAttribute("contentPage", "/admin/product/edit.jsp");
            
            request.getRequestDispatcher("/admin/base.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/admin/product-management");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String name = request.getParameter("name");
            String priceStr = request.getParameter("price");
            String stockStr = request.getParameter("stockQuantity");
            String categoryIdStr = request.getParameter("categoryId");
            String description = request.getParameter("description");
            String oldImage = request.getParameter("oldImage"); 
            String finalImage = oldImage; 

            double price = 0;
            int stock = 0;
            int categoryId = 0;

            try {
                if (priceStr != null) price = Double.parseDouble(priceStr);
                if (stockStr != null) stock = Integer.parseInt(stockStr);
                if (categoryIdStr != null) categoryId = Integer.parseInt(categoryIdStr);
            } catch (NumberFormatException e) {
                // Validation will catch this
            }
            // --- VALIDATION PHÍA SERVER ---
            if (Validation.isEmpty(name)) {
                request.setAttribute("error", "Tên sản phẩm không được để trống!");
                request.setAttribute("invalidField", "name");
                sendBackToEdit(request, response, productId, name, price, stock, categoryId, description, oldImage);
                return;
            }
            if (!Validation.isPositive(price)) {
                request.setAttribute("error", "Giá sản phẩm phải lớn hơn 0!");
                request.setAttribute("invalidField", "price");
                sendBackToEdit(request, response, productId, name, price, stock, categoryId, description, oldImage);
                return;
            }
            if (!Validation.isNonNegative(stock)) {
                request.setAttribute("error", "Số lượng trong kho không được âm!");
                request.setAttribute("invalidField", "stock");
                sendBackToEdit(request, response, productId, name, price, stock, categoryId, description, oldImage);
                return;
            }

            Part filePart = request.getPart("image");
            String fileName = filePart.getSubmittedFileName();

            if (fileName != null && !fileName.isEmpty()) {
                // 1. Lưu vào Server (build) bằng InputStream để tránh lỗi đường dẫn
                String serverPath = getServletContext().getRealPath("/") + "assets" + File.separator + "images" + File.separator + "products";
                File serverFile = new File(serverPath, fileName);
                
                if (!serverFile.getParentFile().exists()) serverFile.getParentFile().mkdirs();

                // Dùng InputStream để copy thay vì filePart.write()
                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, serverFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
                }

                // 2. TOOL AUTO COPY VỀ ONEDRIVE
                String sourcePath = "C:\\Users\\ASUS\\OneDrive\\Documents\\NetBeansProjects\\banhoa\\web\\assets\\images\\products";
                File sourceFile = new File(sourcePath, fileName);
                
                if (!sourceFile.getParentFile().exists()) sourceFile.getParentFile().mkdirs();

                try {
                    Files.copy(serverFile.toPath(), sourceFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
                    System.out.println("Auto-backup thành công!");
                } catch (Exception e) {
                    System.out.println("Lỗi backup: " + e.getMessage());
                }

                finalImage = fileName; 
            }
            
            Product p = new Product(productId, name, price, finalImage, description, stock, categoryId, 1);
            ProductDAO productDAO = new ProductDAO();
            
            String page = request.getParameter("page");
            String filter = request.getParameter("filter");
            String query = request.getParameter("query");
            
            if (productDAO.updateProduct(p)) {
                // THÀNH CÔNG: Set Toast và về trang danh sách (kèm theo filter và page)
                request.getSession().setAttribute("toastMsg", "Cập nhật sản phẩm thành công!");
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
            } else {
                request.setAttribute("error", "Cập nhật thất bại tại Database!");
                doGet(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // NẾU LỖI: Không để màn hình trắng, đẩy về lại trang sửa kèm lỗi
            request.setAttribute("error", "Lỗi hệ thống: " + e.getMessage());
            doGet(request, response);
        }
    }

    private void sendBackToEdit(HttpServletRequest request, HttpServletResponse response, int id, String name, double price, int stock, int categoryId, String description, String oldImage) throws ServletException, IOException {
        Product p = new Product(id, name, price, oldImage, description, stock, categoryId, 1);
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> categoryList = categoryDAO.getAllCategories();

        request.setAttribute("product", p);
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("page", request.getParameter("page"));
        request.setAttribute("filter", request.getParameter("filter"));
        request.setAttribute("query", request.getParameter("query"));
        request.setAttribute("pageTitle", "Sửa sản phẩm - Floral Haven");
        request.setAttribute("contentPage", "/admin/product/edit.jsp");
        request.getRequestDispatcher("/admin/base.jsp").forward(request, response);
    }
}
