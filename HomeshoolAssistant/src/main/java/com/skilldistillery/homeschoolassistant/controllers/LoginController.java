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
public class LoginController {

	@Autowired
	private UserDAO userDAO;

	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public String loginView(HttpSession session) {
		User sessionUser = (User) session.getAttribute("user");
		if (sessionUser != null) {
			return "profile";
		}
		return "sign-in";
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String loginAction(@RequestParam("username") String name, @RequestParam("password") String password,
			Model model, HttpSession session) {
		User user = userDAO.authenticateUser(name, password);
		Boolean loginSuccessful = false;
		User sessionUser = (User) session.getAttribute("user");
		if (sessionUser != null) {
			return "profile";
		}
		if (user != null) {
			loginSuccessful = true;
			session.setAttribute("login", loginSuccessful);
			session.setAttribute("user", user);
			return "profile";
		} else {
			session.setAttribute("login", loginSuccessful);
			return "sign-in";
		}
	}

	@RequestMapping(path = "logout.do", method = RequestMethod.GET)
	public String logoutAction(Model model, HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("login");
		return "home";
	}
}
