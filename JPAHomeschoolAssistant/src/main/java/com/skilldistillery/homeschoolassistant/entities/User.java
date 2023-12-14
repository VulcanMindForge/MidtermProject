package com.skilldistillery.homeschoolassistant.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrimaryKeyJoinColumn;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;
	private String username;
	private String password;
	private String role;
	private boolean enabled;

	@OneToMany(mappedBy = "sender")
	private List<Message> sent;

	@OneToMany(mappedBy = "receiver")
	private List<Message> received;

	@OneToMany(mappedBy = "user")
	private List<Resource> resources;

	@OneToMany(mappedBy = "parent")
	private List<Student> students;

	@OneToOne(cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn
	private Teacher teacher;

	@OneToOne(cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn
	private Student student;

	public User() {
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public void addStudent(Student student) {
		if (students == null) {
			students = new ArrayList<>();
		}

		if (!students.contains(student)) {
			students.add(student);
			if (student.getParent() != null) {
				student.getParent().removeStudent(student);
			}
			student.setParent(this);
		}
	}

	public void removeStudent(Student student) {
		if (students != null && students.contains(student)) {
			students.remove(student);
			student.setParent(null);
		}
	}

	public List<Resource> getResources() {
		return resources;
	}

	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}

	public void addResource(Resource resource) {
		if (resources == null) {
			resources = new ArrayList<>();
		}
		if (!resources.contains(resource)) {
			resources.add(resource);
			if (resource.getUser() != null) {
				resource.getUser().removeResource(resource);
			}
			resource.setUser(this);
		}
	}

	public void removeResource(Resource resource) {
		if (resources != null && resources.contains(resource)) {
			resources.remove(resource);
			resource.setUser(null);
		}
	}

	public List<Message> getSent() {
		return sent;
	}

	public void setSent(List<Message> sent) {
		this.sent = sent;
	}

	public void addSentMessage(Message message) {
		if (sent == null) {
			sent = new ArrayList<>();
		}
		if (!sent.contains(message)) {
			sent.add(message);
			if (message.getReceiver() != null) {
				message.getReceiver().removeReceivedMessage(message);
			}
			message.setReceiver(this);
		}
	}

	public void removeSentMessage(Message message) {
		if (sent != null && sent.contains(message)) {
			sent.remove(message);
			message.setSender(null);
		}
	}

	public List<Message> getReceived() {
		return received;
	}

	public void setReceived(List<Message> received) {
		this.received = received;
	}

	public void addReceivedMessage(Message message) {
		if (received == null) {
			received = new ArrayList<>();
		}
		if (!received.contains(message)) {
			received.add(message);
			if (message.getReceiver() != null) {
				message.getReceiver().removeReceivedMessage(message);
			}
			message.setReceiver(this);
		}
	}

	public void removeReceivedMessage(Message message) {
		if (received != null && received.contains(message)) {
			received.remove(message);
			message.setReceiver(null);
		}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	@Override
	public int hashCode() {
		return Objects.hash(enabled, firstName, id, lastName, password, role, username);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		return enabled == other.enabled && Objects.equals(firstName, other.firstName) && id == other.id
				&& Objects.equals(lastName, other.lastName) && Objects.equals(password, other.password)
				&& Objects.equals(role, other.role) && Objects.equals(username, other.username);
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", username=" + username
				+ ", password=" + password + ", role=" + role + ", enabled=" + enabled + "]";
	}

}
