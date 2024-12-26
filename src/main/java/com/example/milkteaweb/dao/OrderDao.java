package com.example.milkteaweb.dao;

import com.example.milkteaweb.entity.Orders;

public interface OrderDao extends Dao<Orders> {
    Boolean insert(Orders orders);
}
