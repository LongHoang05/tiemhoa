package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.ContactDAO;
import com.tiemhoa.model.Contact;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminContactServlet", urlPatterns = {"/admin/feedback"})
public class AdminContactServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ContactDAO contactDAO = new ContactDAO();
        List<Contact> contactList = contactDAO.getAllContacts();
        
        request.setAttribute("contactList", contactList);
        request.setAttribute("pageTitle", "Quản lý phản hồi - Floral Haven");
        request.setAttribute("contentPage", "/admin/feedback/list.jsp");
        
        request.getRequestDispatcher("/admin/base.jsp").forward(request, response);
    }
}
