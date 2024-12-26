package com.example.milkteaweb.dao.impl;

import com.example.milkteaweb.dao.ProductDao;
import com.example.milkteaweb.entity.Product;
import com.example.milkteaweb.mapper.impl.ProductMapper;
import com.mysql.cj.util.StringUtils;

import java.util.List;

public class ProductDaoImpl extends BaseDao<Product> implements ProductDao {

    @Override
    public List<Product> findAll() {
        String sql = "SELECT * FROM product";
        ProductMapper productMapper = new ProductMapper();
        return super.query(sql, productMapper);
    }

    @Override
    public List<Product> findByCategory(int category) {
        return null;
    }

    @Override
    public List<Product> find(String keySearch) {
        String sql = "select * from product ";
        if (!StringUtils.isNullOrEmpty(keySearch)) {
            sql += " where name like '%" + keySearch + "%'";
        }

        ProductMapper productMapper = new ProductMapper();

        return super.query(sql, productMapper);
    }
}
