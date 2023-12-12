package com.skilldistillery.homeschoolassistant.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.homeschoolassistant.entities.Assignment;
import com.skilldistillery.homeschoolassistant.entities.LessonPlan;
import com.skilldistillery.homeschoolassistant.entities.Resource;
import com.skilldistillery.homeschoolassistant.entities.Teacher;

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
	public LessonPlan getLessonPlan(int lessonPlanId) {
		return em.find(LessonPlan.class, lessonPlanId);	
	}
	
	@Override
	public Teacher getTeacherById(int userId) {
		return em.find(Teacher.class, userId);	
	}
	
	
}