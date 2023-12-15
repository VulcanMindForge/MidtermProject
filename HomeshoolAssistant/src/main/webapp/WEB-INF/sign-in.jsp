<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
	    body {
	        background-color: #f8f9fa;
	    }
	
	    .bg-image {
	        background-image: url('https://images.pexels.com/photos/4260325/pexels-photo-4260325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
	        background-repeat: no-repeat;
	        background-size: cover;
	        height: 75vh;
	    }
	
	    .form {
	    	color: #fff;
	        max-width: 300px;
	        margin: 0 auto;
	        background-color: rgba(0, 0, 0, 0.6);
	        padding: 15px;
	        border-radius: 5px;
	        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	        margin-bottom: 20px;
	    }
	
	    label {
	        margin-top: 10px;
	        display: block;
	        color: #fff;
	        text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5);
	    }
	
	    input {
	        width: 100%;
	        padding: 10px;
	        margin-bottom: 15px;
	        border: 1px solid #ddd;
	        border-radius: 3px;
	    }
	
	    input[type="submit"] {
	        width: 100%;
	        padding: 10px;
	        background-color: #007bff;
	        color: #fff;
	        border: none;
	        border-radius: 3px;
	        cursor: pointer;
	    }
	
	    input[type="submit"]:hover {
	        background-color: #0056b3;
	    }
	</style>
</head>
<body>

    <div class="text-center bg-image rounded-3 mt-2">
        <div class="d-flex justify-content-center align-items-center h-100">
            <div class="text-white">
                <form class="form" action="login.do" method="POST">
                    <h2>Login</h2>
                    <label for="username">Username:</label>
                    <input type="text" name="username">
                    <label for="password">Password:</label>
					<input type="password" name="password" style="margin-bottom: 10px;">
					<input type="submit" value="Login">
                </form>
            </div>
        </div>
    </div>

	<%@ include file="includes/about.jsp"%>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
<%@ include file="includes/footer.jsp"%>
</html>
