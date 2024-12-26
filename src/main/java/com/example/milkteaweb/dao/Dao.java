package com.example.milkteaweb.dao;

import com.example.milkteaweb.mapper.RowMapper;

import java.util.List;

public interface Dao<T> {
    List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters);
    Boolean insert(String sql, Object... parameters) throws ClassNotFoundException;
    Boolean update(String sql, Object... parameters);
    Boolean delete(String sql, Object... parameters);
}
