package com.example.milkteaweb.entity;

import java.math.BigDecimal;

public class Product {
    private int id;
    private int categoryId;
    private String name;
    private String image;
    private BigDecimal price;
    private String description;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String toJson() {
        return "{" +
                "id:" + id +
                ", categoryId:" + categoryId +
                ", name:'" + name + '\'' +
                ", image:'" + image + '\'' +
                ", price:" + price +
                ", description:'" + description + '\'' +
                '}';
    }
}
