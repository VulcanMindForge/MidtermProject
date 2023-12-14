package com.skilldistillery.homeschoolassistant.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.homeschoolassistant.entities.Assignment;
import com.skilldistillery.homeschoolassistant.entities.GradeLevel;
import com.skilldistillery.homeschoolassistant.entities.LessonPlan;
import com.skilldistillery.homeschoolassistant.entities.Resource;
import com.skilldistillery.homeschoolassistant.entities.Standard;
import com.skilldistillery.homeschoolassistant.entities.Student;
import com.skilldistillery.homeschoolassistant.entities.Subject;
import com.skilldistillery.homeschoolassistant.entities.Teacher;
import com.skilldistillery.homeschoolassistant.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class AssignmentDaoImpl implements AssignmentDAO {
	
	@PersistenceContext
	EntityManager em;

	@Override
	public Resource addResource(Resource resource) {
		em.persist(resource);
		em.flush();		
		return resource;
	}

	@Override
	public Resource modifyResource(int resourceId, Resource resource) {
		Resource resToUpdate = em.find(Resource.class, resourceId);
		resToUpdate.setTitle(resource.getTitle());
		resToUpdate.setUrl(resource.getUrl());
		resToUpdate.setStandards(resource.getStandards());
		resToUpdate.setAssignments(resource.getAssignments());
		return resToUpdate;
	}

	@Override
	public Boolean removeResourece(int resourceId) {
		Resource resToRemove = em.find(Resource.class, resourceId);
		if (resToRemove != null) {
			em.remove(resToRemove);
			return true;
		}
		return false;
	}

	@Override
	public Assignment addAssignment(Assignment assignment) {
		em.persist(assignment);
		em.flush();		
		return assignment;
	}

	@Override
	public Assignment modifyAssignment(int assignmentId, Assignment assignment) {
		Assignment assToModify = em.find(Assignment.class, assignmentId);
		assToModify.setTitle(assignment.getTitle());
		assToModify.setDescription(assignment.getDescription());
		assToModify.setDuedate(assignment.getDuedate());
		assToModify.setStudent(assignment.getStudent());
		assToModify.setGrade(assignment.getGrade());
		assToModify.setCompleted(assignment.isCompleted());
		return assToModify;
	}

	@Override
	public Boolean removeAssignment(int assignmentId) {
		Assignment assToRemove = em.find(Assignment.class, assignmentId);
		if (assToRemove != null) {
			em.remove(assToRemove);
			return true;
		}
		return false;
	}

	@Override
	public LessonPlan addLessonPlan(LessonPlan lessonPlan) {
		System.out.println(lessonPlan.getTeacher());
		em.persist(lessonPlan);
		em.flush();		
		return lessonPlan;
	}

	@Override
	public LessonPlan modifyLessonPlan(int lessonPlanId, LessonPlan lessonPlan) {
		LessonPlan planToModify = em.find(LessonPlan.class, lessonPlanId);
		planToModify.setTitle(lessonPlan.getTitle());
		planToModify.setDescription(lessonPlan.getDescription());
		planToModify.setShared(lessonPlan.isShared());
		planToModify.setAssignments(lessonPlan.getAssignments());
		planToModify.setTeacher(lessonPlan.getTeacher());		
		return planToModify;
	}

	@Override
	public Boolean removeLessonPlan(int lessonPlanId) {
		LessonPlan planToRemove = em.find(LessonPlan.class, lessonPlanId);
		if (planToRemove != null) {
			em.remove(planToRemove);
			return true;
		}
		return false;
	}
	
	

	@Override
	public Standard addStandard(Standard standard) {
		em.persist(standard);
		em.flush();
		return standard;
	}

	@Override
	public Standard modifyStandard(int standardId, Standard standard) {
		Standard standardToModify = em.find(Standard.class, standardId);
		standardToModify.setStandardYear(standard.getStandardYear());
		standardToModify.setState(standard.getState());
		standardToModify.setUrl(standard.getUrl());
		standardToModify.setDescription(standard.getDescription());
		standardToModify.setGradeLevel(standard.getGradeLevel());
		standardToModify.setSubject(standard.getSubject());
		standardToModify.setResources(standard.getResources());
		return standardToModify;
	}

	@Override
	public Boolean removeStandard(int standardId) {
		Standard standardToRemove = em.find(Standard.class, standardId);
		if (standardToRemove != null) {
			em.remove(standardToRemove);
			return true;
		}
		return false;
	}

	@Override
	public LessonPlan getLessonPlan(int lessonPlanId) {
		return em.find(LessonPlan.class, lessonPlanId);	
	}
	
	@Override
	public Teacher getTeacherById(int userId) {
		return em.find(Teacher.class, userId);	
	}
	
	@Override
	public Student getStudentById(int userId) {
		return em.find(Student.class, userId);	
	}
	
	@Override
	public Resource getResourceById(int resourceId) {
		return em.find(Resource.class, resourceId);	
	}

	@Override
	public Standard getStandardById(int standardId) {
		return em.find(Standard.class, standardId);	
	}

	@Override
	public User getUserById(int userId) {
		return em.find(User.class, userId);	
	}
	
	@Override
	public GradeLevel getGradeByName(String grade) {
		String sql = "SELECT gl From GradeLevel gl WHERE name = :grade";
		return em.createQuery(sql, GradeLevel.class).setParameter("grade", grade).getSingleResult();	
	}
	
	@Override
	public Subject getSubjectByName(String subject) {
		String sql = "SELECT sub From Subject sub WHERE title = :subject";
		return em.createQuery(sql, Subject.class).setParameter("subject", subject).getSingleResult();	
	}

	
	
	@Override
	public List<GradeLevel> getAllGrades() {
		String sql = "Select grade From GradeLevel grade";
		return em.createQuery(sql, GradeLevel.class).getResultList();
	}

	@Override
	public List<Subject> getAllSubjects() {
		String sql = "Select subject From Subject subject";
		return em.createQuery(sql, Subject.class).getResultList();
	}

	@Override
	public List<Student> getAllStudents() {
		String sql = "Select student From Student student";
		return em.createQuery(sql, Student.class).getResultList();
	}


	@Override
	public List<Assignment> listAssignments(int userId) {

		String jpql = "SELECT a FROM Assignment a WHERE a.student.id = :id";

		List<Assignment> assignments = em.createQuery(jpql, Assignment.class).setParameter("id", userId).getResultList();

		return assignments;
	}

	

	@Override
	public List<Assignment> getAssignmentsByPlanId(int planId) {
		String sql = "Select plan FROM LessonPlan plan WHERE id = :planId";
		LessonPlan plan = em.createQuery(sql, LessonPlan.class).setParameter("planId", planId).getSingleResult();
		sql = "Select assignment From Assignment assignment WHERE lessonPlan = :plan";
		return em.createQuery(sql, Assignment.class).setParameter("plan", plan).getResultList();
	}

	@Override
	public List<Standard> getAllStandards() {
		String sql = "Select standard From Standard standard";
		return em.createQuery(sql, Standard.class).getResultList();
	}

	@Override
	public List<Resource> getAllResources() {
		String sql = "Select resource From Resource resource";
		return em.createQuery(sql, Resource.class).getResultList();
	}

	@Override
	public List<Student> getStudentsByTeacherId(int userId) {
		String sql = "SELECT user FROM User user WHERE id = :userId";
		User parent = em.createQuery(sql, User.class).setParameter("userId", userId).getSingleResult();
		sql = "Select student From Student student where parent = :parentId";
		return em.createQuery(sql, Student.class).setParameter("parentId", parent).getResultList();
	}

	@Override
	public LessonPlan getLessonPlanById(int planId) {
		String sql = "SELECT plan FROM LessonPlan plan WHERE id = :planId";
		return em.createQuery(sql, LessonPlan.class).setParameter("planId", planId).getSingleResult();
	}
	
}
