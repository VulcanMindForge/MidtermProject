<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<body>
<div class="container">
	<form class="form" action="resourceAdd.do" method="POST">
		<label for="title">Title: </label> <input type="text" name="title">
		<br>
		<label for="url">URL: </label> 
		<input type="text" name="url"> 
		<br>
		
		<c:forEach var="standard" items="${standards }">
		<%-- <input type="hidden" name="${standard.id }" value="checked"> --%>
		<input type="checkbox" id="${standard.id}" name="standards" value="${standard.id }">
		<label for="${standard.id}">${standard.gradeLevel}, ${standard.subject}, ${standard.description }</label>
		<c:if test=""></c:if>
		<br>
		</c:forEach>
		
		<input type="hidden" name="userId"
			value="${user.id}"> <input type="submit">
</div>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>