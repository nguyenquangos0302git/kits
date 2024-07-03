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
<title>Cart</title>
</head>
<body>
	<div class="hero-wrap hero-bread"
		style="background-image: url('<%=contextPath%>/resources/web/images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-0 bread">My Cart</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="home">Home</a></span> <span>Cart</span>
					</p>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section ftco-cart">
		<div class="container">
			<c:if test="${cartList.size() > 0}">
				<div class="row">
					<div class="col-md-12 ftco-animate">
						<div class="cart-list">
							<table class="table" id="cartTable">
								<thead class="thead-primary">
									<tr class="text-center">
										<th>&nbsp;</th>
										<th>&nbsp;</th>
										<th>Model's name</th>
										<th>Rank</th>
										<th>Day(s)</th>
										<th>Price($)</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${cartList}" var="item">
										<tr class="text-center">
											<td class="product-remove"><p class="delete-cart" onclick="deleteCart(${item.getId()},${item.getModelid()},${ACCOUNT.getId()})"><span
													class="ion-ios-close"></span></p></td>
		
											<td class="image-prod"><div class="img"
													style="background-image: url(${item.getImglink()});"></div></td>
		
											<td class="product-name">
												<h3>${item.getName()}</h3>
											</td>
		
											<td class="price">${item.getRank()}</td>
		
											<td class="price">${item.getDay()}</td>
		
											<td class="total">
												<fmt:formatNumber pattern = "###.###" value = "${item.getPrice()}" type="number"/>
											</td>
										</tr>
																			
									</c:forEach>
								</tbody>
							</table>
						</div>

						<div class="row justify-content-end">
							<div class="col col-lg-5 col-md-6 mt-5 cart-wrap ftco-animate">
								<div class="cart-total mb-3">
									<h3>Cart Totals</h3>
									<p class="d-flex">
										<span>Subtotal (${cartList.size()} model(s))</span> <span id="subtotal">$20.60</span>
									</p>
									<hr>
									<p class="d-flex total-price">
										<span>Total</span> <span id="total-price">$17.60</span>
									</p>
								</div>
								<p class="text-center" >
									<input id="btnRent" class="btn btn-primary py-3 px-4" value="CASH">
								</p>
								<form action="authorize_payment" method="post">
									<input type="hidden" name="subtotal" value="100" id="paypal-app"/>
									<input id="btnRent1" class="btn btn-primary py-3 px-4" type="submit" value="PAYPAL" />
								</form>
								
							</div>

					</div>
				</div>
				<%-- <div class="row justify-content-end">
					<div class="col col-lg-5 col-md-6 mt-5 cart-wrap ftco-animate">
						<div class="cart-total mb-3">
							<h3>Cart Totals</h3>
							<p class="d-flex">
								<span>Subtotal (${cartList.size()} model(s))</span> <span id="subtotal"></span>
							</p>
							<hr>
							<p class="d-flex total-price">
								<span>Total</span> <span id="total-price"></span>
							</p>

						</div>
						<p class="text-center">
							<button id="btnRent" class="btn btn-primary py-3 px-4">Rent</button>
						</p>
					</div>
				</div> --%>
				</c:if>
				<c:if test="${cartList.size() == 0}">
					<div style="text-align: center;">
						<img alt="" src="resources/images/notfound/system_cart_empty_1.png" style="width: 50%">
						<p style="font-size: 30px;">Don't have any model in your cart.</p>
						<a href="<c:url value="/all"/>" class="btn btn-primary py-3 px-4">Back all model</a>
					</div>
				</c:if>
		</div>
	</section>

	<script>
	
		let listCartDay = [];
		let listCartId = [];
		let listCartIds = [];
		let listCartImglink = [];
		let listCartModelId = [];
		let listCartName = [];
		let listCartPrice = [];
		let listCartRank = [];
		
		let listCartObj = {};
		
		<c:forEach items="${cartList}" var="listItem">
		  var listDataCartDay = [];
		  var listDataCartId = [];
		  var listDataCartIds = [];
		  var listDataCartImglink = [];
		  var listDataCartModelid = [];
		  var listDataCartName = [];
		  var listDataCartPrice = [];
		  var listDataCartRank = [];
		  
	
		  listDataCartDay.push("<c:out value="${listItem.day}" />");
		  
		  listDataCartId.push("<c:out value="${listItem.id}" />");
	
		  listDataCartIds.push("<c:out value="${listItem.ids}" />");
		  
		  listDataCartImglink.push("<c:out value="${listItem.imglink}" />");
		  
		  listDataCartModelid.push("<c:out value="${listItem.modelid}" />");
		  
		  listDataCartName.push("<c:out value="${listItem.name}" />");
		  
		  listDataCartPrice.push("<c:out value="${listItem.price}" />");
		  
		  listDataCartRank.push("<c:out value="${listItem.rank}" />");
		  
		  listCartDay.push(listDataCartDay);
		</c:forEach>
		
		console.log(listCartDay);
		
		console.log(listCartObj);
	
		function formatNumber (num) {
		    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
		}
		
		var sum = 0;
		
		if (document.getElementById("cartTable") != null) {
			var table = document.getElementById("cartTable").getElementsByTagName("td");
			
			for (var i = 0; i < table.length; i++){
				if(table[i].className == "total"){
					sum += isNaN(table[i].innerHTML) ? 0 : parseInt(table[i].innerHTML);
				}
			}
			document.getElementById("subtotal").innerHTML = "$"+formatNumber(sum);
			document.getElementById("total-price").innerHTML = "$"+formatNumber(sum);
			const btnRent1 = document.getElementById('btnRent1');
			const paypalApp = document.getElementById('paypal-app');
			paypalApp.value = sum;
		}
		
		listCartObj["total"] = sum;
		
		/* btnRent1.addEventListener('click', function() {
			$.ajax({
				type: 'POST',
				url: 'http://localhost:8080/model/authorize_payment',
				data: listCartObj,
				crossDomain:true,
				success: function(data) {
					window.location.href = data;
					window.location.assign(data);
				},
				error: function (data) {
					console.log(data);
				}
			})
		}) */
		
		
		
		function deleteCart(id, modelid, accountid) {
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/api-admin/cart/delete',
				contentType : 'application/json',
				data : JSON.stringify({
					'id' : id,
					'modelid' : modelid,
					'accountid' : accountid
				}),
				success : function (result) {
					location.reload(true);
				},
				error : function (error) {
					console.log(error);
				}
			});
		}
		
		const btnRent = document.querySelector('#btnRent');
		if (btnRent) {
			btnRent.addEventListener('click', function (){
				var answer = confirm('Are you sure?')
				if(answer){
					$.ajax({
						url : '${pageContext.request.contextPath}/api-admin/contract/add',
						type : 'post',
						data : {
							accountid : ${ACCOUNT.getId()},
							username : '${ACCOUNT.getUsername()}'
						},
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
		
	</script>
	
</body>
</html>