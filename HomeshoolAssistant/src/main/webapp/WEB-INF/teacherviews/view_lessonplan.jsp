<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<body>
<div class="container">
		<div class="bg-image text-center rounded-3 mt-2 d-flex justify-content-center align-items-center h-100">
			<div class="form w-75">
				<div class="text-white form align-middle">
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
		<c:forEach items="${assignments}" var="assignment">
		<tr>
		
		<th scope="row">${assignment.title}</th>
		<td>${assignment.description}</td>
		<td colspan="2"><a href="${assignment.resource.url}">${assignment.resource.title}</a><td>
			<c:forEach items="${assignment.resource.standards}" var="standard">
			<td><a href="${standard.url}">${standard.description}</a></td>
			</c:forEach>
		</tr>
		</c:forEach>
		</tbody>
		</table>
	<form action="addAssignment.do">
		<input type="hidden" name="planId" value="${plan.id}">
		<input type="hidden" name="userId" value="${user.id}">
		<input class="btn btn-primary" type="submit" name="addAssignment" value="Add Assignment">
	</form>
	<form action="removeAssignment.do">
		<input type="hidden" name="planId" value="${plan.id}">
		<input type="hidden" name="userId" value="${user.id}">
		<input class="btn btn-danger" type="submit" name="removeAssignment" value="View Assignments">
	</form>
	<form action="editLessonPlan.do">
		<input type="hidden" name="planId" value="${plan.id}">
		<input type="hidden" name="userId" value="${user.id}">
		<input class="btn btn-secondary" type="submit" name="editLessonPlan" value="Edit Lesson Plan">
	</form>
	</div>
	</div>
	</div>
	</div>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>