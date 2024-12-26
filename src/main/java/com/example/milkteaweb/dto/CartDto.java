package com.example.milkteaweb.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class CartDto implements Serializable {
    private List<CartItemDto> items = new ArrayList<>();
    private String address;
    private String receiver;
    private double totalPrice;
    private String phone;
    private double shipFee;

    public CartDto() {
        this.items = new ArrayList<>();
        this.address = "";
        this.receiver = "";
        this.totalPrice = 0;
        this.phone = "";
        this.shipFee = 0;
    }

    public List<CartItemDto> getItems() {
        return items;
    }

    public void setItems(List<CartItemDto> items) {
        this.items = items;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public double getShipFee() {
        return shipFee;
    }

    public void setShipFee(double shipFee) {
        this.shipFee = shipFee;
    }
}
