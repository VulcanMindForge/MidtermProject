<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<body>
	<div class="container">
		<form class="form" action="lessonPlanAdd.do" method="POST">
			<label for="planTitle">Title: </label>
			<input type="text" name="planTitle" > 
			<br>
			<label for="planDescription">Description: </label>
			<input type="text" name="planDescription" > 
			<br>			
			Shared: <label for="yes">Yes: </label> 
					<input type="checkbox" name="shared" value="true" id="yes">
					<label for="no">No: </label> 
					<input type="checkbox" name="shared" value="false" id="no">
			<br>
			<h2>Add Assignment</h2>
			<label for="assignmentTitle">Assignment Title: </label>
			<input	type="text" id="assignmentTitle" name="assignmentTitle">
			<br>
			<label	for="assignmentDescription">Assignment Description: </label>
			<input	type="text" id="assignmentDescription" name="assignmentDescription">
			<br>
			<label for="dueDate">Due Date: </label> 
			<input type="date" id="dueDate" name="dueDate"> 

			<br>
			<label for="resource">Resource for Assignment: </label> 
			<select name="resource" id="resource">
				<c:forEach items="${resources}" var="resource">
					<option name="${resource.id}">${resource.id}, ${resource.title}</option>
				</c:forEach>
			</select> 
			
			<br>
			<label for="student">Student: </label> 
			<select name="student">
				<c:forEach items="${students}" var="student">
					<option name="${student.id }">${student.id}, ${student.firstName} ${student.lastName}</option>
				</c:forEach>
			</select>
			<br>
			<input type="hidden" name="userId" value="${user.id}"> 
			<input type="submit" value="Submit">
		</form>
	</div>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>