<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<body>
<ul>
<li>First Name: ${user.firstname }</li>
<li>Last Name: ${user.lastname }</li>
<li>Username: ${user.username }</li>
</ul>
</body>
<%@ include file="includes/footer.jsp"%>
</html>