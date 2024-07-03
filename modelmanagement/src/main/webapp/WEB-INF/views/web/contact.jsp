<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact</title>
</head>
<body>
	<div class="hero-wrap hero-bread"
		style="background-image: url('<%=contextPath%>/resources/web/images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-0 bread">Contact Us</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="home">Home</a></span> <span>Contact</span>
					</p>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section contact-section bg-light">
		<div class="container">
			<div class="row block-9">
				<div class="col-md-6 order-md-last d-flex">
					<form:form action="contact" class="bg-white p-5 contact-form"
						modelAttribute="contactModel" method="post">

						<div class="form-group">
							<form:input type="text" path="name" class="form-control"
								placeholder="Your Name" />
						</div>
						<div class="form-group">
							<form:input path="email" type="text" class="form-control"
								placeholder="Your Email" />
						</div>

						<div class="form-group">
							<form:textarea path="message" type="text" cols="30" rows="7"
								class="form-control" placeholder="Message"></form:textarea>
						</div>
						<div class="form-group">
							<input type="submit" value="Send Message"
								class="btn btn-primary py-3 px-5" style="display: block;
    																		margin: 0 auto;">
						</div>
					</form:form>

				</div>
				

			</div>
			<div class="row d-flex mt-5 contact-info">
				<div class="w-100"></div>
				<div class="col-md-3 d-flex">
					<div class="info bg-white p-4">
						<p>
							<span>Address:</span> 98 Tran Van Du Street, Tan Binh, TPHCM
						</p>
					</div>
				</div>
				<div class="col-md-3 d-flex">
					<div class="info bg-white p-4">
						<p>
							<span>Phone:</span> <a href="tel://1234567920">+2 392 3929 210</a>
						</p>
					</div>
				</div>
				<div class="col-md-3 d-flex">
					<div class="info bg-white p-4">
						<p>
							<span>Email:</span> <a href="mailto:info@yoursite.com">comedians@gmail.com</a>
						</p>
					</div>
				</div>
				<div class="col-md-3 d-flex">
					<div class="info bg-white p-4">
						<p>
							<span>Website</span> <a href="#">modelQ.com</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>