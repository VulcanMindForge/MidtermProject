package com.skilldistillery.homeschoolassistant.data;

import java.util.List;

import com.skilldistillery.homeschoolassistant.entities.GradeLevel;
import com.skilldistillery.homeschoolassistant.entities.Student;
import com.skilldistillery.homeschoolassistant.entities.Teacher;
import com.skilldistillery.homeschoolassistant.entities.User;

public interface UserDAO {
	
	User registerUser(User user);
	User authenticateUser(String username, String password);
	User updateUser(int userId, User user);
	User findById(int userId);
	List<User> findAll();
	boolean removeUser(int userId);
	Teacher addTeacher(User user);
	Teacher findTeacherById(int teacherId);
	GradeLevel findGradeLevelById(int gradeId);
	Student addStudent(User user, String gradeLevel, int teacherId);
}
