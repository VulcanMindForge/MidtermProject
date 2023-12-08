package com.skilldistillery.homeschoolassistant.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.homeschoolassistant.data.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDAO;
	

}
