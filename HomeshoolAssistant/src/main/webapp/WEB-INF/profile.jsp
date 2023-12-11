<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<body>
<ul>
<li>First Name: ${user.firstName }</li>
<li>Last Name: ${user.lastName }</li>
<li>Username: ${user.username }</li>
</ul>
</body>
<%@ include file="includes/footer.jsp"%>
</html>