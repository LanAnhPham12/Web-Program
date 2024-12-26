package com.example.milkteaweb.dao.impl;

import com.example.milkteaweb.dao.CategoryDao;
import com.example.milkteaweb.entity.Category;
import com.example.milkteaweb.mapper.impl.CategoryMapper;

import java.util.List;

public class CategoryDaoImpl extends BaseDao<Category> implements CategoryDao {
    @Override
    public List<Category> findAll() {
        String sql = "SELECT * FROM category";
        CategoryMapper categoryMapper = new CategoryMapper();
        return super.query(sql, categoryMapper);
    }
}
