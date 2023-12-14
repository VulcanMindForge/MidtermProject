<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/includes/header.jsp"%>

<head>
<title>New Message</title>
</head>
<body>

	<h1>New Message</h1>
	
	<form action="sendMessage.do" method="post">
	    <input type="hidden" id="senderId" name="senderId" value="${sender.id}">
	    <input type="hidden" id="receiverId" name="receiverId" value="${receiver.id}">
	    <!--  
	    <label for="userId">User ID:</label>
	    <input type="hidden" id="userId" name="userId" value="${sender.id}" required readonly> <br>
	    -->
	    <label>From: ${sender.firstName} ${sender.lastName}</label><br>
	    <label for="firstName">To: ${receiver.firstName} ${receiver.lastName}</label> <br> 
	    <label for="message">Message:</label><br>
	    
	    <textarea id="message" name="message" required></textarea>
	    
	    <input type="submit" value="Submit">
	</form>


</body>
<%@ include file="/WEB-INF/includes/footer.jsp"%>
</html>