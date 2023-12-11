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

class MessageTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Message message;

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
		message = em.find(Message.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		message = null;
	}

	@Test
	void test_message() {
		assertNotNull(message);
		assertEquals("hi", message.getMessage());
	}
	
	@Test
	void test_message_sender() {
		assertNotNull(message);
		assertEquals("doe", message.getSender().getLastName());
	}
	
	@Test
	void test_message_receiver() {
		assertNotNull(message);
		assertEquals("john", message.getReceiver().getFirstName());
	}

}
