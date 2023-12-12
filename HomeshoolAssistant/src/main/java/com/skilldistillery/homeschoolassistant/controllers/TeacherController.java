package com.skilldistillery.homeschoolassistant.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.homeschoolassistant.data.AssignmentDAO;
import com.skilldistillery.homeschoolassistant.entities.Assignment;
import com.skilldistillery.homeschoolassistant.entities.LessonPlan;
import com.skilldistillery.homeschoolassistant.entities.Teacher;
import com.skilldistillery.homeschoolassistant.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class TeacherController {

	
	@Autowired
	private AssignmentDAO assignmentDAO;
	
	@RequestMapping(path = "lessonPlan.do", method = RequestMethod.GET)
	public String registerView(Model model, HttpSession session) {
		LessonPlan plan = assignmentDAO.getLessonPlan(1);
		model.addAttribute("lessonPlan", plan);
		return "/teacherviews/lessonplan";
	}
	
	@RequestMapping(path = "lessonPlanAdd.do", method = RequestMethod.GET)
	public String addLessonPlanView(Model model, HttpSession session) {
		return "/teacherviews/lessonplanedit";
	}

	@RequestMapping(path = "lessonPlanAdd.do", method = RequestMethod.POST)
	public String addLessonPlanAction(@RequestParam(name = "title") String title,
			@RequestParam(name = "description") String description, @RequestParam(name = "shared") String shared,
			@RequestParam(name = "teacher") int userId, 
			Model model, HttpSession session) {
		LessonPlan plan = new LessonPlan();
		
		plan.setTitle(title);
		plan.setDescription(description);
		plan.setShared(Boolean.parseBoolean(shared));
		Teacher teacher = assignmentDAO.getTeacherById(userId);
		plan.setTeacher(teacher);
		
		LessonPlan addedPlan = assignmentDAO.addLessonPlan(plan);
		model.addAttribute("lessonPlan", addedPlan);
		return "/teacherviews/lessonplan";
	}
}
