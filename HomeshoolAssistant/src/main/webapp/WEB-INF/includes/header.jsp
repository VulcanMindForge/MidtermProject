<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="head.jsp"%>
<style>
    .nav-link:hover {
        color: #007bff;
        text-decoration: underline;
    }
</style>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" href="home.do">Home</a></li>
                </ul>
                <ul class="navbar-nav">
                    <c:if test="${not login}">
                        <li class="nav-item"><a class="nav-link" href="register.do">Register</a></li>
                    </c:if>
                    
                    <c:if test="${not login}">
                        <li class="nav-item"><a class="nav-link" href="login.do">Log In</a></li>
                    </c:if>

                    <c:if test="${login eq true}">
                        <li class="nav-item"><a class="nav-link" href="account.do">Account</a></li>
                    </c:if>

                    <c:if test="${login eq true}">
                        <li class="nav-item"><a class="nav-link" href="message.do">Chat</a></li>
                    </c:if>
                    
                    <c:if test="${login eq true}">
                        <li class="nav-item"><a class="nav-link" href="logout.do">Logout</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</body>
</html>
