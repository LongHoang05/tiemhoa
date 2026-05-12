/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/**
 * Hàm tìm kiếm Realtime dùng chung cho hệ thống Admin
 * @param {string} searchInputId - ID của ô input nhập từ khóa
 * @param {string} filterId - ID của thẻ <select> để lọc (truyền null nếu không có)
 * @param {string} targetBodyId - ID của thẻ <tbody> cần đổ kết quả vào
 * @param {string} searchUrl - Đường dẫn tới Servlet xử lý (VD: /admin/search-category)
 * @param {string} contextPath - Đường dẫn gốc của project
 */
function initAdminSearch(searchInputId, filterId, targetBodyId, searchUrl, contextPath) {
    const searchInput = document.getElementById(searchInputId);
    const filterElement = filterId ? document.getElementById(filterId) : null;
    const tbody = document.getElementById(targetBodyId);
    const pagination = document.getElementById('paginationContainer');

    if (!searchInput || !tbody) return;

    function performSearch() {
        const query = searchInput.value.trim();
        const filterVal = filterElement ? filterElement.value : "";
        
        /**
         * LOGIC XỬ LÝ PHÂN TRANG:
         * Hiện lại phân trang CHỈ KHI: Ô tìm kiếm trống VÀ không chọn filter (filterVal trống hoặc "0").
         */
        if (pagination) {
            if (query === "" && (filterVal === "" || filterVal === "0")) {
                pagination.style.display = 'flex'; 
            } else {
                pagination.style.display = 'none';
            }
        }

        const url = contextPath + searchUrl + "?query=" + encodeURIComponent(query) + "&filter=" + filterVal;

        fetch(url)
            .then(response => response.text())
            .then(html => {
                tbody.innerHTML = html;
            })
            .catch(err => console.error('Lỗi search:', err));
    }

    searchInput.addEventListener('input', performSearch);
    if (filterElement) {
        filterElement.addEventListener('change', performSearch);
    }
}