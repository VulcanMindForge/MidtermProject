package com.skilldistillery.homeschoolassistant.data;

import com.skilldistillery.homeschoolassistant.entities.Assignment;
import com.skilldistillery.homeschoolassistant.entities.LessonPlan;
import com.skilldistillery.homeschoolassistant.entities.Resource;

public interface AssignmentDAO {
	Resource addResource(Resource resource);
	Resource modifyResource(int resourceId, Resource resource);
	Boolean removeResourece(int resourceId);
	
	Assignment addAssignment(Assignment assignment);
	Assignment modifyAssignment(int assignmentId, Assignment assignment);
	Boolean removeAssignment(int assignmentId);
	
	LessonPlan addLessonPlan(LessonPlan lessonPlan);
	LessonPlan modifyLessonPlan(int lessonPlanId, LessonPlan lessonPlan);
	Boolean removeLessonPlan(int lessonPlanId);
}
