<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/includes/header.jsp"%>

<head>
    <title>History</title>
    <style>
        .message-container {
            max-height: 400px; /* Set your desired height */
            overflow-y: scroll;
            border: 1px solid #ccc; /* Add a border for better appearance */
            padding: 10px; /* Add some padding */
        }
    </style>
</head>
<body>

    <h1>History</h1>
    <br>
    <h3>Chat with ${receiver.firstName} ${receiver.lastName}</h3>	
    <br>
    
    <a href="new_messageForm?senderId=${sender.id}&receiverId=${receiver.id}">
    Send New Message</a><br>

    <br><br>
    
    <div class="message-container">
    
    <c:if test="${messages.isEmpty()}">
        <p>No chats with ${receiver.firstName} yet</p>
    </c:if>
    <c:if test="${!messages.isEmpty()}">
        <c:forEach var="message" items="${messages}">	
            <p>${message.sender.username}: ${message.message}</p>
        </c:forEach> 
    </c:if>
    
        
        <!--  
        <c:forEach var="message" items="${messages}">	
            <p>${message.sender.username}: ${message.message}</p><br>
        </c:forEach> 
        -->
    </div>
    <br>

</body>
<%@ include file="/WEB-INF/includes/footer.jsp"%>
</html>
