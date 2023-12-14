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

	<a href="add_accountForm">Add Account</a>

</body>
<%@ include file="includes/footer.jsp"%>

</html>