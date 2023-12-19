<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<head>
    <title>Home</title>
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

    .mask {
        background-color: rgba(0, 0, 0, 0.6);
        padding: 20px;
    }

</style>

</head>
<body>

	<div class="text-center bg-image rounded-3 mt-2">
		<div class="mask">
			<div class="d-flex justify-content-center align-items-center h-100">
				<div class="text-white">
					<h1 class="mb-3">Welcome to Homeschool Assistant</h1>
					<h4 class="mb-3">We are happy to help make homeschooling easy</h4>

					<a class="btn btn-outline-light btn-lg" href="register.do"
						role="button">Register</a> <a class="btn btn-outline-light btn-lg"
						href="login.do" role="button">Login</a>

				</div>
			</div>
		</div>
	</div>

	<%@ include file="includes/about.jsp"%>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
    	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	
</body>
<%@ include file="includes/footer.jsp"%>
</html>
