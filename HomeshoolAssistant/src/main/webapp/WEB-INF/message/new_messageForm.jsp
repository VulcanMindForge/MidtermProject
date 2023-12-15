<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/includes/header.jsp"%>

<head>
    <title>New Message</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            padding: 20px;
        }

        form {
            max-width: 600px;
            margin: 0 auto;
            background-color: #f8f9fa;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        label {
            margin-top: 10px;
            display: block;
        }

        textarea {
            width: 100%;
            height: 150px;
            margin-top: 5px;
        }

        input[type="submit"] {
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
            cursor: pointer;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>New Message</h1>

        <form action="sendMessage.do" method="post">
            <input type="hidden" id="senderId" name="senderId" value="${sender.id}">
            <input type="hidden" id="receiverId" name="receiverId" value="${receiver.id}">

            <label>From: ${sender.firstName} ${sender.lastName}</label><br>
            <label for="firstName">To: ${receiver.firstName} ${receiver.lastName}</label> <br> 
            <label for="message">Message:</label><br>

            <textarea id="message" name="message" required></textarea>

            <input type="submit" value="Submit">
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</body>
<%@ include file="/WEB-INF/includes/footer.jsp"%>
</html>
