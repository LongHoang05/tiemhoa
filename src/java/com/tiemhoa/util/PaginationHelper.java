/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tiemhoa.util;

import jakarta.servlet.http.HttpServletRequest;

/**
 *
 * @author ASUS
 */
public class PaginationHelper {
    private int currentPage;
    private int pageSize;
    private int totalRecords;
    private int totalPages;

    public PaginationHelper(HttpServletRequest request, int totalRecords, int defaultPageSize) {
        this.totalRecords = totalRecords;
        this.pageSize = defaultPageSize;
        
        // 1. Tính toán tổng số trang
        this.totalPages = (int) Math.ceil((double) this.totalRecords / this.pageSize);
        
        // 2. Lấy trang hiện tại từ URL (mặc định là 1 nếu không có hoặc nhập sai)
        this.currentPage = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                this.currentPage = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                this.currentPage = 1;
            }
        }
        
        // 3. Đảm bảo currentPage không bị vượt quá giới hạn (ví dụ có 5 trang mà người dùng gõ URL page=10)
        if (this.currentPage > this.totalPages && this.totalPages > 0) {
            this.currentPage = this.totalPages;
        } else if (this.currentPage < 1) {
            this.currentPage = 1;
        }
    }

    // Getters để lấy giá trị truyền vào DAO
    public int getCurrentPage() { return currentPage; }
    public int getPageSize() { return pageSize; }
    public int getTotalPages() { return totalPages; }

    /**
     * Hàm tiện ích giúp tự động set các thuộc tính cần thiết vào request để hiển thị trên JSP
     */
    public void setPaginationAttributes(HttpServletRequest request, String paginationUrl) {
        // Chuẩn hóa URL (đảm bảo có dấu ? hoặc & để nối thêm tham số page)
        String finalUrl = paginationUrl.contains("?") ? paginationUrl + "&" : paginationUrl + "?";
        
        // Tính toán khoảng trang hiển thị (Tối đa 5 trang)
        int startPage = Math.max(1, this.currentPage - 2);
        int endPage = Math.min(this.totalPages, startPage + 4);
        
        if (endPage - startPage < 4) {
            startPage = Math.max(1, endPage - 4);
        }

        request.setAttribute("currentPage", this.currentPage);
        request.setAttribute("totalPages", this.totalPages);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("paginationUrl", finalUrl);
    }
}
