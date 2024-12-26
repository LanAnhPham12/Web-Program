package com.example.milkteaweb.mapper.impl;

import com.example.milkteaweb.entity.User;
import com.example.milkteaweb.mapper.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements RowMapper<User> {

    @Override
    public User mapRow(ResultSet resultSet) {
        try {
            User user = new User();
            user.setId(resultSet.getLong("id"));
            user.setFirstName(resultSet.getString("first_name"));
            user.setLastName(resultSet.getString("last_name"));
            user.setEmail(resultSet.getString("email"));
            user.setUsername(resultSet.getString("username"));
            user.setPassword(resultSet.getString("password"));
            return user;
        } catch (SQLException e) {
            return null;
        }
    }
}
