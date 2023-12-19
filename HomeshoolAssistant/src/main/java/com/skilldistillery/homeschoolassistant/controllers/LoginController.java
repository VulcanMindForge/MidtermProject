package com.skilldistillery.homeschoolassistant.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.homeschoolassistant.data.UserDAO;
import com.skilldistillery.homeschoolassistant.entities.Assignment;
import com.skilldistillery.homeschoolassistant.entities.LessonPlan;
import com.skilldistillery.homeschoolassistant.entities.Student;
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
			return "account";
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
			List<Student> studentList = userDAO.getStudentsByTeacherId(sessionUser.getId());
			List<User> students = new ArrayList<>();
			for (Student student : studentList) {
				students.add(userDAO.findById(student.getId()));
			}
			List<Assignment> assignments = userDAO.getAssignmentsByStudentId(sessionUser.getId());
			List<LessonPlan> plans = userDAO.getLessonPlansByUserId(sessionUser.getId());
			List<User> users = userDAO.getAllUsers();
			model.addAttribute("students", students);
			model.addAttribute("assignments", assignments);
			model.addAttribute("users", users);
			model.addAttribute("plans", plans);
			return "account";
		}
		if (user != null) {
			loginSuccessful = true;
			List<Assignment> assignments = userDAO.getAssignmentsByStudentId(user.getId());
			List<Student> studentList = userDAO.getStudentsByTeacherId(user.getId());
			List<User> students = new ArrayList<>();
			for (Student student : studentList) {
				students.add(userDAO.findById(student.getId()));
			}
			List<LessonPlan> plans = userDAO.getLessonPlansByUserId(user.getId());
			List<User> users = userDAO.getAllUsers();
			model.addAttribute("students", students);
			model.addAttribute("assignments", assignments);
			model.addAttribute("plans", plans);
			session.setAttribute("login", loginSuccessful);
			session.setAttribute("user", user);
			model.addAttribute("users", users);
			return "account";
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
