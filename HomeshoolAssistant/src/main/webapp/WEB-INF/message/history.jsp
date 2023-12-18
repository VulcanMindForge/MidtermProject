<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/includes/header.jsp"%>

<head>
    <title>History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" 
    	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            padding: 20px; 
        }

        .message-container {
            max-height: 300px; 
            overflow-y: scroll;
            border: 1px solid #ccc; 
            padding: 10px;
            margin-top: 20px; 
        }

        .chat-link {
            display: block;
            margin-bottom: 10px;
            padding: 10px;
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-decoration: none;
            color: #333;
        }

        .new-message-link {
            display: inline-block;
            padding: 8px 16px;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.5;
            text-align: center;
            text-decoration: none;
            white-space: nowrap;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
        }
    </style>
</head>
<body>

    <div class="container">
        <br>
        <h1>History</h1>
        <br>

        <h3>Chat with ${receiver.firstName} ${receiver.lastName}</h3>	
        <br>

        <a href="new_messageForm?senderId=${sender.id}&receiverId=${receiver.id}" class="new-message-link">
            Send New Message
        </a><br>

        <br>

        <div class="message-container">

            <c:if test="${messages.isEmpty()}">
                <p>No chats with ${receiver.firstName} yet</p>
            </c:if>
            <c:if test="${!messages.isEmpty()}">
                <c:forEach var="message" items="${messages}">	
                    <p>${message.sender.username}: ${message.message}</p>
                </c:forEach> 
            </c:if>

        </div>
        <br>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </div>

</body>
<%@ include file="/WEB-INF/includes/footer.jsp"%>
</html>
