<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<body>
<h2>${resource.title}</h2>
<a href="${resource.url }"> Link to external resource</a>
<h2>Standards this resource covers</h2>
<c:forEach var="standard" items="${resource.standards }">

${standard.description }
</c:forEach>

${standard }

</body>
<%@ include file="includes/footer.jsp"%>
</html>