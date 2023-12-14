<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/includes/header.jsp"%>

<head>
    <title>History</title>
</head>
<body>

    <h1>History</h1>
    <br>
    <h3>Chat with ${receiver.firstName} ${receiver.lastName}</h3>	
    <br>
    
    <a href="new_messageForm?senderId=${sender.id}&receiverId=${receiver.id}">
    New Message to ${receiver.firstName}</a><br>

    <br><br>
    
    <c:forEach var="message" items="${messages}">	
        <p>${message.sender.username}: ${message.message}</p><br>
    </c:forEach> 
    <br>

</body>
<%@ include file="/WEB-INF/includes/footer.jsp"%>
</html>
