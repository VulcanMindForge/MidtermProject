package com.skilldistillery.homeschoolassistant.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.homeschoolassistant.entities.Assignment;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class AssignmentDaoImpl implements AssignmentDAO {

	@PersistenceContext
	EntityManager em;

	@Override
	public List<Assignment> listAssignments(int userId) {

		String jpql = "SELECT a FROM Assignment a WHERE a.student.id = :id";

		List<Assignment> assignments = em.createQuery(jpql, Assignment.class).setParameter("id", userId).getResultList();

		return assignments;
	}

}
