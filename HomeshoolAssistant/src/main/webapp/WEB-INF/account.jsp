<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<body>
<div class="container">

	<h1>${user.role} Account</h1>

	<h5>Your Account:</h5>
	<ul>
		<li>First Name: ${user.firstName }</li>
		<li>Last Name: ${user.lastName }</li>
		<li>Username: ${user.username }</li>
	</ul>
	<br><br>
	
	<a href="/account/edit_accountForm.jsp?userId=${user.id}">Edit Account</a>
	
	<c:if test="${user.role eq 'Student'}">
	<a href="assignment.do?userId=${user.id }" > List Assignments </a>
	<br>

	</c:if>
	
	
	<c:if test="${user.role eq 'Teacher'}">
	<h5>Student(s):</h5>
	<c:forEach var="student" items="${students}">

	        <a href="getAccount.do?userId=${student.id}">${student.firstName} ${student.lastName}</a>		
	        <br>

	</c:forEach>

	<br>
	<a href="add_accountForm">Add Account</a>
	
	<div class="container">
	<table class="table">
		<tbody>
		<c:forEach items="${plans}" var="plan">
		<tr>
			<td><a href="lessonPlan.do?planId=${plan.id }">${plan.title}</a></td>
			<td>${plan.description}</td>
			<c:forEach items="${plan.assignments}" var="assignment">
			<c:forEach items="${users}" var="user">
			<c:if test="${user.id eq assignment.student.id}">
			
			<td>${assignment.title}<br>${user.firstName} ${user.lastName}</td>
			</c:if>
			</c:forEach>
			</c:forEach>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<div class="container form-group">
		<form class="form" action="addLessonPlan.do">
			<input type="hidden" value="${user.id}" name="userId">
			<input class="btn btn-success" type="submit" value="Add Lesson Plan">
		</form>
		
		<form class="form" action="resourceAdd.do" method="get">
			<input type="hidden" value="${user.id}" name="userId">
			<input class="btn btn-success" type="submit" value="Add Resource">
		</form>
	
		<form class="form" action="standardAdd.do">
			<input type="hidden" value="${user.id}" name="userId">
			<input class="btn btn-success" type="submit" value="Add Standard">
		</form>
	</div>
	</c:if>

</div>
</body>
<%@ include file="includes/footer.jsp"%>

</html>