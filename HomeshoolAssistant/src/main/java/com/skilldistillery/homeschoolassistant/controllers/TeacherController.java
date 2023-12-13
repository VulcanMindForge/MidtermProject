package com.skilldistillery.homeschoolassistant.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.homeschoolassistant.data.AssignmentDAO;
import com.skilldistillery.homeschoolassistant.entities.GradeLevel;
import com.skilldistillery.homeschoolassistant.entities.LessonPlan;
import com.skilldistillery.homeschoolassistant.entities.Resource;
import com.skilldistillery.homeschoolassistant.entities.Standard;
import com.skilldistillery.homeschoolassistant.entities.Subject;
import com.skilldistillery.homeschoolassistant.entities.Teacher;

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

	@RequestMapping(path = "resourceAdd.do", method = RequestMethod.GET)
	public String addResourceView(Model model, HttpSession session) {
		List<Standard> standards = assignmentDAO.getAllStandards();
		model.addAttribute("standards", standards);
		return "/teacherviews/resourceedit";
	}

	@RequestMapping(path = "standardAdd.do", method = RequestMethod.GET)
	public String addStandardView(Model model, HttpSession session) {
		List<GradeLevel> grades = assignmentDAO.getAllGrades();
		List<Subject> subjects = assignmentDAO.getAllSubjects();
		model.addAttribute("grades", grades);
		model.addAttribute("subjects", subjects);
		return "/teacherviews/standardedit";
	}

	@RequestMapping(path = "lessonPlanAdd.do", method = RequestMethod.POST)
	public String addLessonPlanAction(@RequestParam(name = "title") String title,
			@RequestParam(name = "description") String description, @RequestParam(name = "shared") String shared,
			@RequestParam(name = "teacher") int userId, Model model, HttpSession session) {
		LessonPlan plan = new LessonPlan();

		plan.setTitle(title);
		plan.setDescription(description);
		plan.setShared(Boolean.parseBoolean(shared));
		Teacher teacher = assignmentDAO.getTeacherById(2);
		plan.setTeacher(teacher);
		LessonPlan addedPlan = assignmentDAO.addLessonPlan(plan);
		model.addAttribute("lessonPlan", addedPlan);
		return "/teacherviews/lessonplan";
	}

	@RequestMapping(path = "resourceAdd.do", method = RequestMethod.POST)
	public String addResourceAction(@RequestParam(name = "title") String title, @RequestParam(name = "url") String url,
			@RequestParam(name = "userId") String userId, @RequestParam(name="standards", required = false) String[] standards, Model model, HttpSession session) {
		Resource resource = new Resource();
		List<Standard> standardList = new ArrayList<>();
		for (String string : standards) {
			if (string.equals("on")) {
				standardList.add(assignmentDAO.getStandardById(Integer.parseInt(string)));
			}
		}
		resource.setTitle(title);
		resource.setUrl(url);
		resource.setUser(assignmentDAO.getUserById(Integer.parseInt(userId)));
		resource.setStandards(standardList);
		
		Resource newResource = assignmentDAO.addResource(resource);
		model.addAttribute("resource", newResource);

		return "resourceview";
	}

	@RequestMapping(path = "standardAdd.do", method = RequestMethod.POST)
	public String addStandardAction(@RequestParam(name = "year") String year, @RequestParam(name = "state") String state,
			@RequestParam(name = "url") String url,
			@RequestParam(name = "description") String description, @RequestParam(name = "grade") String grade,
			@RequestParam(name = "subject") String subject, Model model, HttpSession session) {
		Standard standard = new Standard();

		standard.setStandardYear(Integer.parseInt(year));
		standard.setState(state);
		standard.setUrl(url);
		standard.setDescription(description);
		standard.setGradeLevel(assignmentDAO.getGradeByName(grade));
		standard.setSubject(assignmentDAO.getSubjectByName(subject));
		Standard newStandard = assignmentDAO.addStandard(standard);
		
		model.addAttribute("standard", newStandard);
		return "standardview";
	}

}
