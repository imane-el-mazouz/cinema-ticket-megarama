package com.movieticket.dao;

import com.movieticket.model.User;

import java.sql.SQLException;
import java.util.List;

public interface UserDAO {
    void addUser(User user);
    void updateUser(User user);
    void deleteUser(int userId);
    User getUserByUsernameAndPassword(String username, String password);
    User getUserById(int userId);
    List<User> getAllUsers();
}
