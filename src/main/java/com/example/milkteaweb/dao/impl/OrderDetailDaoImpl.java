package com.example.milkteaweb.dao.impl;

import com.example.milkteaweb.dao.OrderDetailDao;
import com.example.milkteaweb.entity.OrderDetail;

import java.util.List;

public class OrderDetailDaoImpl extends BaseDao<OrderDetail> implements OrderDetailDao {

    @Override
    public boolean saveAll(List<OrderDetail> orderDetailList) {
        orderDetailList.forEach(orderDetail -> {
            String sql = "insert into order_detail(product_id, category_id, quantity, order_id) values (?,?,?,?)";
            super.insert(sql, orderDetail.getProductId(), orderDetail.getCategoryId(), orderDetail.getQuantity(), orderDetail.getOrderId());
        });

        return true;
    }
}
