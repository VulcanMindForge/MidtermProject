<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>

<head>
<title>Account</title>
</head>
<body>

	<h1>ACCOUNT HEADING</h1>

	<h5>Your Account:</h5>
	<a href="getAccount.do?userId=${user.id}">${user.firstName} ${user.lastName}</a> 
	<br><br>
	<h5>Current Student(s):</h5>
	<c:forEach var="otherUser" items="${userList}">
		<c:if test="${user.id ne otherUser.id}">
	        <a href="getAccount.do?userId=${otherUser.id}">${otherUser.firstName} ${otherUser.lastName}</a>		
	        <br>
	    </c:if>

	</c:forEach>

	<br>
	<a href="add_accountForm">Add Account</a>
	
	<c:if test="${user.role eq 'Teacher'}">
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
	<div class="container">
		<form class="form" action="addLessonPlan.do">
			<input type="hidden" value="${user.id}" name="userId">
			<input class="btn btn-success" type="submit" value="Add Lesson Plan">
		</form>
		<br>
		<form class="form" action="resourceAdd.do" method="get">
			<input type="hidden" value="${user.id}" name="userId">
			<input class="btn btn-success" type="submit" value="Add Resource">
		</form>
		<br>
		<form class="form" action="standardAdd.do">
			<input type="hidden" value="${user.id}" name="userId">
			<input class="btn btn-success" type="submit" value="Add Standard">
		</form>
	</div>
	</c:if>

</body>
<%@ include file="includes/footer.jsp"%>

</html>