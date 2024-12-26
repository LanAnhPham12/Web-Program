package com.example.milkteaweb.dao;

import com.example.milkteaweb.dao.Dao;
import com.example.milkteaweb.entity.User;
import com.example.milkteaweb.util.MySqlHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

public interface UserDao extends Dao<User> {
    List<User> findAll();

    Optional<User> findById(Long id);

    Optional<User> login(String username, String password);

    Boolean insert(User user);
}
