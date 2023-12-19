<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<body>
	<div class="container">
		<div
			class="bg-dark text-center rounded-3 mt-2 d-flex justify-content-center align-items-center h-100">
			<form class="form w-75 center" action="/account/edit_accountForm.jsp"
				method="POST">

				<h1>${user.role}Account</h1>

				<h5>Your Information:</h5>

				<strong>First Name: </strong>${user.firstName }<br> <strong>Last
					Name: </strong>${user.lastName }<br> <strong>Username: </strong>${user.username }<br>

				<br> <br>

				<c:if test="${user.role eq 'Student'}">
					<h3>Assignments not completed</h3>
					<table class="table">
						<tbody>
							<c:forEach items="${assignments}" var="assignment">
								<c:if test="${assignment.completed ne true}">
									<tr>
										<td><a
											href="viewAssignment.do?assignmentId=${assignment.id}">${assignment.title}</a></td>
										<td>${assignment.description}</td>

										<c:if test="${user.id eq assignment.student.id}">
											<td>${user.firstName}${user.lastName}</td>
										</c:if>

										<td>${assignment.completed}</td>
										<td>${assignemtn.grade}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
					<br>
					<h3>Assignments completed and graded</h3>
					<div class="container">
						<table class="table">
							<tbody>
								<c:forEach items="${assignments}" var="assignment">
									<c:if test="${assignment.completed eq true}">
										<c:if test="${assignment.grade ne null}">
											<tr>
												<td><a
													href="viewAssignment.do?assignmentId=${assignment.id}">${assignment.title}</a></td>
												<td>${assignment.description}</td>

												<c:if test="${user.id eq assignment.student.id}">
													<td>${user.firstName}${user.lastName}</td>
												</c:if>

												<td>${assignment.completed}</td>
												<td>${assignment.grade}</td>
											</tr>
										</c:if>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:if>


				<c:if test="${user.role eq 'Teacher'}">
					<h5>Student(s):</h5>
					<c:forEach var="student" items="${students}">

						<a href="getAccount.do?userId=${student.id}">${student.firstName}
							${student.lastName}</a>
						<br>

					</c:forEach>

					<br>
					<a class="btn btn-primary" href="add_accountForm">Add Students</a>
					<br>
					<h3>Assignments To Grade</h3>
					<table class="table">
						<tbody>
							<c:forEach items="${plans}" var="plan">
								<c:forEach items="${plan.assignments}" var="assignment">
									<c:if test="${assignment.completed eq true}">
										<c:if test="${assignment.grade eq null}">
											<tr>
												<td><a
													href="viewAssignment.do?assignmentId=${assignment.id}">${assignment.title}</a></td>
												<td>${assignment.description}</td>
												<c:forEach items="${users}" var="user">
													<c:if test="${user.id eq assignment.student.id}">
														<td>${user.firstName}${user.lastName}</td>
													</c:if>
												</c:forEach>
												<td>${assignment.completed}</td>
												<td>${assignemtn.grade}</td>
											</tr>
										</c:if>
									</c:if>
								</c:forEach>
							</c:forEach>
						</tbody>
					</table>
					<br>
					<h3>Assignments not completed</h3>
					<table class="table">
						<tbody>
							<c:forEach items="${plans}" var="plan">
								<c:forEach items="${plan.assignments}" var="assignment">
									<c:if test="${assignment.completed ne true}">
										<tr>
											<td><a
												href="viewAssignment.do?assignmentId=${assignment.id}">${assignment.title}</a></td>
											<td>${assignment.description}</td>
											<c:forEach items="${users}" var="user">
												<c:if test="${user.id eq assignment.student.id}">
													<td>${user.firstName}${user.lastName}</td>
												</c:if>
											</c:forEach>
											<td>${assignment.completed}</td>
											<td>${assignemtn.grade}</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:forEach>
						</tbody>
					</table>
					<br>
					<h3>Assignments completed and graded</h3>
					<div class="container">
						<table class="table">
							<tbody>
								<c:forEach items="${plans}" var="plan">
									<c:forEach items="${plan.assignments}" var="assignment">
										<c:if test="${assignment.completed eq true}">
											<c:if test="${assignment.grade ne null}">
												<tr>
													<td><a
														href="viewAssignment.do?assignmentId=${assignment.id}">${assignment.title}</a></td>
													<td>${assignment.description}</td>
													<c:forEach items="${users}" var="user">
														<c:if test="${user.id eq assignment.student.id}">
															<td>${user.firstName}${user.lastName}</td>
														</c:if>
													</c:forEach>
													<td>${assignment.completed}</td>
													<td>${assignemtn.grade}</td>
												</tr>
											</c:if>
										</c:if>
									</c:forEach>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<br>
					<h2>Lesson Plans</h2>
					<div class="container">
						<table class="table">
							<tbody>
								<c:forEach items="${plans}" var="plan">
									<tr>
										<td><a href="lessonPlan.do?planId=${plan.id }">${plan.title}</a></td>
										<td>${plan.description}</td>
										<c:forEach items="${plan.assignments}" var="assignment">
											<c:forEach items="${users}" var="user">
												<c:if test="${user.id eq assignment.student.id}">

													<td>${assignment.title}<br>${user.firstName}
														${user.lastName}
													</td>
												</c:if>
											</c:forEach>
										</c:forEach>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="container">
						<a class="btn btn-primary"
							href="addLessonPlan.do?userId=${user.id }"> Add Lesson Plan </a>
						<a class="btn btn-primary"
							href="resourceAdd.do?userId=${user.id }"> Add Resource </a> <a
							class="btn btn-primary" href="standardAdd.do?userId=${user.id }">
							Add Standard </a>
					</div>
				</c:if>

			</form>
		</div>
	</div>
</body>
<%@ include file="includes/footer.jsp"%>

</html>