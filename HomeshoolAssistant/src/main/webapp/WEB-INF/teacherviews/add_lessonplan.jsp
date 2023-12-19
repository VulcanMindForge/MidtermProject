<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<body>
	<div class="container">
		<div class="bg-image text-center rounded-3 mt-2 d-flex justify-content-center align-items-center h-100">
			<form class="form w-75 center" action="addLessonPlan.do" method="POST">
				<input type="hidden" value="true" name="shared">

				<label for="planTitle">Title: </label>
				<input type="text" name="planTitle" required> 
				<br>
				
				<label for="planDescription">Description: </label>
				<input type="text" name="planDescription" required> 
				
				<h2>Add Assignment</h2>

				<label for="assignmentTitle">Assignment Title: </label>
				<input	type="text" id="assignmentTitle" name="assignmentTitle" required>
				<br>

				<label	for="assignmentDescription">Assignment Description: </label>
				<input	type="text" id="assignmentDescription" name="assignmentDescription" required>
				<br>

				<label for="dueDate">Due Date: </label> 
				<input type="date" id="dueDate" name="dueDate" required> 
	
				<br>
				<label for="resource">Resource for Assignment: </label> 
				<select name="resource" id="resource" required>
					<c:forEach items="${resources}" var="resource">
						<option name="${resource.id}" value="${resource.id}">${resource.id}, ${resource.title}</option>
					</c:forEach>
				</select> 
				
				<br>
				<label for="student">Student: </label> 
				<select name="student" required>
					<c:forEach items="${students}" var="student">
						<option name="${student.id }" value="${student.id}">${student.id}, ${student.firstName} ${student.lastName}</option>
					</c:forEach>
				</select>
				<br>

				<input type="hidden" name="userId" value="${user.id}"> 
				<input type="submit" value="Add Lesson Plan">
			</form>
		</div>
	</div>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>