<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<body>
	<div class="container">
		<div class="bg-dark text-center rounded-3 mt-2 d-flex justify-content-center align-items-center h-100">
			<div class="form w-75 center">
				<h3>${assignment.title }</h3><br>
				<strong>Description: </strong>${assignment.description }<br>
				<strong>Due Date: </strong>${assignment.duedate }<br>
				<strong>Completed: </strong>${assignment.completed }<br>
				<br>
				<c:if test="${user.role eq 'Student'}">
					<form class="form" action="completeAssignment.do" method="POST">
						<input type="hidden" name="assignmentId" value="${assignment.id}">
						<input type="submit" class="btn btn-primary" value="Submit for grading">
					</form>
				</c:if>
				<strong>Grade: </strong>${assignment.grade }<br>
				<br>
				<c:if test="${user.role eq 'Teacher'}">
				<c:if test="${assignment.completed eq true}">
					<form class="form" action="gradeAssignment.do" method="POST">
						<input type="hidden" name="assignmentId" value="${assignment.id}">
						<input type="number" min="0.0" max="100.0" name="assignmentGrade" value="90.0">
						<input type="submit" class="btn btn-primary" value="Submit Grade">
					</form>
				</c:if>
				</c:if>
				<a class="btn btn-primary" href="account.do?userId=${user.id}">Return to Account</a>
			</div>
		</div>
	</div>	
</body>
<%@ include file="includes/footer.jsp"%>
</html>