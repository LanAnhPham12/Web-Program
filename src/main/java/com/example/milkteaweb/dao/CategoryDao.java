package com.example.milkteaweb.dao;

import com.example.milkteaweb.entity.Category;

import java.util.List;

public interface CategoryDao extends Dao<Category> {
    List<Category> findAll();
}
