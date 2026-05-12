<%-- 
    Document   : add
    Created on : May 8, 2026, 12:22:30 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="admin-header">
    <div>
        <h1>Thêm sản phẩm mới</h1>
        <p>Nhập đầy đủ thông tin để tạo bó hoa mới trong hệ thống.</p>
    </div>
    <a href="${pageContext.request.contextPath}/admin/product-management?page=${page}&filter=${filter}" class="back-link">
        <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-arrow-back"></use></svg> Quay lại danh sách
    </a>
</header>

<div class="form-container" style="max-width: 1000px;">
    <form action="${pageContext.request.contextPath}/admin/add-product" method="POST" enctype="multipart/form-data" class="table-card admin-form">
        <input type="hidden" name="page" value="${page}">
        <input type="hidden" name="filter" value="${filter}">
        
        <c:if test="${not empty error}">
            <div class="admin-alert admin-alert-error">
                <svg class="icon" style="font-size: 18px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-error"></use></svg>
                ${error}
            </div>
        </c:if>

        <div class="form-grid" style="grid-template-columns: 1.2fr 0.8fr; gap: 40px;">
            <!-- CỘT TRÁI: THÔNG TIN CƠ BẢN -->
            <div class="form-col">
                <div class="form-group">
                    <label>Tên sản phẩm <span style="color: var(--error);">*</span></label>
                    <input type="text" name="name" id="name" required placeholder="Ví dụ: Bó hoa hồng đỏ vĩnh cửu" value="${oldName}" class="admin-input">
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                    <div class="form-group">
                        <label>Danh mục</label>
                        <select name="categoryId" required class="admin-select">
                            <c:forEach items="${categoryList}" var="c">
                                <option value="${c.categoryId}" ${c.categoryId == oldCategoryId ? 'selected' : ''}>${c.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Giá bán (VNĐ) <span style="color: var(--error);">*</span></label>
                        <input type="number" name="price" required placeholder="Ví dụ: 500000" min="0" value="${oldPrice}" class="admin-input">
                    </div>
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                    <div class="form-group">
                        <label>Số lượng kho</label>
                        <input type="number" name="stockQuantity" required placeholder="Ví dụ: 10" min="0" value="${oldStock}" class="admin-input">
                    </div>
                    <div class="form-group">
                        <label>Trạng thái</label>
                        <select name="isActive" class="admin-select">
                            <option value="1">Đang bán</option>
                            <option value="0">Ngừng kinh doanh</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label>Mô tả chi tiết</label>
                    <textarea name="description" rows="10" placeholder="Nhập mô tả chi tiết về sản phẩm, ý nghĩa loài hoa..." class="admin-textarea">${oldDescription}</textarea>
                </div>
            </div>

            <!-- CỘT PHẢI: HÌNH ẢNH -->
            <div class="form-col">
                <div class="form-group">
                    <label>Hình ảnh sản phẩm</label>
                    <div id="image-preview-container" style="width: 100%; aspect-ratio: 1/1; border: 2px dashed var(--border); border-radius: 12px; display: flex; align-items: center; justify-content: center; overflow: hidden; background: #f9f9f9; margin-bottom: 16px; position: relative;">
                        <img id="preview-img" src="#" alt="Preview" style="display: none; width: 100%; height: 100%; object-fit: cover;">
                        <div id="preview-placeholder" style="text-align: center; color: var(--text-muted);">
                            <svg class="icon" style="font-size: 48px;"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-image"></use></svg>
                            <p style="margin-top: 8px; font-size: 13px;">Chưa có ảnh</p>
                        </div>
                    </div>
                    
                    <div style="position: relative;">
                        <input type="file" name="image" id="image-input" accept="image/*" class="admin-input" style="padding-left: 40px;" onchange="previewImage(this)">
                        <svg class="icon" style="position: absolute; left: 10px; top: 50%; transform: translateY(-50%); color: var(--text-muted);"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-upload"></use></svg>
                    </div>
                    <p style="font-size: 11px; color: var(--text-muted); margin-top: 8px; line-height: 1.4;">
                        Định dạng: JPG, PNG, WEBP. <br>
                        Dung lượng tối đa 2MB. Tỷ lệ khuyên dùng 1:1.
                    </p>
                </div>
            </div>
        </div>

        <div style="margin-top: 40px; display: flex; justify-content: flex-end; gap: 16px; border-top: 1px solid var(--border); padding-top: 24px;">
            <a href="${pageContext.request.contextPath}/admin/product-management?page=${page}&filter=${filter}" class="action-btn" style="text-decoration: none; padding: 12px 32px; border-radius: 50px; display: flex; align-items: center;">Hủy bỏ</a>
            <button type="submit" class="btn-primary" style="padding: 12px 40px;">
                <svg class="icon"><use href="${pageContext.request.contextPath}/icon/sprite.svg#icon-save"></use></svg>
                Lưu sản phẩm
            </button>
        </div>
    </form>
</div>

<script>
    function previewImage(input) {
        const preview = document.getElementById('preview-img');
        const placeholder = document.getElementById('preview-placeholder');
        
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result;
                preview.style.display = 'block';
                placeholder.style.display = 'none';
            }
            reader.readAsDataURL(input.files[0]);
        } else {
            preview.style.display = 'none';
            placeholder.style.display = 'block';
        }
    }

    window.onload = function() {
        var invalidField = "${invalidField}";
        if (invalidField) {
            var element = document.getElementById(invalidField);
            if (element) {
                element.focus();
                element.style.borderColor = "#ba1a1a";
                element.style.boxShadow = "0 0 0 2px #ffdad6";
            }
        }
    };
</script>
