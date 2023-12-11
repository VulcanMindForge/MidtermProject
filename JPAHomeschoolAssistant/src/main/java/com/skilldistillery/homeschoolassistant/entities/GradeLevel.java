package com.skilldistillery.homeschoolassistant.entities;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "grade_level")
public class GradeLevel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name = "grade_number")
	private String gradeNumber;
	
	@OneToMany(mappedBy = "gradeLevel")
	private List<Standard> standards;

	public GradeLevel() {
	}

	public List<Standard> getStandards() {
		return standards;
	}

	public void setStandards(List<Standard> standards) {
		this.standards = standards;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGradeNumber() {
		return gradeNumber;
	}

	public void setGradeNumber(String gradeNumber) {
		this.gradeNumber = gradeNumber;
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
		GradeLevel other = (GradeLevel) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "GradeLevel [id=" + id + ", name=" + name + ", gradeNumber=" + gradeNumber + "]";
	}
	
}
