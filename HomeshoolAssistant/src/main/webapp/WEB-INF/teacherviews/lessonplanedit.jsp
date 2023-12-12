<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<body>
	<div class="container">
		<form class="form" action="lessonPlanAdd.do" method="POST">
			<label for="title">Title: </label> <input type="text" name="title">
			<label for="description">Description: </label> <input type="text"
				name="description"> 
				Shared:
				<label for="yes">Yes: </label> 
				<input type="checkbox" name="shared" value="true" id="yes">
				<label for="no">No: </label> 
				<input type="checkbox" name="shared" value="false" id="no">
				<input type="hidden" name="teacher" value="${user.id}"> <input
				type="submit">


		</form>
	</div>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>