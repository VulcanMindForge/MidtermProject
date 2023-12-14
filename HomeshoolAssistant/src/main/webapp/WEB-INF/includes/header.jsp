<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="head.jsp"%>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active" href="home.do">Home</a>
					</li>
				</ul>
				<ul class="navbar-nav">
					<li><a href="register.do">Register</a></li>
					<c:if test="${not login}">
						<li><a href="login.do">Log In</a></li>
					</c:if>

					<c:if test="${login eq true}">
						<li><a href="account.do">Account</a></li>
					</c:if>

					<c:if test="${login eq true}">
						<li><a href="message.do">Chat</a></li>
					</c:if>
					
					<c:if test="${login eq true}">
						<li><a href="logout.do">Logout</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>