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
					<h2>${resource.title}</h2>
					<a href="${resource.url }"> Link to external resource</a>
					<h2>Standards this resource covers</h2>
					<c:forEach var="standard" items="${resource.standards }">
						${standard.gradeLevel.name}, ${standard.subject.title}: ${standard.description }
					</c:forEach>

					<form class="form" action="standardAdd.do">
						<input type="hidden" value="${user.id}" name="userId"> <input
							class="btn btn-success" type="submit"
							value="Add Another Resource">
					</form>
					<form class="form" action="account.do">
						<input type="hidden" value="${user.id}" name="userId"> <input
							class="btn btn-success" type="submit" value="Return to Account">
					</form>
				</div>
			</div>
		</div>
	</div>							
</body>
<%@ include file="includes/footer.jsp"%>
</html>