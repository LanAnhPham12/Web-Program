package com.example.milkteaweb.mapper.impl;

import com.example.milkteaweb.entity.Category;
import com.example.milkteaweb.mapper.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryMapper implements RowMapper<Category> {

    @Override
    public Category mapRow(ResultSet rs) {
        Category category = new Category();
        try{
            category.setId(rs.getInt("category_id"));
            category.setName(rs.getString("category_name"));
            category.setSymbol(rs.getString("symbol"));

            return category;
        }catch (SQLException e){
            return null;
        }
    }
}
