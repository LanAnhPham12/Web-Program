package com.example.milkteaweb.dao;

import com.example.milkteaweb.entity.OrderDetail;

import java.util.List;

public interface OrderDetailDao extends Dao<OrderDetail> {
    boolean saveAll(List<OrderDetail> orderDetailList);
}
