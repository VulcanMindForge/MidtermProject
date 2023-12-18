package com.skilldistillery.homeschoolassistant.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.homeschoolassistant.data.UserDAO;
import com.skilldistillery.homeschoolassistant.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		return "home";
	}

	@RequestMapping(path = "register.do", method = RequestMethod.GET)
	public String registerView(Model model) {
		return "register";
	}

	@RequestMapping(path = "register.do", method = RequestMethod.POST)
	public String registerActopm(@RequestParam(name = "firstName") String firstName,
			@RequestParam(name = "lastName") String lastName, @RequestParam(name = "username") String username,
			@RequestParam(name = "password") String password, Model model) {
		User user = new User();
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setUsername(username);
		user.setPassword(password);
		user.setEnabled(true);
		user.setRole("Teacher");
		User newUser = userDAO.registerUser(user);
		userDAO.addTeacher(newUser);
		model.addAttribute("user", newUser);
		return "sign-in";
	}
}
