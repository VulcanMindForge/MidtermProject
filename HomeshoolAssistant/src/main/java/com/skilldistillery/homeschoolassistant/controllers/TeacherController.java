package com.skilldistillery.homeschoolassistant.controllers;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.homeschoolassistant.data.AssignmentDAO;
import com.skilldistillery.homeschoolassistant.entities.Assignment;
import com.skilldistillery.homeschoolassistant.entities.GradeLevel;
import com.skilldistillery.homeschoolassistant.entities.LessonPlan;
import com.skilldistillery.homeschoolassistant.entities.Resource;
import com.skilldistillery.homeschoolassistant.entities.Standard;
import com.skilldistillery.homeschoolassistant.entities.Student;
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
	public String addLessonPlanView(@RequestParam(name = "userId") String userId, Model model, HttpSession session) {
		List<Resource> resources = assignmentDAO.getAllResources();
		Integer teacherId = Integer.parseInt(userId);
		List<Student> students = assignmentDAO.getStudentsByTeacherId(teacherId);
		model.addAttribute("students", students);
		model.addAttribute("resources", resources);
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
	public String addLessonPlanAction(@RequestParam(name = "planTitle") String title,
			@RequestParam(name = "planDescription") String description, @RequestParam(name = "shared") String shared,
			@RequestParam(name = "teacher") String userId,
			@RequestParam(name = "assignmentTitle") String assignmentTitle,
			@RequestParam(name = "assignmentDescription") String assignmentDescription,
			@RequestParam(name = "dueDate") String dueDate, @RequestParam(name = "resource") String resourceId,
			@RequestParam(name = "student") String studentId,
			@RequestParam(name = "planId", required = false) String planId, @RequestParam(name = "finished", required = false) String finished, Model model, HttpSession session) {
		List<Resource> resources = assignmentDAO.getAllResources();
		Integer teacherId = Integer.parseInt(userId);
		List<Student> students = assignmentDAO.getStudentsByTeacherId(teacherId);
		if (planId != null) {
			List<Assignment> assignments = assignmentDAO.getAssignmentsByPlanId(Integer.parseInt(planId));
			model.addAttribute("assignments", assignments);
		}
		model.addAttribute("students", students);
		model.addAttribute("resources", resources);

			LessonPlan plan = new LessonPlan();
			LessonPlan addedPlan = new LessonPlan();
			plan.setTitle(title);
			plan.setDescription(description);
			plan.setShared(Boolean.parseBoolean(shared));
			Teacher teacher = assignmentDAO.getTeacherById(Integer.parseInt(userId));
			plan.setTeacher(teacher);
		if (planId == null) {
			addedPlan = assignmentDAO.addLessonPlan(plan);
		} else {
			addedPlan = assignmentDAO.modifyLessonPlan(Integer.parseInt(planId), plan);
		}
		Assignment assignment = new Assignment();
		assignment.setTitle(assignmentTitle);
		assignment.setDescription(assignmentDescription);
		assignment.setLessonPlan(addedPlan);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate due = LocalDate.parse(dueDate, formatter);
		assignment.setDuedate(due);
		if (studentId != null) {
			assignment.setStudent(assignmentDAO.getStudentById(Integer.parseInt(studentId)));
		}
		assignment.setResource(assignmentDAO.getResourceById(Integer.parseInt(resourceId)));
		Assignment addedAssignment = assignmentDAO.addAssignment(assignment);
		addedPlan.addAssignment(addedAssignment);
		model.addAttribute("lessonPlan", addedPlan);
		if (finished == null) {			
			return "/teacherviews/lessonplanedit";
		} else {
			return "teacherviews/lessonplan";
		}
	}

	@RequestMapping(path = "resourceAdd.do", method = RequestMethod.POST)
	public String addResourceAction(@RequestParam(name = "title") String title, @RequestParam(name = "url") String url,
			@RequestParam(name = "userId") String userId,
			@RequestParam(name = "standards", required = false) String standard, Model model, HttpSession session) {
		Resource resource = new Resource();

		resource.setTitle(title);
		resource.setUrl(url);
		resource.setUser(assignmentDAO.getUserById(Integer.parseInt(userId)));
		resource.addStandard(assignmentDAO.getStandardById(Integer.parseInt(standard)));

		Resource newResource = assignmentDAO.addResource(resource);
		model.addAttribute("resource", newResource);

		return "resourceview";
	}

	@RequestMapping(path = "standardAdd.do", method = RequestMethod.POST)
	public String addStandardAction(@RequestParam(name = "year") String year,
			@RequestParam(name = "state") String state, @RequestParam(name = "url") String url,
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
