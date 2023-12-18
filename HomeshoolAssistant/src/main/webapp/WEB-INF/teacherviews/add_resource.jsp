<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<body>
	<div class="container">
		<form class="form" action="resourceAdd.do" method="POST">
			<label for="title">Title: </label> <input type="text" name="title">
			<br> <label for="url">URL: </label> <input type="text"
				name="url"> 
				<br> 
				<select name="standard">
				<c:forEach var="standard" items="${standards}">
					<option value="${standard.id}">${standard.id}, ${standard.gradeLevel.name}, 
						${standard.subject.title}, ${ standard.description}</option>
				</c:forEach>
			</select> 
			<br>
			<input type="hidden" name="userId" value="${user.id}"> <input
				type="submit">
		</form>
	</div>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>