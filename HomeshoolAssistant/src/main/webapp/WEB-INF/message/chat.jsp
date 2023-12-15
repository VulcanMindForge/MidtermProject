<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/includes/header.jsp"%>

<head>
    <title>Chat</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" 
    	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            padding: 20px; 
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
    </style>
</head>

<body>

    <div class="container">
        <br>
        <h1>Chat</h1>
        <br>

        <h4>Your Chats</h4>

        <c:forEach var="otherUser" items="${userList}">
            <c:if test="${user.id ne otherUser.id}">
                <a href="history.do?senderId=${user.id}&receiverId=${otherUser.id}" class="chat-link">
                    To: ${otherUser.firstName} ${otherUser.lastName}
                </a>
            </c:if>
        </c:forEach>

        <br>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
    	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</body>
<%@ include file="/WEB-INF/includes/footer.jsp"%>
</html>
