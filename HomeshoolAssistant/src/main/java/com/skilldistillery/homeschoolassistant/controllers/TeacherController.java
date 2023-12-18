package com.skilldistillery.homeschoolassistant.controllers;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
import com.skilldistillery.homeschoolassistant.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class TeacherController {

	@Autowired
	private AssignmentDAO assignmentDAO;

	@RequestMapping(path = "lessonPlan.do", method = RequestMethod.GET)
	public String registerView(@RequestParam(name="planId") String planId, Model model, HttpSession session) {
		LessonPlan plan = assignmentDAO.getLessonPlan(Integer.parseInt(planId));
		model.addAttribute("plan", plan);
		return "/teacherviews/view_lessonplan";
	}

	@RequestMapping(path = "addLessonPlan.do", method = RequestMethod.GET)
	public String addLessonPlanView(@RequestParam(name = "userId") String userId, Model model, HttpSession session) {
		List<Resource> resources = assignmentDAO.getAllResources();
		Integer teacherId = Integer.parseInt(userId);
		List<Student> studentList = assignmentDAO.getStudentsByTeacherId(teacherId);
		List<User> students = new ArrayList<>();
		for (Student student : studentList) {
			students.add(assignmentDAO.getUserById(student.getId()));
		}
		model.addAttribute("students", students);
		model.addAttribute("resources", resources);
		return "/teacherviews/add_lessonplan";
	}

	@RequestMapping(path= "addLessonPlan.do", method = RequestMethod.POST)
	public String addLessonPlan(@RequestParam(name="planTitle") String planTitle, @RequestParam(name="planDescription") String planDescription,
			@RequestParam(name="shared") String shared, @RequestParam("assignmentTitle") String assignmentTitle, @RequestParam("assignmentDescription") String assignmentDescription,
			@RequestParam(name="dueDate") String dueDate, @RequestParam("resource") String resource, @RequestParam(name="student") String student,
			@RequestParam(name="userId") String userId, Model model, HttpSession session) {
		LessonPlan plan = new LessonPlan();
		plan.setTitle(planTitle);
		plan.setDescription(planDescription);
		plan.setShared(Boolean.parseBoolean(shared));
		plan.setTeacher(assignmentDAO.getTeacherById(Integer.parseInt(userId)));
		LessonPlan addedPlan = assignmentDAO.addLessonPlan(plan);

		Assignment assignment = new Assignment();
		assignment.setTitle(assignmentTitle);
		assignment.setDescription(assignmentDescription);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate date = LocalDate.parse(dueDate, formatter);
		assignment.setDuedate(date);
		String[] resourceSplit = resource.split(", ");
		assignment.setResource(assignmentDAO.getResourceById(Integer.parseInt(resourceSplit[0])));
		String[] studentSplit = student.split(", ");
		assignment.setStudent(assignmentDAO.getStudentById(Integer.parseInt(studentSplit[0])));
		assignment.setLessonPlan(plan);
				
		Assignment addedAssignment = assignmentDAO.addAssignment(assignment);
		assignment.setLessonPlan(plan);
		
		addedPlan.addAssignment(addedAssignment);
		
		List<Assignment> assignments = assignmentDAO.getAssignmentsByPlanId(addedPlan.getId());
		model.addAttribute("assignments", assignments);
		model.addAttribute("plan", assignmentDAO.getLessonPlan(addedPlan.getId()));
		
		return "/teacherviews/view_lessonplan";
	}
	
	@RequestMapping(path="addAssignment.do", method = RequestMethod.GET)
	public String addAssignmentView (@RequestParam(name="planId") String planId, @RequestParam(name="userId") String userId, Model model, HttpSession session) {
		List<Resource> resources = assignmentDAO.getAllResources();
		Integer teacherId = Integer.parseInt(userId);
		List<Student> studentList = assignmentDAO.getStudentsByTeacherId(teacherId);
		List<User> students = new ArrayList<>();
		for (Student student : studentList) {
			students.add(assignmentDAO.getUserById(student.getId()));
		}
		
		model.addAttribute("students", students);
		model.addAttribute("resources", resources);
		model.addAttribute("plan", assignmentDAO.getLessonPlanById(Integer.parseInt(planId)));
		return "/teacherviews/add_assignment";
	}
	
	
	@RequestMapping(path="addAssignment.do", method = RequestMethod.POST)
	public String addAssignmentToPlan (@RequestParam(name="planId") String planId, @RequestParam("assignmentTitle") String assignmentTitle, @RequestParam("assignmentDescription") String assignmentDescription,
			@RequestParam(name="dueDate") String dueDate, @RequestParam("resource") String resource, @RequestParam(name="student") String student,Model model, HttpSession session) {
		LessonPlan plan = assignmentDAO.getLessonPlan(Integer.parseInt(planId));
		
		Assignment assignment = new Assignment();
		assignment.setLessonPlan(plan);
		assignment.setTitle(assignmentTitle);
		assignment.setDescription(assignmentDescription);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate date = LocalDate.parse(dueDate, formatter);
		assignment.setDuedate(date);
		String[] resourceSplit = resource.split(", ");
		assignment.setResource(assignmentDAO.getResourceById(Integer.parseInt(resourceSplit[0])));
		String[] studentSplit = student.split(", ");
		assignment.setStudent(assignmentDAO.getStudentById(Integer.parseInt(studentSplit[0])));
		Assignment addedAssignment = assignmentDAO.addAssignment(assignment);
		plan.addAssignment(addedAssignment);
		
		model.addAttribute("plan", plan);
		return "/teacherviews/view_lessonplan";
	}
	
	@RequestMapping(path = "removeAssignment.do", method = RequestMethod.GET)
	public String removeAssignmentFromLessonPlan(@RequestParam(name = "planId") String planId, @RequestParam(name = "userId") String userId, Model model, HttpSession session) {
		List<Assignment> assignments = assignmentDAO.getAssignmentsByPlanId(Integer.parseInt(planId));
		model.addAttribute("assignments", assignments);
		return "teacherviews/remove_assignment";
	}

	@RequestMapping(path = "removeAssignment.do", method = RequestMethod.POST)
	public String removeAssignmentByLessonPlanId(@RequestParam(name = "planId") String planId, @RequestParam(name = "assignmentId") String assignmentId, @RequestParam(name = "userId") String userId, Model model, HttpSession session) {
		boolean removed = assignmentDAO.removeAssignment(Integer.parseInt(assignmentId));
		model.addAttribute("removed", removed);
		List<Assignment> assignments = assignmentDAO.getAssignmentsByPlanId(Integer.parseInt(planId));
		model.addAttribute("assignments", assignments);
		return "teacherviews/remove_assignment";
	}
	
	@RequestMapping(path = "resourceAdd.do", method = RequestMethod.GET)
	public String addResourceView(Model model, HttpSession session) {
		List<Standard> standards = assignmentDAO.getAllStandards();
		model.addAttribute("standards", standards);
		return "/teacherviews/add_resource";
	}

	@RequestMapping(path = "resourceAdd.do", method = RequestMethod.POST)
	public String addResourceAction(@RequestParam(name = "title") String title, @RequestParam(name = "url") String url,
			@RequestParam(name = "userId") String userId,
			@RequestParam(name = "standard", required = false) String standard, Model model, HttpSession session) {
		Resource resource = new Resource();

		resource.setTitle(title);
		resource.setUrl(url);
		resource.setUser(assignmentDAO.getUserById(Integer.parseInt(userId)));
		String [] standards = standard.split(", ");
		resource.addStandard(assignmentDAO.getStandardById(Integer.parseInt(standards[0])));

		Resource newResource = assignmentDAO.addResource(resource);
		model.addAttribute("resource", newResource);

		return "view_resource";
	}
	
	@RequestMapping(path = "viewResource.do", method = RequestMethod.GET)
	public String viewResource(@RequestParam(name = "resourceId") String resourcId, Model model, HttpSession session) {
		Resource resource = assignmentDAO.getResourceById(Integer.parseInt(resourcId));
		model.addAttribute("resource", resource);
		return "view_resource";
	}

	@RequestMapping(path = "standardAdd.do", method = RequestMethod.GET)
	public String addStandardView(Model model, HttpSession session) {
		List<GradeLevel> grades = assignmentDAO.getAllGrades();
		List<Subject> subjects = assignmentDAO.getAllSubjects();
		model.addAttribute("grades", grades);
		model.addAttribute("subjects", subjects);
		return "/teacherviews/add_standard";
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
		return "view_standard";
	}

}
