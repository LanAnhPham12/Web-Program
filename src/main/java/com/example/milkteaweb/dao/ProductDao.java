package com.example.milkteaweb.dao;

import com.example.milkteaweb.entity.Product;

import java.util.List;

public interface ProductDao extends Dao<Product> {
    List<Product> findAll();
    List<Product> findByCategory(int category);
    List<Product> find(String keySearch);
}
