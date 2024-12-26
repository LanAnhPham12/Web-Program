package com.example.milkteaweb.dao.impl;

import com.example.milkteaweb.dao.UserDao;
import com.example.milkteaweb.entity.User;
import com.example.milkteaweb.mapper.impl.UserMapper;
import com.example.milkteaweb.util.MySqlHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

public class UserDaoImpl extends BaseDao<User> implements UserDao {
    private final UserMapper mapper = new UserMapper();

    @Override
    public List<User> findAll() {
        String sql = "SELECT * FROM user";
        return super.query(sql, mapper);
    }

    @Override
    public Boolean insert(User user) {
        String sql = "INSERT INTO user(first_name, last_name, email, username, password, phone) VALUES (?,?,?,?,?,?)";
        return super.insert(sql, user.getFirstName(), user.getLastName(), user.getEmail(), user.getUsername(), user.getPassword(), user.getPhone());
    }

    @Override
    public Optional<User> login(String username, String password) {
        String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
        return super.query(sql, mapper, username, password).stream().findFirst();
    }

    @Override
    public Optional<User> findById(Long id) {
        User user = null;
        String sql = "SELECT * FROM user WHERE id = ?";
        return super.query(sql, mapper, id).stream().findFirst();
    }
}
