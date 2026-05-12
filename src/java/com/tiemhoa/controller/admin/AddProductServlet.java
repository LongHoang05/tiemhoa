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
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.StandardCopyOption;
import java.nio.file.Files;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AddProductServlet", urlPatterns = {"/admin/add-product"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 15 // 15MB
)
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1. Lấy danh sách danh mục để người dùng chọn trong thẻ <select>
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> categoryList = categoryDAO.getAllCategories();
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("page", request.getParameter("page"));
        request.setAttribute("filter", request.getParameter("filter"));

        // 2. Thiết lập thông tin để hiển thị qua base.jsp
        request.setAttribute("pageTitle", "Thêm sản phẩm mới - Floral Haven");
        request.setAttribute("contentPage", "/admin/product/add.jsp");

        request.getRequestDispatcher("/admin/base.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // 1. Đọc dữ liệu từ form gửi lên
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String stockStr = request.getParameter("stockQuantity");
        String categoryIdStr = request.getParameter("categoryId");
        String description = request.getParameter("description");
        
        double price = 0;
        int stock = 0;
        int categoryId = 0;

        try {
            if (priceStr != null) price = Double.parseDouble(priceStr);
            if (stockStr != null) stock = Integer.parseInt(stockStr);
            if (categoryIdStr != null) categoryId = Integer.parseInt(categoryIdStr);
        } catch (NumberFormatException e) {
            // Handle error later in validation
        }

        Part filePart = request.getPart("image"); // Tên input trong JSP là "image"
        String fileName = filePart.getSubmittedFileName();

        // --- VALIDATION PHÍA SERVER ---
        if (Validation.isEmpty(name)) {
            request.setAttribute("error", "Tên sản phẩm không được để trống!");
            request.setAttribute("invalidField", "name");
            sendBackData(request, name, price, stock, categoryId, description);
            doGet(request, response);
            return;
        }
        if (!Validation.isPositive(price)) {
            request.setAttribute("error", "Giá sản phẩm phải lớn hơn 0!");
            request.setAttribute("invalidField", "price");
            sendBackData(request, name, price, stock, categoryId, description);
            doGet(request, response);
            return;
        }
        if (!Validation.isNonNegative(stock)) {
            request.setAttribute("error", "Số lượng trong kho không được âm!");
            request.setAttribute("invalidField", "stock");
            sendBackData(request, name, price, stock, categoryId, description);
            doGet(request, response);
            return;
        }

        String uploadPath = getServletContext().getRealPath("/") + "assets" + File.separator + "images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // 2. Xử lý lưu ảnh
        if (fileName != null && !fileName.isEmpty()) {
            // 1. Xác định đường dẫn Server (Thư mục build)
            String serverPath = getServletContext().getRealPath("/") + "assets" + File.separator + "images" + File.separator + "products";
            File serverFile = new File(serverPath, fileName);

            // Đảm bảo thư mục tồn tại
            if (!serverFile.getParentFile().exists()) {
                serverFile.getParentFile().mkdirs();
            }

            // 2. THAY ĐỔI QUAN TRỌNG: Lưu file vào Server bằng InputStream
            try ( InputStream input = filePart.getInputStream()) {
                Files.copy(input, serverFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }

            // 3. TOOL AUTO COPY VỀ ONEDRIVE (Giữ nguyên logic nhưng dùng Files.copy từ file đã lưu)
            String sourcePath = "C:\\Users\\ASUS\\OneDrive\\Documents\\NetBeansProjects\\banhoa\\web\\assets\\images\\products";
            File sourceFile = new File(sourcePath, fileName);

            if (!sourceFile.getParentFile().exists()) {
                sourceFile.getParentFile().mkdirs();
            }

            try {
                Files.copy(serverFile.toPath(), sourceFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
                System.out.println("Đã auto-backup ảnh thành công về OneDrive!");
            } catch (Exception e) {
                System.out.println("Lỗi backup: " + e.getMessage());
            }
        }

        // 2. Tạo đối tượng Product
        Product newProduct = new Product(0, name, price, fileName, description, stock, categoryId, 1);

        // 3. Gọi DAO để thêm vào DB
        ProductDAO productDAO = new ProductDAO();
        boolean isSuccess = productDAO.addProduct(newProduct);

        if (isSuccess) {
            // Thêm thành công thì quay về trang danh sách
            String page = request.getParameter("page");
            String filter = request.getParameter("filter");
            String redirectUrl = request.getContextPath() + "/admin/product-management";
            
            if (page != null || filter != null) {
                redirectUrl += "?";
                if (page != null) redirectUrl += "page=" + page;
                if (filter != null) {
                    if (page != null) redirectUrl += "&";
                    redirectUrl += "filter=" + filter;
                }
            }
            response.sendRedirect(redirectUrl);
        } else {
            // Thất bại thì báo lỗi (có thể forward lại trang add kèm thông báo)
            request.setAttribute("error", "Không thể thêm sản phẩm, vui lòng thử lại!");
            doGet(request, response);
        }
    }
    private void sendBackData(HttpServletRequest request, String name, double price, int stock, int categoryId, String description) {
        request.setAttribute("oldName", name);
        request.setAttribute("oldPrice", price);
        request.setAttribute("oldStock", stock);
        request.setAttribute("oldCategoryId", categoryId);
        request.setAttribute("oldDescription", description);
    }
}
