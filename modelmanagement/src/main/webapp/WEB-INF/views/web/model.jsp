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
<title>Model</title>


</head>
<body>
	<button onclick="topFunction()" id="myBtn" title="Go to top"
		style="display: block; position: fixed; bottom: 20px; right: 22px; z-index: 99; border: none; outline: none; background-color: #f1b8c4; color: white; cursor: pointer; padding: 8px; border-radius: 4px; width: 50px; height: 50px;">
		<i style="font-size: x-large;" class="fa fa-chevron-up"
			aria-hidden="true"></i>
	</button>
	<div class="hero-wrap hero-bread"
		style="background-image: url('<%=contextPath%>/resources/web/images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-0 bread">Collection</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="home">Home</a></span> <span>Product</span>
					</p>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section bg-light">
		<div class="container-fluid" style="padding-right: inherit;">

			<div class="row">

				<div class="row1" style="width: 20%; padding: 0 10px;">
					<div style="position: sticky; top: 76px;">
						<div class="slide-filter" style="margin-bottom: 25px;">
							<p>
								Age: Less than or equal &nbsp<span id="demo"></span>
							</p>
							
							<input type="range" min="${selectAge.get(0)}"
								max="${selectAge.get(selectAge.size() - 1)}"
								value="${selectAge.get(selectAge.size() - 1)}" class="slide-small-filter"
								id="myRange">
						</div>
						<hr>
						<form style="position: relative; padding-bottom: 10px;">
							<button type="submit"
								style="position: absolute; top: 11px; left: 9px; background-color: white; border: none; font-size: 18px;">
								<i class="fa fa-search" aria-hidden="true"
									style="color: #f48fb1;"></i>
							</button>
							<input type="textS" name="search"
								placeholder="Search by name ..." style="cursor: inherit;"
								id="searchNameModel">
						</form>
						<article class="card-group-item">
							<form>
								<header class="card-header">
									<h6 class="title" style="margin-bottom: 0;">Talents</h6>
								</header>
								<div class="filter-content">
									<div class="card-body">

										<c:forEach items="${allTalent}" var="item">
											<label class="form-check"> <input
												class="form-check-input-talent" type="checkbox"
												value="${item.id }"> <span class="form-check-label">${item.name}</span>
											</label>
											<!-- form-check.// -->
										</c:forEach>
									</div>
								</div>
								<!-- card-body.// -->

								<header class="card-header">
									<h6 class="title" style="margin-bottom: 0;">Ranks</h6>
								</header>
								<div class="filter-content">
									<div class="card-body">

										<c:forEach items="${allRank}" var="item">

											<label class="form-check"> <input
												class="form-check-input-ranks" type="checkbox"
												value="${item.id }"> <span class="form-check-label">${item.name}&nbsp
													${item.price}$</span>
											</label>
											<!-- form-check.// -->
										</c:forEach>

									</div>

									<hr>

								</div>
								<!-- card-body.// -->

								<!-- 	<hr> -->

								<!-- <div>
									<p style="margin-bottom: 10px;">Free days:</p>
									<label for="fromDay">From:<input type="date"
										id="fromDay" name="fromDay" style="margin-left: 25px;"></label>
									<label for="toDay">To:<input type="date" id="toDay"
										name="toDay" style="margin-left: 44.5px; margin-bottom: 8px;"></label>
								</div> -->




								<!-- <hr> -->
								<!-- <div style="text-align: center;">
									<input class="check-filter" type="submit">
								</div> -->
							</form>
						</article>

						<!-- card-group-item.// -->
					</div>
				</div>

				<div class="row2" style="float: right; width: 80%;">

					<div class="row3">
						<%-- <c:forEach items="${modelList}" var="item">
						
						<div class="product" style="display:inline-block;width:24%;">
							<a href="<c:url value="/model-detail/${item.getId()}"/>" class="img-prod"><img class="img-fluid" style="width:100%;height:470px;float:left;padding:0 5px;"

								src="<c:url value = '${item.getImgLink() }' />"
								alt="Colorlib Template"></a>
							<div class="text py-3 px-3">
								<h3>
									<a href="#">${item.getName() }</a>
								</h3>
								<div class="d-flex">
									<div class="pricing">
										<p class="price">
											<span class="price-sale">${item.getRank() }</span>
										</p>
									</div>
									<div class="rating">
										<p class="text-right">
											<span class="ion-ios-star-outline"></span> <span
												class="ion-ios-star-outline"></span> <span
												class="ion-ios-star-outline"></span> <span
												class="ion-ios-star-outline"></span> <span
												class="ion-ios-star-outline"></span>
										</p>
									</div>
								</div>
								<hr>
								<p>Decription:</p>
							</div>
						</div>
						
					</c:forEach> --%>
					</div>
					<div style="display: flex; justify-content: center;">
						<ul class="pagination" id="pagination"></ul>
					</div>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col text-center">
					<!-- <div class="block-27">
						<ul>
							<li><a href="#">&lt;</a></li>
							<li class="active"><span>1</span></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&gt;</a></li>
						</ul>
					</div> -->
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section-parallax">
		<div class="parallax-img d-flex align-items-center">
			<div class="container">
				<div class="row d-flex justify-content-center py-5">
					<div class="col-md-7 text-center heading-section ftco-animate">
						<h1 class="big">Subscribe</h1>
						<h2>Subcribe to our Newsletter</h2>
						<div class="row d-flex justify-content-center mt-5">
							<div class="col-md-8">
								<form action="#" class="subscribe-form">
									<div class="form-group d-flex">
										<input type="text" class="form-control"
											placeholder="Enter email address"> <input
											type="submit" value="Subscribe" class="submit px-3">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		//Get the button
		var mybutton = document.getElementById("myBtn");

		// When the user scrolls down 20px from the top of the document, show the button
		window.onscroll = function() {
			scrollFunction()
		};

		function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				mybutton.style.display = "block";
			} else {
				mybutton.style.display = "none";
			}
		}

		// When the user clicks on the button, scroll to the top of the document
		function topFunction() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
		}
		
		/* let pathUrlParam = url.split('/');
		pathUrlParam = pathUrlParam[pathUrlParam.length - 1];
		if(pathUrlParam === 'kids'){
			var rangeKids;
		} */
		/* var slider = document.getElementById("myRange");

		var output = document.getElementById("demo");
		output.innerHTML = slider.value;

		slider.oninput = function() {
			output.innerHTML = this.value;
		} */

		/* $('#pagination-demo').twbsPagination({
			totalPages : 50,
			visiblePages : 5
		}); */
	</script>

	<script type="text/javascript"
		src="<c:url value="/resources/private/user/model/js/index.js"/>"></script>



</body>
</html>