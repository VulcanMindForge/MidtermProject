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

class GradeLevelTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private GradeLevel gradeLevel;

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
		gradeLevel = em.find(GradeLevel.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		gradeLevel = null;
	}

	@Test
	void test_name() {
		assertNotNull(gradeLevel);
		assertEquals("mom", gradeLevel.getName());
	}
	
	@Test
	void test_grade_number() {
		assertNotNull(gradeLevel);
		assertEquals("1", gradeLevel.getGradeNumber());
	}

}
