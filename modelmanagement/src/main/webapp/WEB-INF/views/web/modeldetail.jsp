<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Model Detail</title>
<meta charset="utf-8">
</head>
<body>

				<!-- END nav -->
			<style>
			.heading {
				font-size: 25px;
				margin-right: 25px;
			}
			
			.fa {
				font-size: 25px;
			}
			
			.checked {
				color: orange;
			}
			
			/* Three column layout */
			.side {
				float: left;
				width: 15%;
				margin-top: 10px;
			}
			
			.middle {
				margin-top: 10px;
				float: left;
				width: 70%;
			}
			
			/* Place text to the right */
			.right {
				text-align: right;
			}
			
			/* Clear floats after the columns */
			.row:after {
				content: "";
				display: table;
				clear: both;
			}
			
			/* The bar container */
			.bar-container {
				width: 100%;
				background-color: #f1f1f1;
				text-align: center;
				color: white;
			}
			
			/* Individual bars */
			.bar-5 {
				
				height: 18px;
				background-color: #4CAF50;
			}
			
			.bar-4 {
				
				height: 18px;
				background-color: #2196F3;
			}
			
			
			.bar-3 {
				
				height: 18px;
				background-color: #00bcd4;
			}
			
			.bar-2 {
			
				height: 18px;
				background-color: #ff9800;
			}
			
			.bar-1 {
				
				height: 18px;
				background-color: #f44336;
			}
			
			/* Responsive layout - make the columns stack on top of each other instead of next to each other */
			@media ( max-width : 400px) {
				.side, .middle {
					width: 100%;
				}
				.right 
					display: none;
				}
			}
			</style>
	<div class="hero-wrap hero-bread"
		style="background-image: url('${pageContext.request.contextPath}/resources/web/images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-0 bread">Model Detail</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="<c:url value = "/"/>">Home</a></span> <span
							class="mr-2"><a href="<c:url value = "/all"/>">Model</a></span>
					</p>

				</div>

			</div>
		</div>
	</div>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<div>
						<a href="" class="image-popup"><img id="expandedImg"
							style="width: 100%"
							src="<c:url value="/${multiImages.get(0) }" />" class="img-fluid"
							alt="Colorlib Template"></a>
						<div id="imgtext"></div>
					</div>
					<div class="wrap-ima-model">

						
						<c:forEach items="${multiImages}" var="item">							
							<div class="ima-model">
								<img src="<c:url value="/${item}" />"  style="width:100%" onclick="myFunction(this);">

							</div>
						</c:forEach>
					</div>

						<br>
						<c:if test="${not empty ACCOUNT &&  not empty ratingStatus  }">
						
				
					<div class="ratingform">				
						<form method="post" id="rating" action="<c:url value="/model-detail/rating/insert"/>" id="RatingModel">
							<fieldset class="rating" style="padding-left: 170px">
							    <input type="radio" id="star5" name="star" value="5"  required /><label class = "full" for="star5" title=" 5 stars"></label>
							    <input type="radio" id="star4half" name="star" value="4.5" / m><label class="half" for="star4half" title="4.5 stars"></label>
							    <input type="radio" id="star4" name="star" value="4" /><label class = "full" for="star4" title="4 stars"></label>
							    <input type="radio" id="star3half" name="star" value="3.5" /><label class="half" for="star3half" title="3.5 stars"></label>
							    <input type="radio" id="star3" name="star" value="3" /><label class = "full" for="star3" title="3 stars"></label>
							    <input type="radio" id="star2half" name="star" value="2.5" /><label class="half" for="star2half" title="2.5 stars"></label>
							    <input type="radio" id="star2" name="star" value="2" /><label class = "full" for="star2" title="2 stars"></label>
							    <input type="radio" id="star1half" name="star" value="1.5" /><label class="half" for="star1half" title="1.5 stars"></label>
							    <input type="radio" id="star1" name="star" value="1" /><label class = "full" for="star1" title=" 1 star"></label>
							   <input type="radio" id="starhalf" name="star" value="0.5" /><label class="half" for="starhalf" title=" 0.5 stars"></label>
							   <input type="hidden" name="modelid" value="${modelinfo.getId()}">
								<input type="hidden" name="accountid" value="${ACCOUNT.getId()}">
								<c:if test="${ratingStatus.size()>0 }">
								<c:forEach items="${ratingStatus}" var ="status">
								<input type="hidden" name="contractid" value="${status.toString()}">
								</c:forEach>
								</c:if>
							</fieldset>
						  	<input type="submit" value="Your evaluate rating here!" style="width: 100%;background: transparent;color: red" >
						  		
						</form>
					</div>
				
				
				 </c:if>	 	
				<br>
			
				<br>
					
					
					<span class="heading"> Rating detail:</span>
					
					<hr style="border:3px solid #f1f1f1">

					<div class="row">
					  <div class="side">
					    <div>5 star</div>
					  </div>
					  <div class="middle">
					    <div class="bar-container">
					      <div class="bar-5" id="bar-5"></div>
					    </div>
					  </div>
					  <div class="side right">
					    <div>${ratingModel.getFivStar() }</div>
					  </div>
					  <div class="side">
					    <div>4 star</div>
					  </div>
					  <div class="middle">
					    <div class="bar-container">
					      <div class="bar-4"id="bar-4"></div>
					    </div>
					  </div>
					  <div class="side right">
					    <div>${ratingModel.getForStar() }</div>
					  </div>
					  <div class="side">
					    <div>3 star</div>
					  </div>
					  <div class="middle">
					    <div class="bar-container">
					      <div class="bar-3" id="bar-3"></div>
					    </div>
					  </div>
					  <div class="side right">
					    <div>${ratingModel.getThrStar()}</div>
					  </div>
					  <div class="side">
					    <div>2 star</div>
					  </div>
					  <div class="middle">
					    <div class="bar-container">
					      <div class="bar-2" id="bar-2"></div>
					    </div>
					  </div>
					  <div class="side right">
					    <div>${ratingModel.getTwoStar()}</div>
					  </div>
					  <div class="side">
					    <div>1 star</div>
					  </div>
					  <div class="middle">
					    <div class="bar-container">
					      <div class="bar-1" id="bar-1"></div>
					    </div>
					  </div>
					  <div class="side right">
					    <div>${ratingModel.getOneStar()}</div>
					  </div>
					</div>
					
			
				</div>
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h3>${modelinfo.getName() }</h3>
					<p class="price">
						<span>${modelinfo.getRank() }</span>
					</p>
					<p>Height: ${modelinfo.getHeight()}&nbsp m</p>
					<p>Weight: ${modelinfo.getWeight()}&nbspkg</p>
					<p>Age: ${modelinfo.getAge()}</p>
					<p>Gender: ${modelinfo.getGender()}</p>
					<p>Nation: ${modelinfo.getNation()}</p>
					<p>Description: ${modelinfo.getDescription()}</p>
					<p>Measurements: ${modelinfo.getChest()} -
						${modelinfo.getHip()} - ${modelinfo.getWaist()}</p>



					<p>
						Talent(s):
						<c:forEach items="${talentModel}" var="talent">
								&nbsp&nbsp&nbsp<a href="" class="talent-hov">${talent.getTalent()}</a>
						</c:forEach>
					</p>

							<span class="heading">Rating</span>
							<p >
							<c:if test="${modelinfo.getRating() >= 0 && modelinfo.getRating() < 0.5 }">
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${modelinfo.getRating() >= 0.5 && modelinfo.getRating() < 1.5 }">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ modelinfo.getRating() >=1.5 && modelinfo.getRating() <2.5 }">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${modelinfo.getRating() >= 2.5 && modelinfo.getRating() <3.5 }">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ modelinfo.getRating() >= 3.5 && modelinfo.getRating() <4.5 }">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star "></span>
							</c:if>
							<c:if test="${ modelinfo.getRating() >=4.5 && modelinfo.getRating() <=5 }">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							</c:if>
							</p>
							<p>${modelinfo.getRating() } average based on ${ratingModel.getSumStar() } reviews.</p>
				


					<p>
						<a href="" id="btnAddCart1" class="btn btn-primary py-3 px-5">Add
							to Cart</a>
					</p>
					<input type="hidden" id="modelid" value="${modelinfo.getId()}">
					<input type="hidden" id="account" value="${ACCOUNT.getId()}">

					<div class="canlender-demo">
						<div id="demo">
							<div id="one"></div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</section>

	<div class="row d-flex justify-content-center mt-100 mb-100">

		<div class="col-lg-6">
			<div class="card">
				<div class="card-body text-center">
					<h4 class="card-title">Latest Comments</h4>
				</div>
				<div class="comment-widgets">
					<!-- Comment Row -->
					<c:if test="${commentModel.isEmpty()}">
						<p style="font-size: 17px; font-weight: 500;">No one comment
							here</p>
					</c:if>
					<c:forEach items="${commentModel}" var="item" varStatus="position">
						<div class="d-flex flex-row comment-row m-t-0">
							<c:set var="contains" value="false"></c:set>
							<c:forEach items="${ACCOUNT.getRoles()}" var="role">
								<c:if test="${role == 'ADMIN'}">
									<c:set var="contains" value="true"></c:set>
								</c:if>
								<c:if test="${role == 'MANAGEMENT'}">
									<c:set var="contains" value="true"></c:set>
								</c:if>
								<c:if test="${role == 'STAFF'}">
									<c:set var="contains" value="true"></c:set>
								</c:if>
							</c:forEach>
							<c:if test="${contains == true}">
								<div class="comment-delete-container">
									<input type="button" value="X"
										onclick="deleteComment(${item.getId()})"
										class="comment-delete">
								</div>
							</c:if>
							<c:if test="${ACCOUNT.getId() == item.getAccountid()}">
								<c:if test="${contains == false}">
									<div class="comment-delete-container">
										<input type="button" value="X"
											onclick="deleteComment(${item.getId()})"
											class="comment-delete">
									</div>
								</c:if>
							</c:if>
							<div class="p-2">
								<img src="<c:url value = "/${item.getAvatar()}"/>" alt="user"
									width="50" class="rounded-circle">
							</div>
							<div class="comment-text w-100">
								<h6 class="font-medium" style="color: black;">${item.getUsername()}</h6>
								<span class="m-b-15 d-block">${item.getContent()}</span>
								<div class="comment-footer">
									<span class="text-muted float-right">${item.getCommenttime()}</span>
									<c:if test="${not empty ACCOUNT }">
										<button type="button"
											onclick="replyComment(${position.index},this)"
											class="btn btn-cyan btn-sm">
											<c:if test="${item.getChildcomment() != 0}">
						                    		${item.getChildcomment()}
						                    	</c:if>
											Reply
										</button>
									</c:if>
									<c:if test="${empty ACCOUNT}">
										<c:if test="${item.getChildcomment() != 0}">
											<button type="button"
												onclick="replyComment(${position.index},this)"
												class="btn btn-cyan btn-sm">
												${item.getChildcomment()} Reply</button>
										</c:if>
									</c:if>
								</div>
							</div>
						</div>
						<div class="counterboostrap" style="display: none;">
							<c:forEach items="${subcommentModel}" var="subcomment"
								varStatus="subindex">
								<c:if test="${subcomment.getParentid() == item.getId() }">
									<div class="d-flex flex-row comment-row m-t-0 subcomment"
										style="padding-left: 10%;">
										<c:if test="${contains == true}">
											<div class="comment-delete-container">
												<input type="button" value="X"
													onclick="deleteComment(${subcomment.getId()})"
													class="comment-delete">
											</div>
										</c:if>
										<c:if test="${ACCOUNT.getId() == subcomment.getAccountid()}">
											<c:if test="${contains == false}">
												<div class="comment-delete-container">
													<input type="button" value="X"
														onclick="deleteComment(${subcomment.getId()})"
														class="comment-delete">
												</div>
											</c:if>
										</c:if>
										<div class="p-2">
											<img src="<c:url value = "/${subcomment.getAvatar()}"/>"
												alt="user" width="50" class="rounded-circle">
										</div>
										<div class="comment-text w-100">
											<h6 class="font-medium" style="color: black;">${subcomment.getUsername()}</h6>
											<span class="m-b-15 d-block">${subcomment.getContent()}</span>
											<div class="comment-footer">
												<span class="text-muted float-right">${subcomment.getCommenttime()}</span>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="formSubComment"
							style="padding-left: 10%; display: none;">
							<textarea rows="1" cols="" class="subcommentcontent"
								style="width: 100%; resize: none;"
								placeholder="Your reply . . ."></textarea>
							<button type="button"
								onclick="formSubComment(${item.getId()},${position.index})">reply</button>
							<input type="hidden" value="${item.getId()}" class="parentid">
						</div>
					</c:forEach>
					<c:if test="${!commentModel.isEmpty()}">
					</c:if>
				</div>
				<!-- Card -->
				<c:if test="${empty ACCOUNT}">
					<p style="text-align: center; font-size: 30px; font-weight: bold">
						Please <a href="<c:url value="/login"/>">login</a> first
					</p>
				</c:if>
				<c:if test="${not empty ACCOUNT}">
					<form action="" id="formComment" class="form-comment">
						<textarea rows="3" cols="" id="comment"
							style="width: 100%; resize: none;"
							placeholder="Your comment . . ."></textarea>
						<input type="submit" value="comment"> <input type="hidden"
							id="accountid" value="${ACCOUNT.getId()}">
					</form>
				</c:if>
			</div>
		</div>


	</div>
	<script type="text/javascript">
	
	var x
	</script>

	<script>/* rating detail */
 	var x=${ratingModel.getSumStar()};
	
	var a=${ratingModel.getOneStar()};  	
	var x1= ( a / x )*100;
	    document.getElementById("bar-1").style.width= x1+"%";
	 
	
	var	b=${ratingModel.getTwoStar()};
	var x2=(b/x)*100;
	document.getElementById("bar-2").style.width= x2+"%";
	
	var	c=${ratingModel.getThrStar()};
	var x3=(c/x)*100;
	document.getElementById("bar-3").style.width= x3+"%";
	
	
	var	d=${ratingModel.getForStar()};
	var x4=(d/x)*100;
	document.getElementById("bar-4").style.width= x4+"%";
	
	var f=${ratingModel.getFivStar()};
	var x5=(f/x)*100;
	document.getElementById("bar-5").style.width= x5+"%";
	

	</script>
	<script>
		/* const addCart = document.querySelector('#btnAddCart');
		addCart.addEventListener('click', function(e) {
			e.preventDefault();
			var user = document.querySelector('#account').value;
			if (user != "") {
				var data = {};
				data["modelid"] = document.querySelector('#modelid').value;
				data["accountid"] = document.querySelector('#account').value;
				insertCart(data);
			} else {
				alert("Login please!!");
			}
		});*/
		
		var formComment = document.querySelector('#formComment');
		if(formComment != null){
			formComment.addEventListener('submit', function(e){
				e.preventDefault();
				var data = {};
				var content = document.querySelector('#comment').value;
				if(content.trim().length != 0){
					data['content'] = content;
					data['accountid'] = document.querySelector('#accountid').value;
					data['modelid'] = ${modelinfo.getId()};
					data['parentid'] = 0;
					$.ajax({
						type : 'post',
						url : '${pageContext.request.contextPath}/api-admin/comment/add',
						contentType : 'application/json',
						data : JSON.stringify(data),
						success : function (result) {
							location.reload(true);
						},
						error : function (error) {
							console.log(error);
						}
					});
				}
			});			
		}
		
		function formSubComment(id,position) {
			var container =  document.querySelectorAll('.counterboostrap')[indexsubcomment];
			var contentsub = container.innerHTML;
			var data = {};
			var content = document.querySelectorAll('.subcommentcontent')[position].value;
			if(content.trim().length != 0){
				data['content'] = content;
				data['accountid'] = document.querySelector('#accountid').value;
				data['modelid'] = ${modelinfo.getId()};
				data['parentid'] = id;
				$.ajax({
					type : 'post',
					url : '${pageContext.request.contextPath}/api-admin/comment/add',
					async: false,
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function (result) {
						contentsub += "<div class='d-flex flex-row comment-row m-t-0 subcomment' style='padding-left: 10%;'>";
		                contentsub += "<div class='comment-delete-container'>";
		                contentsub += "<input type='button' value='X' onclick='deleteComment("+result.id+")' class='comment-delete'></div>";
		                contentsub += "<div class='p-2'><img src='<c:url value = '/"+result.avatar+"'/>' alt='user' width='50' class='rounded-circle'></div>";
		                contentsub += "<div class='comment-text w-100'>";
		                contentsub += "<h6 class='font-medium' style='color: black;'>"+result.username+"</h6> <span class='m-b-15 d-block'>"+result.content+"</span>";
		                contentsub += "<div class='comment-footer'> <span class='text-muted float-right'>"+result.commenttime+"</span></div></div></div>";
		                container.innerHTML = contentsub;
		                document.querySelectorAll('.subcommentcontent')[position].value = "";
					},
					error : function (error) {
						console.log(error);
					}
				});
			}
		}
		var indexsubcomment;
		function replyComment(index,btn){
			var formSubComment = document.querySelectorAll('.formSubComment');
			var subComment = document.querySelectorAll('.counterboostrap');
			var account = document.querySelector('#account').value;
			for(var i = 0 ; i < formSubComment.length ; ++i){
				if(i == index){
					if(account != ""){						
						formSubComment[i].style.display = 'block';
						indexsubcomment = i;
					}
				}
			}
			for(var i = 0 ; i < subComment.length ; ++i){
				if(i == index){
					subComment[i].style.display = 'block';
				}
			}
			btn.style.display = 'none';
		}
		
		function deleteComment(commentid){
			var answer = confirm("Are you sure delete this comment?");
			if(answer){
				var data = {};
				data["id"] = commentid;
				$.ajax({
					url : '${pageContext.request.contextPath}/api-admin/comment/delete',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(data),
					success : function (result) {
						location.reload(true);
					},
					error : function (error) {
						console.log(error);
					}
				});
			}
		}

		function insertCart(data) {
			$.ajax({
				url : '${pageContext.request.contextPath}/api-admin/cart/add',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				success : function(result) {
					if (result) {
						alert("Success!");
						location.reload(true);
					} else {
						alert("Fail!");
					}
				},
				error : function(error) {
					console.log(error);
				}
			});

		}

		 function myFunction(imgs) {
			  var expandImg = document.getElementById("expandedImg");
			  var imgText = document.getElementById("imgtext");
			  expandImg.src = imgs.src;
			  imgText.innerHTML = imgs.alt;
			  expandImg.parentElement.style.display = "block";
		} 
      
	</script>
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	
	<script
		src="<c:url value="/resources/private/user/modeldetail/js/calendar.js" />"></script>
	<script
		src="<c:url value="/resources/private/user/modeldetail/js/index.js" />"></script>
</body>
</html>
