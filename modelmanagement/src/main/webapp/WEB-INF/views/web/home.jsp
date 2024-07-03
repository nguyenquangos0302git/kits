<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body style="position: relative">
	<div id="random-image" class="hero-wrap js-fullheight"
		style="height: 969px;">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" style="height: 969px;">
				<h3 class="v">Modist of comedians</h3>
				<h3 class="vr">Since - 2020</h3>
				<div class="col-md-11 ftco-animate text-center fadeInUp ftco-animated">
					<h1>Our Stylist</h1>
					<h2>
						<span>Youthful - Dynamic</span>
					</h2>
				</div>
				<div class="mouse">
					<a href="#" class="mouse-icon">
						<div class="mouse-wheel">
							<span class="ion-ios-arrow-down"></span>
						</div>
					</a>
				</div>
			</div>
			
		</div>
	</div>

	<div class="goto-here"></div>

	<section class="ftco-section ftco-product">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<h1 class="big">Faces</h1>
					<h2 class="mb-4">Hot Faces</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="product-slider owl-carousel ftco-animate">
					<c:forEach items="${modelTopList}" var="item">
						<div class="item">
							<div class="product">
								<a href="<c:url value="/model-detail/${item.getId() }"/>" class="img-prod"><img class="img-fluid" style="height: 470px;"
									src="<c:url value = '${item.getImgLink() }' />" alt="Colorlib Template"></a>
								<div class="text pt-3 px-3">
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
							<c:if test="${item.getRating() >= 0 && item.getRating() < 0.5 }">
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${item.getRating() >= 0.5 && item.getRating() < 1.5 }">
							<span class="fa fa-star checked " style="color: orange"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ item.getRating() >=1.5 && item.getRating() <2.5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${item.getRating() >= 2.5 && item.getRating() <3.5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ item.getRating() >= 3.5 && item.getRating() <4.5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ item.getRating() >=4.5 && item.getRating() <=5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							</c:if>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-no-pb ftco-no-pt bg-light">
		<div class="container">
			<div class="row">
				<div
					class="col-md-5 p-md-5 img img-2 d-flex justify-content-center align-items-center"
					style="background-image: url(<%=contextPath%>/resources/images/model/male/thanhan4.jpg); background-size:contain;">

				</div>
				<div class="col-md-7 py-5 wrap-about pb-md-5 ftco-animate">
					<div class="heading-section-bold mb-5 mt-md-5">
						<div class="ml-md-0">
							<h2 class="mb-4">
								Comedians <br>Model <br> <span>Company</span>
							</h2>
						</div>
					</div>
					<div class="pb-md-5">
						<p>Comedians is one of the leading companies in Vietnam in
							training and providing models in fashion shows, photo shoots,
							advertising MVs, singers, receptionists & PG / PB.
							Professionalism - Enthusiasm and always in that job are Venus's
							working style. Venus models have participated in major domestic
							and international beauty contests and are honored to achieve many
							high achievements such as:</p>
						
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<h1 class="big">Models</h1>
					<h2 class="mb-4">Our Models</h2>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm col-md-6 col-lg ftco-animate">
					<div class="product">
						<a href="<c:url value="/model-detail/${femaleModel.get(0).getId() }"/>" class="img-prod"><img class="img-fluid"
							src="<c:url value = '${femaleModel.get(0).getImgLink() }' />" alt="Colorlib Template"></a>
						<div class="text py-3 px-3">
							<h3>
								Female Model
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>${femaleModel.get(0).getRank() }</span>
									</p>
								</div>
								<div class="rating">
									<p class="text-right">
										<c:if test="${femaleModel.get(0).getRating() >= 0 && femaleModel.get(0).getRating() < 0.5 }">
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${femaleModel.get(0).getRating() >= 0.5 && femaleModel.get(0).getRating() < 1.5 }">
							<span class="fa fa-star checked " style="color: orange"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ femaleModel.get(0).getRating() >=1.5 && femaleModel.get(0).getRating() <2.5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${femaleModel.get(0).getRating() >= 2.5 && femaleModel.get(0).getRating() <3.5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ femaleModel.get(0).getRating() >= 3.5 && femaleModel.get(0).getRating() <4.5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ femaleModel.get(0).getRating() >=4.5 && femaleModel.get(0).getRating() <=5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							</c:if>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm col-md-6 col-lg ftco-animate">
					<div class="product">
						<a href="<c:url value="/model-detail/${maleModel.get(0).getId() }"/>" class="img-prod"><img class="img-fluid"
							src="<c:url value = '${maleModel.get(0).getImgLink() }' />" alt="Colorlib Template"></a>
						<div class="text py-3 px-3">
							<h3>
								Male Model
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>${maleModel.get(0).getRank() }</span>
									</p>
								</div>
								<div class="rating">
									<p class="text-right">
							<c:if test="${maleModel.get(0).getRating() >= 0 && maleModel.get(0).getRating() < 0.5 }">
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${maleModel.get(0).getRating() >= 0.5 && maleModel.get(0).getRating() < 1.5 }">
							<span class="fa fa-star checked " style="color: orange"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ maleModel.get(0).getRating() >=1.5 && maleModel.get(0).getRating() <2.5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${maleModel.get(0).getRating() >= 2.5 && maleModel.get(0).getRating() <3.5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ maleModel.get(0).getRating() >= 3.5 && maleModel.get(0).getRating() <4.5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ maleModel.get(0).getRating() >=4.5 && maleModel.get(0).getRating() <=5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							</c:if>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm col-md-6 col-lg ftco-animate">
					<div class="product">
						<a href="<c:url value="/model-detail/${kidModel.get(9).getId() }"/>" class="img-prod"><img class="img-fluid"
							src="<c:url value = '${kidModel.get(9).getImgLink() }' />" alt="Colorlib Template"></a>
						<div class="text py-3 px-3">
							<h3>
								Kid Model
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>${kidModel.get(9).getRank() }</span>
									</p>
								</div>
								<div class="rating">
									<p class="text-right">
							<c:if test="${kidModel.get(9).getRating() >= 0 && kidModel.get(9).getRating() < 0.5 }">
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${kidModel.get(9).getRating() >= 0.5 && kidModel.get(9).getRating() < 1.5 }">
							<span class="fa fa-star checked " style="color: orange"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ kidModel.get(9).getRating() >=1.5 && kidModel.get(9).getRating() <2.5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${kidModel.get(9).getRating() >= 2.5 && kidModel.get(9).getRating() <3.5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ kidModel.get(9).getRating() >= 3.5 && kidModel.get(9).getRating() <4.5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ kidModel.get(9).getRating() >=4.5 && kidModel.get(9).getRating() <=5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							</c:if>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm col-md-6 col-lg ftco-animate">
					<div class="product">
						<a href="<c:url value="/model-detail/${newModel.get(0).getId() }"/>" class="img-prod"><img class="img-fluid"
							src="<c:url value = '${newModel.get(0).getImgLink() }' />" alt="Colorlib Template"></a>
						<div class="text py-3 px-3">
							<h3>
								New Face
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>${newModel.get(0).getRank() }</span>
									</p>
								</div>
								<div class="rating">
									<p class="text-right">
							<c:if test="${newModel.get(0).getRating() >= 0 && newModel.get(0).getRating() < 0.5 }">
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${newModel.get(0).getRating() >= 0.5 && newModel.get(0).getRating() < 1.5 }">
							<span class="fa fa-star checked " style="color: orange"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ newModel.get(0).getRating() >=1.5 && newModel.get(0).getRating() <2.5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${newModel.get(0).getRating() >= 2.5 && newModel.get(0).getRating() <3.5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ newModel.get(0).getRating() >= 3.5 && newModel.get(0).getRating() <4.5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ newModel.get(0).getRating() >=4.5 && newModel.get(0).getRating() <=5 }">
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							<span class="fa fa-star checked"style="color: orange"></span>
							</c:if>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section testimony-section bg-light">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<h1 class="big">Testimony</h1>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-8 ftco-animate">
					<div class="row ftco-animate">
						<div class="col-md-12">
							<div class="carousel-testimony owl-carousel ftco-owl">
								<div class="item">
									<div class="testimony-wrap py-4 pb-5">
										<div class="user-img mb-4"
											style="background-image: url(<%=contextPath%>/resources/images/system/avatar/system_avatar_1.jpg)">
											<span
												class="quote d-flex align-items-center justify-content-center">
												<i class="icon-quote-left"></i>
											</span>
										</div>
										<div class="text text-center">
											<p class="mb-4">The quality of the company's model is excellent.</p>
											<p class="name">Ho Tan Giang</p>
											<span class="position">Customer</span>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="testimony-wrap py-4 pb-5">
										<div class="user-img mb-4"
											style="background-image: url(<%=contextPath%>/resources/images/system/avatar/system_avatar_2.jpg)">
											<span
												class="quote d-flex align-items-center justify-content-center">
												<i class="icon-quote-left"></i>
											</span>
										</div>
										<div class="text text-center">
											<p class="mb-4">Very fast search feature. More than expected</p>
											<p class="name">Hoang Tien Dung</p>
											<span class="position">Customer</span>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="testimony-wrap py-4 pb-5">
										<div class="user-img mb-4"
											style="background-image: url(<%=contextPath%>/resources/images/system/avatar/system_avatar_3.jpg)">
											<span
												class="quote d-flex align-items-center justify-content-center">
												<i class="icon-quote-left"></i>
											</span>
										</div>
										<div class="text text-center">
											<p class="mb-4">Thanks to the company's modeling, our events are highly appreciated.</p>
											<p class="name">Nguyen Viet Sang</p>
											<span class="position">Customer</span>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="testimony-wrap py-4 pb-5">
										<div class="user-img mb-4"
											style="background-image: url(<%=contextPath%>/resources/images/system/avatar/system_avatar_4.jpg)">
											<span
												class="quote d-flex align-items-center justify-content-center">
												<i class="icon-quote-left"></i>
											</span>
										</div>
										<div class="text text-center">
											<p class="mb-4">The company's model is very diverse, I have many choices to suit my event.</p>
											<p class="name">Phan Nguyen Hoang Minh</p>
											<span class="position">Customer</span> 
										</div>
									</div>
								</div>
								<div class="item">
									<div class="testimony-wrap py-4 pb-5">
										<div class="user-img mb-4"
											style="background-image: url(<%=contextPath%>/resources/images/system/avatar/system_avatar_5.jpg">
											<span
												class="quote d-flex align-items-center justify-content-center">
												<i class="icon-quote-left"></i>
											</span>
										</div>
										<div class="text text-center">
											<p class="mb-4">Very good quality at an affordable price. A great company.</p>
											<p class="name">Nguyen Thanh Nhat Quang</p>
											<span class="position">Customer</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script type="text/javascript">
	window.onload = function(){
		var img_arr = ["url(${slideList.get(0).getImg() })","url(${slideList.get(1).getImg() })","url(${slideList.get(2).getImg() })"];
		document.getElementById('random-image').style.backgroundImage = "url(${slideList.get(2).getImg() })"; 
		var index = 0;
		var interval = 9000;
		function slide(){
			document.getElementById('random-image').style.backgroundImage = img_arr[index++%img_arr.length];
			fadeIn(document.getElementById('random-image'));
	    }
	    setInterval(slide,interval);
	}
	function fadeIn(img) {
	    var op = 0.3;
	    var timer = setInterval(function () {
	        if (op >=1 ) {
	            clearInterval(timer);
	        }
	        img.style.opacity = op;
	        op += op * 0.02;
	    }, 5);
	}
	</script>
</body>
</html>