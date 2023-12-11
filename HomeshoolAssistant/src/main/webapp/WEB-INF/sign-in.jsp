<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<body>
<div class = "container">
<form class = "form" action="login.do" method="POST">
	
	<h2>Log In</h2>

		<input type="text" name="username"> 
		<input type="password" name="password" /> 
		<input type="submit" value="Log In">

</form>
</div>
</body>
<%@ include file="includes/footer.jsp"%>
</html>