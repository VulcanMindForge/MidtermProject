package com.skilldistillery.homeschoolassistant.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Teacher {

	@Id
	private int id;

	private String email;

	@OneToMany(mappedBy = "teacher")
	private List<LessonPlan> lessonPlans;

	public Teacher() {
	}

	public void addLessonPlan(LessonPlan lessonPlan) {
		if (lessonPlans == null) {
			lessonPlans = new ArrayList<>();
		}
		if (!lessonPlans.contains(lessonPlan)) {
			lessonPlans.add(lessonPlan);
			if (lessonPlan.getTeacher() != null) {
				lessonPlan.getTeacher().removeLessonPlan(lessonPlan);
			}
			lessonPlan.setTeacher(this);
		}
	}

	public void removeLessonPlan(LessonPlan lessonPlan) {
		if (lessonPlans != null && lessonPlans.contains(lessonPlan)) {
			lessonPlans.remove(lessonPlan);
			lessonPlan.setTeacher(null);
		}
	}

	public List<LessonPlan> getLessonPlans() {
		return lessonPlans;
	}

	public void setLessonPlans(List<LessonPlan> lessonPlans) {
		this.lessonPlans = lessonPlans;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Teacher other = (Teacher) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Teacher [id=" + id + ", email=" + email + "]";
	}

}
