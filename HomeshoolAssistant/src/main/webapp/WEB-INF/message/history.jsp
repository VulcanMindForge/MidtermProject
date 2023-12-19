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
            background-color: #f8f9fa;
        }

        .container {
            max-width: 600px;
            background-color: #343a40;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            color: #fff;
        }

        .message-container {
            max-height: 300px; 
            overflow-y: scroll;
            border: 1px solid #ced4da; 
            padding: 10px;
            margin-top: 20px; 
            background-color: #f8f9fa;
            border-radius: 5px;
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
            transition: background-color 0.3s;
        }

        .chat-link:hover {
            background-color: #e2e6ea;
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
            transition: background-color 0.3s;
        }

        .new-message-link:hover {
            background-color: #0056b3;
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
        </a>

        <div class="message-container" id="messageContainer">
		    <c:if test="${messages.isEmpty()}">
		        <p style="color: black;">No chats with ${receiver.firstName} yet</p>
		    </c:if>
		    <c:if test="${!messages.isEmpty()}">
		        <c:forEach var="message" items="${messages}">	
		            <p style="color: black;">${message.sender.username}: ${message.message}</p>
		        </c:forEach> 
		    </c:if>
		</div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        
        <script>
            // Set the scroll position to the bottom
            var messageContainer = document.getElementById('messageContainer');
            messageContainer.scrollTop = messageContainer.scrollHeight;
        </script>
    </div>

</body>
<%@ include file="/WEB-INF/includes/footer.jsp"%>
</html>
