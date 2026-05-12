/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tiemhoa.model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class Cart {

    private List<CartItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<CartItem> getItems() {
        return items;
    }

    // Hàm lấy số lượng món hàng trong giỏ
    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    // Hàm tìm xem trong giỏ đã có hoa này chưa
    private CartItem getItemById(int id) {
        for (CartItem i : items) {
            if (i.getProduct().getProductId() == id) {
                return i;
            }
        }
        return null;
    }

    // NGHIỆP VỤ QUAN TRỌNG: Thêm hoa vào giỏ
    public void addItem(CartItem newItem) {
        CartItem existItem = getItemById(newItem.getProduct().getProductId());
        if (existItem != null) {
            // Nếu hoa đã có trong giỏ, chỉ cần cộng dồn số lượng
            existItem.setQuantity(existItem.getQuantity() + newItem.getQuantity());
        } else {
            // Nếu chưa có thì thêm món mới vào
            items.add(newItem);
        }
    }

    // NGHIỆP VỤ: Xóa hoa khỏi giỏ
    public void removeItem(int id) {
        CartItem item = getItemById(id);
        if (item != null) {
            items.remove(item);
        }
    }

    // NGHIỆP VỤ: Tính tổng số tiền cả giỏ hàng (Để lát nữa nhét vào cột total_amount của bảng orders)
    public double getTotalMoney() {
        double total = 0;
        for (CartItem i : items) {
            total += i.getTotalPrice();
        }
        return total;
    }

    public void updateQuantity(int productId, int amount) {
        CartItem item = getItemById(productId);
        if (item != null) {
            int newQuantity = item.getQuantity() + amount;
            // Chỉ cập nhật nếu số lượng mới >= 1
            if (newQuantity >= 1) {
                item.setQuantity(newQuantity);
            }
            // Không còn lệnh remove ở đây nữa, việc xóa đã có nút Thùng Rác lo!
        }
    }
}
