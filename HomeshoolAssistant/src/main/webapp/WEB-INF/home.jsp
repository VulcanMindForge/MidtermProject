<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<body>
<h2> Assisting with your homeschooling needs!</h2>

${SMOKETEST }

	<h5>Current Users</h5>
	<c:forEach var="user" items="${userList}">
		<a href="getAccount.do?userId=${user.id}">${user.id}: ${user.firstName} ${user.lastName} ${user.password}</a> <br>
	</c:forEach>
	<br>
</body>
<%@ include file="includes/footer.jsp"%>
</html>