package com.example.milkteaweb.mapper.impl;

import com.example.milkteaweb.entity.Product;
import com.example.milkteaweb.mapper.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductMapper implements RowMapper<Product> {

    @Override
    public Product mapRow(ResultSet rs) {
        Product product = new Product();
        try{
            product.setId(rs.getInt("id"));
            product.setCategoryId(rs.getInt("category_id"));
            product.setName(rs.getString("name"));
            product.setImage(rs.getString("image"));
            product.setPrice(rs.getBigDecimal("price"));
            product.setDescription(rs.getString("description"));

            return product;
        }catch (SQLException e){
            return null;
        }
    }
}
