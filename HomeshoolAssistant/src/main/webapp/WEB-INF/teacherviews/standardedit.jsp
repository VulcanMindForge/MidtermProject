<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<body>
<div class="container">
		<form class="form" action="standardAdd.do" method="POST">
			<label for="year">School Year: </label> 
			<input type="text" name="year">
			<br>
			<label for="title">State Abbreviation: </label> 
			<input type="text" name="state">
			<br>
			
			<label for="url">URL: </label> 
			<input type="text" name="url"> 
			<br>
			
			<label for="grade">Grade Level: </label> 
			<select name="grade" id="grade">
			<c:forEach items="${grades}" var="grade">
			<option value="${grade.name}">${grade.name }</option>
			</c:forEach>
			</select>
			
			<br>
			<label for="subject">Subject: </label> 
			<select name="subject" id="subject">
			<c:forEach items="${subjects}" var="subject">
			<option value="${subject.title }">${subject.title }</option>
			</c:forEach>
			</select>

			<br>
			<label for="description">Description: </label> 
			<input type="text" name="description" id="description">
			
			<input type="hidden" name="teacher" value="${user.id}"> 
			<br>
			<input type="submit">

		</form>
	</div>

</body>
<%@ include file="../includes/footer.jsp"%>
</html>