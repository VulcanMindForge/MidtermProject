<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<style>
a:hover {
	text-decoration: underline;
}

.welcome-container {
	text-align: center;
}

.welcome-container h1, .welcome-container h4 {
	color: #fff;
	margin-bottom: 20px;
}

.btn-outline-light {
	margin-right: 10px;
}

.about-container {
	margin-top: 50px;
}
</style>

</head>
<body>
	<!-- ======= About Section ======= -->
	<section id="about">
		<div class="container" data-aos="fade-up">
			<div class="row about-container">

				<div class="col-lg-6 content order-lg-1 order-2">
					<h2 class="title">A Few Words About Us</h2>
					<p>We feel that home schooling should maintain the same
						standards as public school. To better ensure our children don't
						fall behind if they return to school, or if they pursue higher
						learning.</p>

					<div class="icon-box">
						<h4 class="title">
							<a
								href="https://www.understood.org/en/articles/state-academic-standards-what-you-need-to-know">A
								brief overview of what a state education standard is.</a>
						</h4>
						<p class="description">Educational standards describe what
							students should know and be able to do in each subject in each
							grade. The State Board of Education decides on the standards for
							all students, from kindergarten through high school.</p>
					</div>

					<div class="icon-box">
						<h4 class="title">
							<a href="https://www.khanacademy.org/">Kahn Academy</a>
						</h4>
						<p class="description">A great resource for supplementing your
							assignments. Also great to use as a milestone when checking if a
							grades standards have been met</p>
					</div>

					<div class="icon-box">
						<h4 class="title">
							<a
								href="https://www.homeschool.com/articles/homeschooling-tips-for-beginners/">Some
								great beginner tips for homeschoolers!</a>
						</h4>
						<p class="description">Another fantastic site for finding
							resources, tips, and information when starting out as a
							homeschooling parent.</p>
					</div>

				</div>

				<div class="col-lg-6 background order-lg-2 order-1"
					data-aos="fade-left" data-aos-delay="100"></div>
			</div>

		</div>
	</section>
	<!-- End About Section -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

</body>

</html>