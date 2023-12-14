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

    <form action="addAccount.do" method="post">
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

        <input type="submit" value="Add Account">
    </form>

</body>
<%@ include file="/WEB-INF/includes/footer.jsp"%>
</html>