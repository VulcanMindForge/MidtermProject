<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<body>
    <div class="text-center bg-image rounded-3 mt-2">
        <div class="d-flex justify-content-center align-items-center h-100">
        	<div class="text-white">
            <form class="form" action="register.do" method="POST" id="registerUser">
            	<h2>Registration</h2>
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" required>
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" required>
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
                <label for="password">Password:</label>
				<input type="password" id="password" name="password" style="margin-bottom: 10px;" required>
				<input type="submit" value="Register">
            </form>
            </div>
        </div>
    </div>

	<%@ include file="includes/about.jsp"%>

</body>
<%@ include file="includes/footer.jsp"%>
</html>
