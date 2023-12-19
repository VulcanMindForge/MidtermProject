<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<body>
	<div class="container">
		<div class="bg-image text-center rounded-3 mt-2 d-flex justify-content-center align-items-center h-100">
			<form class="form" action="resourceAdd.do" method="POST">
				
				<label for="title">Title: </label> 
				<input type="text" name="title" required><br> 
				
				<label for="url">URL: </label> 
				<input type="text" name="url" value="www.youtube.com" required><br> 
				
				<select name="standard" required>
					<c:forEach var="standard" items="${standards}">
						<option value="${standard.id}">${standard.id}, ${standard.gradeLevel.name}, 
							${standard.subject.title}, ${ standard.description}</option>
					</c:forEach>
				</select> 
				
				<br><br>
				<input type="hidden" name="userId" value="${user.id}"> 
				<input type="submit" value="Add Resource">
			</form>
		</div>
	</div>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>