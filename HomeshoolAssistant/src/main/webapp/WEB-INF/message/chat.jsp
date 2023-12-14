<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/includes/header.jsp"%>

<head>
<title>Chat</title>
</head>
<body>

	<br>
	<h1>Chat</h1>
	<br>
	
	<h4>Your Chats</h4>
	
	<c:forEach var="otherUser" items="${userList}">
		<c:if test="${user.id ne otherUser.id}">
	        <a href="history.do?senderId=${user.id}&receiverId=${otherUser.id}">
	            To: ${otherUser.firstName} ${otherUser.lastName}
	        </a>
	        <br>
	    </c:if>
	</c:forEach>
	
	<br>
		
</body>
<%@ include file="/WEB-INF/includes/footer.jsp"%>
</html>