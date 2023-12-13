package com.skilldistillery.homeschoolassistant.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.homeschoolassistant.data.AssignmentDAO;

@Controller
public class StudentController {
	
	@Autowired
	private AssignmentDAO assignDao;
	
	@RequestMapping(path = "assignment.do" )
	public String home(@RequestParam(name = "userId") int userId,Model model) {
		model.addAttribute("assignments", assignDao.listAssignments(userId));
		return "assignmentView";
	}

}
