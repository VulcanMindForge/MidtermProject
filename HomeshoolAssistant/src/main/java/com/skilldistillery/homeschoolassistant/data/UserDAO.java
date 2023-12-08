package com.skilldistillery.homeschoolassistant.data;

import com.skilldistillery.homeschoolassistant.entities.User;

public interface UserDAO {

	User authenticateUser(String username, String password);
}
