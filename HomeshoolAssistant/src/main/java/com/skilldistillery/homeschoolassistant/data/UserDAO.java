package com.skilldistillery.homeschoolassistant.data;

import java.util.List;

import com.skilldistillery.homeschoolassistant.entities.User;

public interface UserDAO {
	
	User registerUser(User user);
	User authenticateUser(String username, String password);
	User updateUser(int userId, User user);
	User findById(int userId);
	List<User> findAll();
	boolean removeUser(int userId);
}
