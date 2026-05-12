/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tiemhoa.model;

/**
 *
 * @author ASUS
 */
public class Product {
    private int productId;
    private String name;
    private double price;
    private String imageUrl;
    private String description;
    private int stockQuantity;
    private int categoryId;
    private int isActive;
    private String storyText; 
    private String storyImage;

    public Product() {}

    public Product(int productId, String name, double price, 
                   String imageUrl, String description, int stockQuantity, 
                   int categoryId, int isActive) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.imageUrl = imageUrl;
        this.description = description;
        this.stockQuantity = stockQuantity;
        this.categoryId = categoryId;
        this.isActive = isActive;
    }

    // Getters và Setters
    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    
    public int getStockQuantity() { return stockQuantity; }
    public void setStockQuantity(int stockQuantity) { this.stockQuantity = stockQuantity; }

    public int getCategoryId() { return categoryId; }
    public void setCategoryId(int categoryId) { this.categoryId = categoryId; }

    public int getIsActive() { return isActive; }
    public void setIsActive(int isActive) { this.isActive = isActive; }
    
    public String getStoryText() { return storyText; }
    public void setStoryText(String storyText) { this.storyText = storyText; }

    public String getStoryImage() { return storyImage; }
    public void setStoryImage(String storyImage) { this.storyImage = storyImage; }
}
