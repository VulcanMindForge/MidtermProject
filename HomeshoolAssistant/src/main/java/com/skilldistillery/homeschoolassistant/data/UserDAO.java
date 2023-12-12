package com.skilldistillery.homeschoolassistant.data;

import com.skilldistillery.homeschoolassistant.entities.Teacher;
import com.skilldistillery.homeschoolassistant.entities.User;

public interface UserDAO {
	
	User registerUser(User user);
	User authenticateUser(String username, String password);
	User updateUser(int userId, User user);
	boolean removeUser(int userId);
	Teacher addTeacher(User user);
}
