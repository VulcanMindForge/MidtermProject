<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<body>
<div class="container">
	<div class="bg-image text-center rounded-3 mt-2 d-flex justify-content-center align-items-center h-100">
		<form class="form w-75" action="standardAdd.do" method="POST">
			<label for="year">School Year: </label> 
			<input type="text" name="year" required>
			<br>
			
			<label for="title">State Abbreviation: </label> 
			<input type="text" name="state" required>
			<br>
			
			<label for="url">URL: </label> 
			<input type="text" name="url" required> 
			<br>
			
			<label for="grade">Grade Level: </label> 
			<select name="grade" id="grade" required>
				<c:forEach items="${grades}" var="grade">
					<option value="${grade.name}">${grade.name }</option>
				</c:forEach>
			</select>
			
			<br>
			<label for="subject">Subject: </label> 
			<select name="subject" id="subject" required>
				<c:forEach items="${subjects}" var="subject">
					<option value="${subject.title }">${subject.title }</option>
				</c:forEach>
			</select>

			<br>
			<label for="description">Description: </label> 
			<input type="text" name="description" id="description" required>
			
			<input type="hidden" name="teacher" value="${user.id}"> 
			<br>
			<input type="submit" value="Add Standard">

		</form>
	</div>
</div>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>