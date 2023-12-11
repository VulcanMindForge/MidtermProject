package com.skilldistillery.homeschoolassistant.entities;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;

@Entity
public class Standard {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String url;
	
	private String description;
	
	private String state;
	
	@Column(name = "standard_year")
	private Integer standardYear;
	
	@ManyToMany(mappedBy="standards")
	private List<Resource> resources;
	
	@ManyToOne
	@JoinColumn(name = "subject_id")
	private Subject subject;
	
	@ManyToOne
	@JoinColumn(name = "grade_level_id")
	private GradeLevel gradeLevel;

	public Standard() {
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public GradeLevel getGradeLevel() {
		return gradeLevel;
	}

	public void setGradeLevel(GradeLevel gradeLevel) {
		this.gradeLevel = gradeLevel;
	}

	public List<Resource> getResources() {
		return resources;
	}

	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Integer getStandardYear() {
		return standardYear;
	}

	public void setStandardYear(Integer standardYear) {
		this.standardYear = standardYear;
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
		Standard other = (Standard) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Standard [id=" + id + ", url=" + url + ", description=" + description + ", state=" + state
				+ ", standardYear=" + standardYear + "]";
	}
	
	
}
