package com.skilldistillery.homeschoolassistant.data;

import java.util.List;

import com.skilldistillery.homeschoolassistant.entities.Assignment;

public interface AssignmentDAO {

	List<Assignment> listAssignments(int userId);
}
