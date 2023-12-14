<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<body>

<a href="assignment.do?userId=${user.id }" > List Assignments</a>

	<ul>
		<li>First Name: ${user.firstName }</li>
		<li>Last Name: ${user.lastName }</li>
		<li>Username: ${user.username }</li>
	</ul>

	<a href="edit_accountForm?userId=${user.id}">Edit Account</a>
	<br>
	<br>

	<c:if test="${user.role eq 'Teacher' }">
		<form class="form" action="lessonPlanAdd.do">
			<input type="submit" value="Add Lesson Plan">
		</form>
		<form class="form" action="resourceAdd.do" method="get">
			<input type="submit" value="Add Resource">
		</form>
		<form class="form" action="standardAdd.do">
			<input type="submit" value="Add Standard">
		</form>
	</c:if>

</body>
<%@ include file="includes/footer.jsp"%>
</html>
