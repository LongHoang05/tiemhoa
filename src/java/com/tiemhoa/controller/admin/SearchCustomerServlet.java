package com.tiemhoa.controller.admin;

import com.tiemhoa.dao.UserDAO;
import com.tiemhoa.model.User;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchCustomerServlet", urlPatterns = {"/admin/search-customer"})
public class SearchCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String query = request.getParameter("query");
        UserDAO userDAO = new UserDAO();
        List<User> list = userDAO.searchCustomers(query);
        
        request.setAttribute("customerList", list);
        request.getRequestDispatcher("/admin/customer/search-results.jsp").forward(request, response);
    }
}
