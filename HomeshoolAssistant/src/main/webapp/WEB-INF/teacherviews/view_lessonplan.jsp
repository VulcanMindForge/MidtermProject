<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<body>
<div class="container">
	<form action="addAssignment.do">
		<input type="hidden" name="planId" value="${plan.id}">
		<input type="hidden" name="userId" value="${user.id}">
		<input type="submit" name="addAssignment" value="Add Assignment">
	</form>
	<form action="removeAssignment.do">
		<input type="hidden" name="planId" value="${plan.id}">
		<input type="hidden" name="userId" value="${user.id}">
		<input type="submit" name="removeAssignment" value="Remove Assignment">
	</form>
	<h1>${plan.title}</h1>
	<p>${plan.description}</p>
	<br>
	<h2>Assignments</h2>
	<table class="table">
		<thead>
			<tr>
			<th scope = "col">Assignment Title</th>
			<th scope = "col">Assignment Description</th>
			<th scope = "col" colspan="2">Resources</th>
			<th scope = "col">Standards</th>
			</tr>
		</thead>
		</tbody>
		<c:forEach items="${plan.assignments}" var="assignment">
		<tr>
		
		<th scope="row">${assignment.title}</th>
		<td>${assignment.description}</td>
		<td colspan="2"><a href="${assignment.resource.url}">${assignment.resource.title}</a><td>
			<c:forEach items="${assignment.resource.standards }" var="standard">
			<td><a href="${standard.url}">${standard.description}</a></td>
			</c:forEach>
		</tr>
		</c:forEach>
		</tbody>
		</table>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>