package com.skilldistillery.homeschoolassistant.entities;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class LessonPlanTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private LessonPlan lessonPlan;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAHomeschoolAssistant");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		lessonPlan = em.find(LessonPlan.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		lessonPlan = null;
	}

	@Test
	void test_description() {
		assertNotNull(lessonPlan);
		assertEquals("still math", lessonPlan.getDescription());
	}
	
	@Test
	void test_title() {
		assertNotNull(lessonPlan);
		assertEquals("how to teach math", lessonPlan.getTitle());
	}

}
