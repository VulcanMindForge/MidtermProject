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

	<h1>Account Heading</h1>

	<h5>Current Students</h5>
	<c:forEach var="user" items="${userList}">
		<a href="getAccount.do?userId=${user.id}">${user.id}: ${user.firstName} ${user.lastName}</a> <br>
	</c:forEach>
	<br>

	<a href="add_accountForm">Add Account</a>


</body>
<%@ include file="includes/footer.jsp"%>

</html>