<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<body>

	<h3>First Name: ${user.firstName } , Last Name: ${user.lastName }</h3>

	<ul>
		<c:forEach var="assignment" items="${assignments}">

			<li>Title: ${assignment.title }</li>
			<li>Description: ${assignment.description }</li>
			<li>Due Date: ${assignment.duedate }</li>
			<li>Completed: ${assignment.completed }</li>
			<li>Grade: ${assignment.grade }</li>
		</c:forEach>
	</ul>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>