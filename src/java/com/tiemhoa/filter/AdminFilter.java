package com.tiemhoa.filter;

import com.tiemhoa.model.User;
import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/admin/*"})
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
        
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            httpRequest.setAttribute("error", "Vui lòng đăng nhập bằng tài khoản quản trị để truy cập!");
            httpRequest.setAttribute("view", "/pages/login.jsp");
            httpRequest.getRequestDispatcher("/index.jsp").forward(httpRequest, httpResponse);
            return;
        }
        
        if (user.getRoleId() != 0) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/home");
            return;
        }
        
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}
