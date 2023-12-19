<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            padding: 20px;
        }

        .scrollable-container {
            max-height: 400px; 
            overflow-y: auto;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            background-color: #f8f9fa;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .new-chat-link {
            display: block;
            margin-bottom: 10px;
            padding: 10px;
            background-color: #ffffff; /* Change background color */
            border: 1px solid #ddd;
            border-radius: 5px;
            text-decoration: none;
            color: #333;
            transition: background-color 0.3s;
        }

        .new-chat-link:hover {
            background-color: #f8f9fa; /* Change hover background color */
        }
    </style>
</head>

<body>


    <div class="scrollable-container">
        <c:forEach var="searchUser" items="${searchList}">
            <a href="new_messageForm?senderId=${((sessionScope.user).id)}&receiverId=${searchUser.id}"
                class="new-chat-link">
                ${searchUser.username} - ${searchUser.firstName} ${searchUser.lastName}
            </a>
        </c:forEach>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>

</body>

</html>
