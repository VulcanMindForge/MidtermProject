package com.skilldistillery.homeschoolassistant.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Student {
	
	@Id
	private int id;
	
	@OneToMany(mappedBy = "student")
	private List<Assignment> assignments;
	
	@ManyToOne
	@JoinColumn(name = "grade_level_id")
	private GradeLevel gradeLevel;
	
	@ManyToOne
	@JoinColumn(name = "parent_id")
	private User parent;
	
	@ManyToOne
	@JoinColumn(name = "teacher_id")
	private User teacher;

	public Student() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getParent() {
		return parent;
	}

	public void setParent(User parent) {
		this.parent = parent;
	}
	
	public void addAssignment(Assignment assignment) {
		if (assignments == null) {
			assignments = new ArrayList<>();
		}
		if (!assignments.contains(assignment)) {
			assignments.add(assignment);
			if (assignment.getStudent() != null) {
				assignment.getStudent().removeAssignment(assignment);
			}
			assignment.setStudent(this);
		}
	}
	
	public void removeAssignment(Assignment assignment) {
		if (assignments != null && assignments.contains(assignment)) {
			assignments.remove(assignment);
			assignment.setStudent(null);
		}
	}
	
	public List<Assignment> getAssignments() {
		return assignments;
	}

	public void setAssignments(List<Assignment> assignments) {
		this.assignments = assignments;
	}

	public GradeLevel getGradeLevel() {
		return gradeLevel;
	}

	public void setGradeLevel(GradeLevel gradeLevel) {
		this.gradeLevel = gradeLevel;
	}

	public User getTeacher() {
		return teacher;
	}

	public void setTeacher(User teacher) {
		this.teacher = teacher;
	}

	@Override
	public int hashCode() {
		return Objects.hash(assignments, gradeLevel, id, parent, teacher);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Student other = (Student) obj;
		return Objects.equals(assignments, other.assignments) && Objects.equals(gradeLevel, other.gradeLevel)
				&& id == other.id && Objects.equals(parent, other.parent) && Objects.equals(teacher, other.teacher);
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", gradeLevel=" + gradeLevel + ", parent="
				+ parent + ", teacher=" + teacher + "]";
	}
}
