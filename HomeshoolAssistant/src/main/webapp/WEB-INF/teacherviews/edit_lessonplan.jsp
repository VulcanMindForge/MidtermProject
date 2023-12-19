<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<body>
	<body>
	<div class="container">
		<div class="bg-image text-center rounded-3 mt-2 d-flex justify-content-center align-items-center h-100">
			<form class="form w-75 center" action="editLessonPlan.do" method="POST">
			<label for="planTitle">Title: </label>
			<input type="text" name="planTitle" value = "${lessonPlan.title}"> 
			<br>
			<label for="planDescription">Description: </label>
			<input type="text" name="planDescription" value = "${lessonPlan.description}"> 
			<br>
				<c:if test="${assignments ne null}">
			<h3>Current Assignments</h3>
				<c:forEach items="${assignments}" var="assignment">
				${assignment.title} ${assignment.description}
				<br>
				</c:forEach>
				</c:if>	
			<br>
			<input type="hidden" name="planId" value="${lessonPlan.id}"> 
			<input type="hidden" name="userId" value="${user.id}"> 
			<input type="submit" value="Submit Plan">
			</form>
		</div>
	</div>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>