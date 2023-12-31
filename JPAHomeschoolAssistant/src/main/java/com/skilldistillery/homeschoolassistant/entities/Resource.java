package com.skilldistillery.homeschoolassistant.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Resource {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String title;

	private String url;

	@Column(name = "create_date")
	@CreationTimestamp
	private LocalDateTime createDate;

	@Column(name = "last_update")
	@UpdateTimestamp
	private LocalDateTime lastUpdate;

	@OneToMany(mappedBy = "resource")
	private List<Assignment> assignments;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToMany
	@JoinTable(name = "standard_has_resource", joinColumns = @JoinColumn(name = "resource_id"), inverseJoinColumns = @JoinColumn(name = "standard_id"))
	private List<Standard> standards;

	public Resource() {
	}

	public void addAssignment(Assignment assignment) {
		if (assignments == null) {
			assignments = new ArrayList<>();
		}
		if (!assignments.contains(assignment)) {
			assignments.add(assignment);
			if (assignment.getResource() != null) {
				assignment.getResource().removeAssignment(assignment);
			}
			assignment.setResource(this);
		}
	}

	public void removeAssignment(Assignment assignment) {
		if (assignments != null && assignments.contains(assignment)) {
			assignments.remove(assignment);
			assignment.setLessonPlan(null);
		}
	}

	public void addStandard(Standard standard) {
		if (standards == null) {
			standards = new ArrayList<>();
		}
		if (!standards.contains(standard)) {
			standards.add(standard);
			standard.addResource(this);
		}
	}
	
	public void removeStandard(Standard standard) {
		if (standards != null && standards.contains(standard)) {
			standards.remove(standard);
			standard.removeResource(this);
		}
	}
	
	public List<Standard> getStandards() {
		return standards;
	}

	public void setStandards(List<Standard> standards) {
		this.standards = standards;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Assignment> getAssignments() {
		return assignments;
	}

	public void setAssignments(List<Assignment> assignments) {
		this.assignments = assignments;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
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
		Resource other = (Resource) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Resource [id=" + id + ", title=" + title + ", url=" + url + ", createDate=" + createDate
				+ ", lastUpdate=" + lastUpdate + "]";
	}

}
