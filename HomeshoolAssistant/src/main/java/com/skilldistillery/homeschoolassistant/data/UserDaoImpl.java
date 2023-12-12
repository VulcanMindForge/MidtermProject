package com.skilldistillery.homeschoolassistant.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.homeschoolassistant.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	EntityManager em;

	@Override
	public User authenticateUser(String username, String password) {
		String jpql = "SELECT u FROM User u Where u.username = :un AND u.password = :pw AND u.enabled = true";
		User user = null;

		try {
			user = em.createQuery(jpql, User.class)
					.setParameter("un", username)
					.setParameter("pw", password)
					.getSingleResult();
		} catch (Exception e) {
//			e.printStackTrace();
			System.err.println("Invalid user: " + username);
		}

		return user;
	}

	@Override
	public User registerUser(User user) {
		em.persist(user);
		em.flush();
		
		return user;
	}

	@Override
	public User updateUser(int userId, User user) {
		User userToUpdate = em.find(User.class, userId);
		userToUpdate.setFirstName(user.getFirstName());
		userToUpdate.setLastName(user.getLastName());
		userToUpdate.setUsername(user.getUsername());
		userToUpdate.setPassword(user.getPassword());
		userToUpdate.setRole(user.getRole());
		userToUpdate.setEnabled(user.isEnabled());
		return userToUpdate;
	}

	@Override
	public boolean removeUser(int userId) {
		User userToRemove = em.find(User.class, userId);
		if (userToRemove != null) {
			em.remove(userToRemove);
			return true;
		}
		return false;
	}

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public List<User> findAll() {
		String jpql = "SELECT u FROM User u";

		List<User> users = em.createQuery(jpql, User.class).getResultList();

		return users;
	}
}
