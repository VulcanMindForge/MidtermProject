<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<body>
<div class="container">
	<div class="text-center bg-image rounded-3 mt-2">
			<div class="d-flex justify-content-center align-items-center h-100">
				<div class="text-white form">
					School Year: ${standard.standardYear } <br> 
					State: ${standard.state } <br>
					<a href="${standard.url}">Link to State Standard</a> <br> 
					Grade: ${standard.gradeLevel.name } <br>
					Subject: ${standard.subject.name } <br>
					Standard: ${standard.description } <br>

					<c:forEach var="resource" items="${standard.resources}">
		Resources that use this Standard: <a href="viewResource.do?resourceId=${resource.id}">${resource.title}</a>
	<br>
					</c:forEach>
				</div>
			</div>
		</div>
</div>
</body>
<%@ include file="includes/footer.jsp"%>
</html>