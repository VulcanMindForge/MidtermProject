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

class TeacherTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Teacher teacher;

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
		teacher = em.find(Teacher.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		teacher = null;
	}

	@Test
	void test_teacher_email() {
		assertNotNull(teacher);
		assertEquals("teacher1@mail.com", teacher.getEmail());
	}
	


}
