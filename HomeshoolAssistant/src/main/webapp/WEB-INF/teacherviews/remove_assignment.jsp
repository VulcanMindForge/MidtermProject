<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<body>
<div class="container">
		<div class="bg-image text-center rounded-3 mt-2 d-flex justify-content-center align-items-center h-100">
			<div class="form w-100">
				<div class="text-white form align-middle">
	<c:if test="${user.role eq 'Teacher'}">
	<table class="table rounded-3">
	<thead>
	<tr>
	<th scope="col">Assignment Title</th>
	<th scope="col">Assignment Complete</th>
	<th scope="col">Assignment Description</th>
	<th scope="col">Actions</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${assignments}" var="assignment">
	<tr>
	<th scope="row">${assignment.title}</th>
	<td>${assignment.completed}</td>
	<td>${assignment.description}</td>
	 <td class="d-flex">	<form class="form" action="editAssignment.do">
			<input type="hidden" value="${user.id}" name="userId">
			<input type="hidden" value="${assignment.id}" name="assignmentId">			
			<input class="btn btn-success" type="submit" value="Edit">
		</form>
		<form class="form" action="removeAssignment.do" method="POST">
			<input type="hidden" value="${user.id}" name="userId">
			<input type="hidden" value="${assignment.id}" name="assignmentId">			
			<input type="hidden" value="${assignment.lessonPlan.id}" name="planId">			
			<input class="btn btn-danger" type="submit" value="Remove">
		</form> </td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	<form class="form" action="account.do">
			<input type="hidden" value="${user.id}" name="userId">
			<input class="btn btn-success" type="submit" value="Return to Account">
		</form>
	</c:if>
	</div>
	</div>
	</div>
	</div>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>