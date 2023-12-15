<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<%@ include file="includes/header.jsp"%>
<body>

	<div class="text-center bg-image rounded-3 mt-2"
		style="background-image: url('https://images.pexels.com/photos/4260325/pexels-photo-4260325.jpeg?auto=compress&amp;cs=tinysrgb&amp;w=1260&amp;h=750&amp;dpr=1'); background-repeat: no-repeat; background-size: cover; height: 75vh;">
		<div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
			<div class="d-flex justify-content-center align-items-center h-100">
				<div class="text-white">
					<h1 class="mb-3">Welcome to Homeschool Assistant</h1>
					<h4 class="mb-3">We are happy to help make homeschooling easy</h4>

					<a class="btn btn-outline-light btn-lg" href="register.do"
						role="button">Register</a> <a class="btn btn-outline-light btn-lg"
						href="login.do" role="button">Login</a>

				</div>
			</div>
		</div>
	</div>


	<!-- ======= About Section ======= -->
	<section id="about">
		<div class="container" data-aos="fade-up">
			<div class="row about-container">

				<div class="col-lg-6 content order-lg-1 order-2">
					<h2 class="title">Few Words About Us</h2>
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
							all students, from kindergarten through high school.p>
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
							<a href="https://www.homeschool.com/articles/homeschooling-tips-for-beginners/">Some great beginner tips for homeschoolers!</a>
						</h4>
						<p class="description">Another fantastic site for finding resources, tips, and information when starting out as a homeschooling parent.</p>
					</div>

				</div>

				<div class="col-lg-6 background order-lg-2 order-1"
					data-aos="fade-left" data-aos-delay="100"></div>
			</div>

		</div>
	</section>
	<!-- End About Section -->
</body>
<%@ include file="includes/footer.jsp"%>
</html>