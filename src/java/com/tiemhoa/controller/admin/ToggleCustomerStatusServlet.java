package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ToggleCustomerStatusServlet", urlPatterns = {"/admin/toggle-customer-status"})
public class ToggleCustomerStatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idRaw = request.getParameter("id");
        String statusRaw = request.getParameter("status");
        
        try {
            int userId = Integer.parseInt(idRaw);
            int currentStatus = Integer.parseInt(statusRaw);
            
            UserDAO userDAO = new UserDAO();
            if (userDAO.toggleUserStatus(userId, currentStatus)) {
                request.getSession().setAttribute("toastMsg", "Cập nhật trạng thái thành công!");
            } else {
                request.getSession().setAttribute("toastMsg", "Lỗi: Không thể cập nhật trạng thái!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // Quay lại trang danh sách hoặc trang chi tiết tùy nơi gọi
        String referer = request.getHeader("Referer");
        if (referer != null && !referer.isEmpty()) {
            response.sendRedirect(referer);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/customer-management");
        }
    }
}
