package com.skilldistillery.homeschoolassistant.data;

import java.util.List;

import com.skilldistillery.homeschoolassistant.entities.Assignment;

import com.skilldistillery.homeschoolassistant.entities.GradeLevel;
import com.skilldistillery.homeschoolassistant.entities.LessonPlan;
import com.skilldistillery.homeschoolassistant.entities.Resource;
import com.skilldistillery.homeschoolassistant.entities.Standard;
import com.skilldistillery.homeschoolassistant.entities.Student;
import com.skilldistillery.homeschoolassistant.entities.Subject;
import com.skilldistillery.homeschoolassistant.entities.Teacher;
import com.skilldistillery.homeschoolassistant.entities.User;

public interface AssignmentDAO {
	Resource addResource(Resource resource);
	Resource modifyResource(int resourceId, Resource resource);
	Boolean removeResourece(int resourceId);


	List<Assignment> listAssignments(int userId);

	Standard addStandard(Standard standard);
	Standard modifyStandard(int standardId, Standard standard);
	Boolean removeStandard(int standardId);
	
	Assignment addAssignment(Assignment assignment);
	Assignment modifyAssignment(int assignmentId, Assignment assignment);
	Boolean removeAssignment(int assignmentId);
	
	LessonPlan addLessonPlan(LessonPlan lessonPlan);
	LessonPlan modifyLessonPlan(int lessonPlanId, LessonPlan lessonPlan);
	Boolean removeLessonPlan(int lessonPlanId);
	LessonPlan getLessonPlan(int lessonPlanId);
	Teacher getTeacherById(int userId);
	User getUserById(int userId);
	GradeLevel getGradeByName(String grade);
	Subject getSubjectByName(String subject);
	
	List<GradeLevel> getAllGrades();
	List<Subject> getAllSubjects();
	List<Standard> getAllStandards();
	List<Resource> getAllResources();
	Standard getStandardById(int standardId);
	List<Student> getStudentsByTeacherId(int userId);
	Student getStudentById(int userId);
	Resource getResourceById(int resourceId);
	List<Student> getAllStudents();
	LessonPlan getLessonPlanById(int planId);
	List<Assignment> getAssignmentsByPlanId(int planId);

}
