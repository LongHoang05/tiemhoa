package com.tiemhoa.controller;

import com.tiemhoa.dao.ContactDAO;
import com.tiemhoa.model.Contact;
import com.tiemhoa.util.Validation;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ContactServlet", urlPatterns = {"/contact"})
public class ContactServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("view", "/pages/contact.jsp");
        request.setAttribute("pageTitle", "Liên hệ với chúng tôi - Floral Haven");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        // 1. Lấy dữ liệu từ form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        
        // 2. Validation (Sử dụng lớp tiện ích Validation của bạn)
        if (Validation.isEmpty(name) || Validation.isEmpty(email) || Validation.isEmpty(content)) {
            request.setAttribute("error", "Vui lòng điền đầy đủ các trường bắt buộc (*)");
            doGet(request, response);
            return;
        }
        
        if (!Validation.isValidEmail(email)) {
            request.setAttribute("error", "Địa chỉ email không hợp lệ!");
            doGet(request, response);
            return;
        }
        
        // 3. Tạo đối tượng Contact
        Contact contact = new Contact();
        contact.setSenderName(name);
        contact.setSenderEmail(email);
        contact.setSubject(subject);
        contact.setMessage(content);
        
        // 3. Lưu vào database qua DAO
        ContactDAO contactDAO = new ContactDAO();
        boolean success = contactDAO.insertContact(contact);
        
        if (success) {
            request.setAttribute("message", "Cảm ơn " + name + "! Chúng tôi đã nhận được thông tin và sẽ phản hồi sớm nhất.");
        } else {
            request.setAttribute("error", "Rất tiếc, đã có lỗi xảy ra khi gửi lời nhắn. Vui lòng thử lại sau!");
        }
        
        doGet(request, response);
    }
}
