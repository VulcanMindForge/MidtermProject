<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<body>
    <div class="text-center bg-image rounded-3 mt-2">
        <div class="d-flex justify-content-center align-items-center h-100">
            <div class="text-white">
                <form class="form" action="login.do" method="POST">
                    <h2>Login</h2>
                    <label for="username">Username:</label>
                    <input type="text" name="username" required>
                    <label for="password">Password:</label>
					<input type="password" name="password" style="margin-bottom: 10px;" required>
					<input type="submit" value="Login">
                </form>
            </div>
        </div>
    </div>

	<%@ include file="includes/about.jsp"%>
</body>
<%@ include file="includes/footer.jsp"%>
</html>
