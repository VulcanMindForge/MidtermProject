package com.skilldistillery.homeschoolassistant.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.homeschoolassistant.data.AssignmentDAO;
import com.skilldistillery.homeschoolassistant.entities.Assignment;

import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController {
	
	@Autowired
	private AssignmentDAO assignDao;
	
	@RequestMapping(path = "assignment.do" )
	public String home(@RequestParam(name = "userId") int userId,Model model) {
		model.addAttribute("assignments", assignDao.listAssignments(userId));
		return "view_assignment";
	}
	
	@RequestMapping(path = "viewAssignment.do" )
	public String viewAssignment(@RequestParam(name = "assignmentId") String assignmentId, Model model, HttpSession session) {
		Assignment assignment = assignDao.getAssignmentsById(Integer.parseInt(assignmentId));
		model.addAttribute("assignment", assignment);
		return "view_assignment";
	}
	
	@RequestMapping(path = "completeAssignment.do" )
	public String completeAssignment(@RequestParam(name = "assignmentId") String assignmentId, Model model, HttpSession session) {
		Assignment assignmentBefore = assignDao.getAssignmentsById(Integer.parseInt(assignmentId));
		assignmentBefore.setCompleted(true);
		Assignment assignment = assignDao.modifyAssignment(assignmentBefore.getId(), assignmentBefore);
		model.addAttribute("assignment", assignment);
		return "view_assignment";
	}
	
	@RequestMapping(path = "gradeAssignment.do" )
	public String gradeAssignment(@RequestParam(name = "assignmentId") String assignmentId, @RequestParam(name="assignmentGrade") String assignmentGrade, Model model, HttpSession session) {
		Assignment assignmentBefore = assignDao.getAssignmentsById(Integer.parseInt(assignmentId));
		assignmentBefore.setGrade(Double.parseDouble(assignmentGrade));
		Assignment assignment = assignDao.modifyAssignment(assignmentBefore.getId(), assignmentBefore);
		model.addAttribute("assignment", assignment);
		return "view_assignment";
	}

}
