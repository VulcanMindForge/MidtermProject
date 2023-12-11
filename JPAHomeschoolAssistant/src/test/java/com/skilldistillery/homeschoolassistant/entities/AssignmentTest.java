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

class AssignmentTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Assignment assignment;

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
		assignment = em.find(Assignment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		assignment = null;
	}

	@Test
	void test_title() {
		assertNotNull(assignment);
		assertEquals("math", assignment.getTitle());
	}
	
	@Test
	void test_isCompleted() {
		assertNotNull(assignment);
		assertEquals(false, assignment.isCompleted());
	}

}
