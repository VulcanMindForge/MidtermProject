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

        .chat-container {
            max-width: 800px;
            margin: 0 auto;
        }

        .search {
            margin-bottom: 20px;
        }

        .chat-link {
            display: block;
            margin-bottom: 10px;
            padding: 10px;
            background-color: #007bff;
            border: 1px solid #007bff;
            border-radius: 5px;
            text-decoration: none;
            color: #fff;
            transition: background-color 0.3s;
        }

        .chat-link:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        h1, h4 {
            color: #007bff;
        }
    </style>
</head>

<body>
    <div class="chat-container">
        <h1>Chat</h1>
        <div class="search">
            <form action="searchUsers.do" method="GET">
                <label for="search">Search Users:</label>
                <input type="text" id="search" name="search"/>
                <input type="submit" value="Find"/>
            </form>
        </div>
        
        <c:if test="${not empty searchList}">
            <div>
                <%@ include file="show_users.jsp"%>
            </div>
        </c:if>

        <div class="container">
            <h4>Your Chats</h4>
            <c:forEach var="otherUser" items="${userList}">
                <c:if test="${user.id ne otherUser.id}">
                    <a href="history.do?senderId=${user.id}&receiverId=${otherUser.id}" class="chat-link">
                        ${otherUser.firstName} ${otherUser.lastName}
                    </a>
                </c:if>
            </c:forEach>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
    	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</body>
<%@ include file="/WEB-INF/includes/footer.jsp"%>
</html>
