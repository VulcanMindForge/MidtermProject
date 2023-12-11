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

class StandardTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Standard standard;

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
		standard = em.find(Standard.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		standard = null;
	}

	@Test
	void test_url() {
		assertNotNull(standard);
		assertEquals("google.com", standard.getUrl());
	}
	
	@Test
	void test_description() {
		assertNotNull(standard);
		assertEquals("math", standard.getDescription());
	}
	
	@Test
	void test_state() {
		assertNotNull(standard);
		assertEquals("CO", standard.getState());
	}
	
	@Test
	void test_standard_year() {
		assertNotNull(standard);
		assertEquals(2013, standard.getStandardYear());
	}

}
