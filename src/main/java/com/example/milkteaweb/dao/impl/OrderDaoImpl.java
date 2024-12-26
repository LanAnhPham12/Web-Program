package com.example.milkteaweb.dao.impl;

import com.example.milkteaweb.dao.OrderDao;
import com.example.milkteaweb.entity.Orders;

public class OrderDaoImpl extends BaseDao<Orders> implements OrderDao {

    @Override
    public Boolean insert(Orders orders) {
        String sql = "insert into orders(id, address, receiver, total_price, phone, ship_fee) values(?,?,?,?,?,?)";
        return super.insert(sql, orders.getId(), orders.getAddress(), orders.getReceiver(), orders.getTotalPrice(), orders.getPhone(), orders.getShipFee());
    }

}
