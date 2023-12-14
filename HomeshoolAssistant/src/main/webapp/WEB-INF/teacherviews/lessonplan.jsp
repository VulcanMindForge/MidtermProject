<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<body>
	<h1>${lessonPlan.title}</h1>
	<p>${lessonPlan.description }
	<br>
	<h2>Assignments</h2>
	<c:forEach items="${lessonPlan.assignments}" var="assignment">
		<h4>${assignment.title}</h4>
		<p>${assignment.description}</p>
		<h2>Resources</h2>
		<h4>${resource.title }</h4>
		<p>${resource.descripiton }</p>
		<h2>Standards</h2>
		<c:forEach items="${resource.standards }" var="standard">
			<h4>${standard.title }</h4>
			<p>${standard.description }</p>
		</c:forEach>
	</c:forEach>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>