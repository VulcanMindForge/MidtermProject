<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<body>
<div class="container">
	<div class="bg-image text-center rounded-3 mt-2 d-flex justify-content-center align-items-center h-100">
			<div class="form w-75">
				<div class="text-white form align-middle">
					<h4>School Year: ${standard.standardYear }<br> 
					State: ${standard.state } <br>
					<a href="${standard.url}">Link to State Standard</a> <br> 
					Grade: ${standard.gradeLevel.name } <br>
					Subject: ${standard.subject.title } <br>
					Standard: ${standard.description } <br>

					<c:forEach var="resource" items="${standard.resources}">
		Resources that use this Standard: <a href="viewResource.do?resourceId=${resource.id}">${resource.title}</a> 
	<br>
					</c:forEach>
					</h4>
					<form class="form" action="standardAdd.do">
						<input type="hidden" value="${user.id}" name="userId">
						<input class="btn btn-success" type="submit" value="Add Another Standard">
					</form>
					<form class="form" action="account.do">
						<input type="hidden" value="${user.id}" name="userId">
						<input class="btn btn-success" type="submit" value="Return to Account">
					</form>
					
				</div>
			</div>
		</div>
</div>
</body>
<%@ include file="includes/footer.jsp"%>
</html>