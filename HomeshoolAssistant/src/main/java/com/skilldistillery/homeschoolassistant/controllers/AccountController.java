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
import com.skilldistillery.homeschoolassistant.entities.LessonPlan;
import com.skilldistillery.homeschoolassistant.entities.Student;
import com.skilldistillery.homeschoolassistant.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class AccountController {

    @Autowired
    private UserDAO userDAO;

    @RequestMapping(path = "account.do", method = RequestMethod.GET)
    public String accountView(@RequestParam(name="userId") String userId, HttpSession session, Model model) {

    	List<Student> studentList = userDAO.getStudentsByTeacherId(Integer.parseInt(userId));
		List<User> students = new ArrayList<>();
		for (Student student : studentList) {
			students.add(userDAO.findById(student.getId()));
		}
		model.addAttribute("students", students);
		List<LessonPlan> plans = userDAO.getLessonPlansByUserId(Integer.parseInt(userId));
		model.addAttribute("plans", plans);
        return "account";
    }

    @RequestMapping(path = "getAccount.do")
    public String showUser(@RequestParam("userId") Integer userId, Model model) {
        User user = userDAO.findById(userId);
        model.addAttribute("user", user);
        return "profile";
    }

    @RequestMapping(path = "edit_accountForm", method = RequestMethod.GET)
    public String showEditAccountForm(HttpSession session, @RequestParam("userId") Integer userId, Model model) {
        User user = userDAO.findById(userId);
        model.addAttribute("user", user);
        return "account/edit_accountForm";
    }

    @RequestMapping(path = "edit_account.do", method = RequestMethod.POST)
    public String editAccount(HttpSession session, @RequestParam("userId") Integer userId,
            @RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName,
            @RequestParam("username") String username, @RequestParam("password") String password,
            @RequestParam("role") String role) {
        User existingUser = userDAO.findById(userId);

        existingUser.setFirstName(firstName);
        existingUser.setLastName(lastName);
        existingUser.setUsername(username);
        existingUser.setPassword(password);
        existingUser.setRole(role);
        existingUser.setEnabled(false);

        userDAO.updateUser(userId, existingUser);

        return "redirect:account.do";
    }

    @RequestMapping(path = "add_accountForm", method = RequestMethod.GET)
    public String showAddStudentForm(HttpSession session) {
        return "account/add_accountForm";
    }

    @RequestMapping(path = "addAccount.do", method = RequestMethod.POST)
    public String addAccount(HttpSession session, @RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName, @RequestParam("username") String username,
            @RequestParam("password") String password, @RequestParam("role") String role,
            @RequestParam(value = "gradeLevel", required = false) String gradeLevel,
            @RequestParam(value = "teacherId", required = false) Integer teacherId) {

        User newUser = new User();
        newUser.setFirstName(firstName);
        newUser.setLastName(lastName);
        newUser.setUsername(username);
        newUser.setPassword(password);
        newUser.setRole(role);

        if (role.equalsIgnoreCase("student")) {
            newUser.setEnabled(true);
            userDAO.addStudent(newUser, gradeLevel, teacherId);
        } else {
            newUser.setEnabled(true);
            userDAO.addTeacher(newUser);
        }

        userDAO.registerUser(newUser);

        return "redirect:account.do";
    }


    @RequestMapping(path = "removeAccount.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String removeAccount(HttpSession session, @RequestParam("userId") Integer userId) {
        userDAO.removeUser(userId);
        return "redirect:account.do";
    }
}
