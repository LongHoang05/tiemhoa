package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.ContactDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteContactServlet", urlPatterns = {"/admin/delete-contact"})
public class DeleteContactServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            ContactDAO contactDAO = new ContactDAO();
            
            if (contactDAO.deleteContact(id)) {
                request.getSession().setAttribute("toastMsg", "Đã xóa phản hồi thành công!");
            } else {
                request.getSession().setAttribute("toastMsg", "Lỗi: Không thể xóa phản hồi.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/admin/feedback");
    }
}
