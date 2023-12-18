package com.skilldistillery.homeschoolassistant.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.homeschoolassistant.entities.GradeLevel;
import com.skilldistillery.homeschoolassistant.entities.LessonPlan;
import com.skilldistillery.homeschoolassistant.entities.Student;
import com.skilldistillery.homeschoolassistant.entities.Teacher;
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
			System.err.println("Invalid user: " + username);
		}

		return user;
	}

	@Override
	public User registerUser(User user) {
		//
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
	public Teacher findTeacherById(int teacherId) {
		return em.find(Teacher.class, teacherId);
	}

	@Override
	public GradeLevel findGradeLevelById(int gradeId) {
		return em.find(GradeLevel.class, gradeId);
	}

	@Override
	public List<User> findAll() {
		String jpql = "SELECT u FROM User u";

		List<User> users = em.createQuery(jpql, User.class).getResultList();

		return users;
	}
	@Override
	public List<LessonPlan> getLessonPlansByUserId(int userId) {
		String jpql = "SELECT plan FROM LessonPlan plan where teacher = :userId";
		
		List<LessonPlan> plans = em.createQuery(jpql, LessonPlan.class).setParameter("userId", getTeacherById(userId)).getResultList();
		
		return plans;
	}
	
	@Override
	public List<User> getAllUsers() {
		String sql = "SELECT user FROM User user";
		return em.createQuery(sql, User.class).getResultList();
	}
	
	public Teacher getTeacherById(int userId) {
		return em.find(Teacher.class, userId);
	}

	@Override
	public Teacher addTeacher(User user) {
		Teacher teacher = new Teacher();
		teacher.setEmail(user.getFirstName() + "@" + user.getLastName() + ".com");
		teacher.setId(user.getId());
		em.persist(teacher);
		em.flush();
		return teacher;
	}

	@Override
	public Student addStudent(User user, String gradeLevel, int teacherId) {
		Student student = new Student();
		student.setId(user.getId());
		student.setGradeLevel(findGradeLevelById(Integer.parseInt(gradeLevel)));
		student.setParent(findById(teacherId));
		em.persist(student);
		em.flush();
		return student;
	}
	
	@Override
	public List<Student> getStudentsByTeacherId(int userId) {
		String sql = "SELECT user FROM User user WHERE id = :userId";
		User parent = em.createQuery(sql, User.class).setParameter("userId", userId).getSingleResult();
		sql = "Select student From Student student where parent = :parent";
		return em.createQuery(sql, Student.class).setParameter("parent", parent).getResultList();
	}
}
