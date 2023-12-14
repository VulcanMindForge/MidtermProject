<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<body>


	${standard.standardYear }
	<br> ${standard.state }
	<br> ${standard.url }
	<br> ${standard.gradeLevel }
	<br> ${standard.subject }
	<br> ${standard.description }
	<br>

	<c:forEach var="resource" items="${standard.resources }">
		${resource.title}
	<br>
	</c:forEach>
</body>
<%@ include file="includes/footer.jsp"%>
</html>