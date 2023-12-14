<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<body>
	<div class="container">
		<form class="form" action="lessonPlanAdd.do" method="POST">
			<label for="planTitle">Title: </label>
			<c:choose>
			<c:when test="${lessonPlan ne null }">
			<input type="text" name="planTitle" value = "${lessonPlan.title}"> 
			</c:when>
			<c:when test="${lessonPlan eq null }">
			<input type="text" name="planTitle" > 
			</c:when>
			</c:choose> 
			<br>
			<label for="planDescription">Description: </label>
			<c:choose>
			<c:when test="${lessonPlan ne null }">
			<input type="text" name="planDescription" value = "${lessonPlan.title}"> 
			</c:when>
			<c:when test="${lessonPlan eq null }">
			<input type="text" name="planDescription" > 
			</c:when>
			</c:choose> 
			<br>
			Shared: <label
				for="yes">Yes: </label> <input type="checkbox" name="shared"
				value="true" id="yes"> <label for="no">No: </label> <input
				type="checkbox" name="shared" value="false" id="no">
			<div>
			
				<c:if test="${assignments ne null}">
			<h3>Current Assignments</h3>
				<c:forEach items="${assignments}" var="assignment">
				${assignment.title } ${assignment.description } ${assignment.student }
				<br>
				</c:forEach>
				</c:if>	
			<br>
			<h2>Add Assignment</h2>
			<label for="assignmentTitle">Assignment Title: </label>
			<input	type="text" id="assignmentTitle" name="assignmentTitle">
			  <br>
			 <label	for="assignmentDescription">Assignment Description: </label>
			 <input	type="text" id="assignmentDescription" name="assignmentDescription">
			 <br>
			<label for="dueDate">Due Date: </label> <input type="date"
				id="dueDate" name="dueDate"> 
				<br>
				<label for="resource">Resource
				for Assignment: </label> <select name="resource">
				<c:forEach items="${resources}" var="resource">
					<option name="${resource.id}">${resource.id}</option>
				</c:forEach>
			</select> 
			
			<label for="student">Student: </label> 
			<select name="student">
				<c:forEach items="${students}" var="student">
					<option name="${student.id }">${student.id}</option>
				</c:forEach>
			</select>
				<c:if test="${lessonPlan ne null}">
				<input type="hidden" name="planId" value="${lessonPlan.id}"> 
				</c:if>
				<input type="hidden" name="teacher" value="${user.id}"> 
				<input type="submit" value="Add Assignment">
			</div>
			Lesson Plan Complete? 
			<label for="yes">Yes: </label> <input type="checkbox" name="finished" value="true" id="yes"> 
			<label for="no">No: </label> <input	type="checkbox" name="finished" value="false" id="no">
			<input type="submit" value="Submit Plan">
		</form>
	</div>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>