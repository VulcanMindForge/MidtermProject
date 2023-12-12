<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<head>
<title>Edit Account</title>
</head>
<body>

	<form action="edit_account.do" method="post">
		<label for="userId">User ID:</label> <input type="text" id="userId" name="userId" value="${user.id}" required readonly> <br>
		<label for="firstName">First Name:</label> <input type="text" id="firstName" name="firstName" value="${user.firstName}" required> <br> 
		<label for="lastName">Last Name:</label> <input type="text" id="lastName" name="lastName" value="${user.lastName}" required> <br>
		<label for="username">Username:</label> <input type="text" id="username" name="username" value="${user.username}" required> <br> 
		<label for="password">Password:</label> <input type="password" id="password" name="password" value="${user.password}" required> <br> 
		<label for="role">Role:</label> <input type="text" id="role" name="role" value="${user.role}" required> <br> 
		<input type="submit" value="Submit">
	</form>

	<a href="removeAccount.do?userId=${user.id}">Remove User</a>

</body>
<%@ include file="includes/footer.jsp"%>

</html>