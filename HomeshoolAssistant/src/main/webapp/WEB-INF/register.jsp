<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<body>
	<form class="form" action="register.do" method="POST" id="registerUser">
	    <label for="firstName">First Name: </label>
	    <input type="text" id="firstName" name="firstName">
	    <br>	
	    <label for="lastName">Last Name: </label>
	    <input type="text" id="lastName" name="lastName">	
	    <br>	
	    <label for="username">Username: </label>
	    <input type="text" id="username" name="username">	
	    <br>	
	    <label for="password">Password: </label>
	    <input type="password" id="password" name="password">	
	    <br>	
	    <input type="submit" value="register">
	</form>

</body>
<%@ include file="includes/footer.jsp"%>
</html>