package com.example.milkteaweb.dto;

import com.example.milkteaweb.entity.Category;
import com.example.milkteaweb.entity.Product;

import java.io.Serializable;

public class CartItemDto implements Serializable {
    private Product product;
    private int quantity;
    private Category category;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
