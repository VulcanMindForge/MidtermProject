<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/includes/header.jsp"%>

<head>
<title>Add Account</title>
</head>
<body>

<h1>Add Account</h1>
<div class="container">
		<div
			class="bg-dark text-center rounded-3 mt-2 d-flex justify-content-center align-items-center h-100">

    <form class="form w-75 center" action="addAccount.do" method="post">
	    <label for="firstName">First Name:</label>
	    <input type="text" id="firstName" name="firstName" required>
	    <br>
	
	    <label for="lastName">Last Name:</label>
	    <input type="text" id="lastName" name="lastName" required>
	    <br>
	    
	    <label for="username">Username:</label>
	    <input type="text" id="username" name="username" required>
	    <br>
	    
	    <label for="password">Password:</label>
	    <input type="text" id="password" name="password" required>
	    <br>
	    
	    <label>Role: </label>
	    <label><input type="radio" id="role" name="role" value="Student" required> Student</label>
	    <label><input type="radio" id="role" name="role" value="Teacher" required> Teacher</label>
	    <br>
	
	    <label for="gradeLevel">Grade Level of Student:</label>
	    <input type="text" id="gradeLevel" name="gradeLevel">
	    <br>
	
	    <input type="hidden" value="${user.id}" name="teacherId">
	    <input type="submit" value="Add Account">
	</form>
	</div>
	</div>
	
</body>
<%@ include file="/WEB-INF/includes/footer.jsp"%>
</html>