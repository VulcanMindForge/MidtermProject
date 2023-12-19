<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/includes/header.jsp"%>
<head>
<title>Edit Account</title>
</head>
<body>
<div class="container">
		<div
			class="bg-dark text-center rounded-3 mt-2 d-flex justify-content-center align-items-center h-100">

	<form class="form w-75 center" action="edit_account.do" method="post">
	    <label for="userId">User ID: ${user.id}</label> <input type="hidden" id="userId" name="userId" value="${user.id}"> <br>
	    <label for="firstName">First Name:</label> <input type="text" id="firstName" name="firstName" value="${user.firstName}" required> <br> 
	    <label for="lastName">Last Name:</label> <input type="text" id="lastName" name="lastName" value="${user.lastName}" required> <br>
	    <label for="username">Username:</label> <input type="text" id="username" name="username" value="${user.username}" required> <br> 
	    <label for="password">Password:</label> <input type="password" id="password" name="password" value="${user.password}" required> <br> 
	        
	    <c:if test="${((sessionScope.user).role) eq 'Teacher'}">
	        <label>Role: </label>
	        <label><input type="radio" id="studentRole" name="role" value="Student" ${user.role == 'Student' ? 'checked' : ''} required> Student</label>
	        <label><input type="radio" id="teacherRole" name="role" value="Teacher" ${user.role == 'Teacher' ? 'checked' : ''} required> Teacher</label>
	        <br>
	    </c:if>
	    
	    <input type="submit" value="Submit changes">
		<a class="btn btn-danger" href="removeAccount.do?userId=${user.id}">Remove User</a>
	</form>
	
	</div>
	</div>
</body>
<%@ include file="/WEB-INF/includes/footer.jsp"%>
</html>