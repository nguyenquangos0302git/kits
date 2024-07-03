<%@include file="/WEB-INF/common/taglib.jsp"%>
<nav
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light scrolled awake"
	id="ftco-navbar">
	<div class="container">
		<a style="width: 30%;" class="navbar-brand"
			href="<c:url value = "/home" />"><img
			src="<c:url value="/resources/images/logo/logo_header.png"/>" style="width: 50%;"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>

		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a href="<c:url value = "/home" />"
					class="nav-link">Home</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Model</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="<c:url value = "/all" />">All</a> <a
							class="dropdown-item" href="<c:url value = "/male" />">Male</a> <a
							class="dropdown-item" href="<c:url value = "/female" />">Female</a>
						<a class="dropdown-item" href="<c:url value = "/kids" />">Kids</a>
						<a class="dropdown-item" href="<c:url value = "/new-faces" />">
							New Faces</a>
					</div></li>
				<li class="nav-item"><a href="<c:url value = "/about" />"
					class="nav-link">About</a></li>
				<!-- <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li> -->
				<li class="nav-item"><a href="<c:url value = "/contact" />"
					class="nav-link">Contact</a></li>
				<c:if test="${empty ACCOUNT}">
					<li class="nav-item cta cta-colored"><a
						href="<c:url value = "/login?cart" />" class="nav-link"><span
							class="icon-shopping_cart"></span>[0]</a></li>
					<li class="nav-item" style="list-style: none; float: left;  padding: 0 auto;"><a
					href="/model/login" class="nav-link nav-link-after"><i class="fa fa-user fa-fw" aria-hidden="true"></i>Login</a></li> 
					<li class="nav-item" style="list-style: none; float: left;">
						<a href="/model/register" class="nav-link"><i class="fa fa-pencil-square-o fa-fw" aria-hidden="true"></i>Register</a></li>
				</c:if>
				<c:if test="${not empty ACCOUNT}">
					<li class="nav-item cta cta-colored"><a
							href="<c:url value = "/cart" />" class="nav-link"><span
								class="icon-shopping_cart"></span>[${ACCOUNT.getCountCart()}]</a></li>
					<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${ACCOUNT.getName()}</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item popup" onclick="myFunction1(${ACCOUNT.getId()})" style="cursor: pointer;">Profile</a> <a
							class="dropdown-item" href="<c:url value = "/logout" />">Logout</a>
					</div></li>
					<c:if test="${ACCOUNT.getRoles().contains('ADMIN') || ACCOUNT.getRoles().contains('STAFF') || ACCOUNT.getRoles().contains('MANAGEMENT')}">
						<li class="nav-item active"><a href="<c:url value = "/admin-home" />"
						class="nav-link">Admin</a></li>
					</c:if>
				</c:if>
			</ul>
		</div>
	</div>
</nav>
<div class="container emp-profile" style="display: none;">
		<i class="fa fa-times"
			style="position: absolute; top: 20px; right: 20px; border: 1px solid black; border-radius: 7px; padding: 5px 7px 5px 7px; cursor: pointer;"
			id="closeDetailUser"></i>		
			<div class="row">
				<div class="col-md-4">
					<div class="profile-img">
						<img alt="" src="" id="userImage">
						<!-- <div class="file btn btn-lg btn-primary">
							Change Photo <input type="file" name="file"
								style="width: 100%; height: 100%" />
						</div> -->
					</div>
				</div>
				<div class="col-md-6">
					<div class="profile-head">
						<h5 id="userName"></h5>
						<h6 id="userEmail"></h6>
						<h6 id="userPhone"></h6>
						<h6 id="userAddress"></h6>
						
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#home" role="tab"
								aria-controls="home" aria-selected="true">Profile</a></li>
							<li class="nav-item"><a class="nav-link" id="profile-tab"
								data-toggle="tab" href="#profile" role="tab"
								aria-controls="profile" aria-selected="false">Another</a></li>
							<li class="nav-item"><a class="nav-link" id="follow-tab"
								data-toggle="tab" href="#follow" role="tab"
								aria-controls="follow" aria-selected="false">Follow</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-2">
					<input type="submit" class="profile-edit-btn" name="btnAddMore"
						value="Edit Profile" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="profile-work">
						
					</div>
				</div>
				<div class="col-md-8">
					<div class="tab-content profile-tab" id="myTabContent">
						<div class="tab-pane fade show active" id="home" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="row">
								<div class="col-md-4">
									<label>Name</label>
								</div>
								<div class="col-md-4">
									<p id="name">${ACCOUNT.getName() }</p>
									<input type="text" id="fullName" style="display: none;" value="${ACCOUNT.getName() }">
								</div>
								<div class="col-md-4">
							
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<label>Address</label>
								</div>
								<div class="col-md-4">
									<p id="address">${ACCOUNT.getAddress() }</p>
									<input type="text" id="fullAddress" style="display: none;" value="${ACCOUNT.getAddress() }">
								</div>
								<div class="col-md-4">
									
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<label>Phone</label>
								</div>
								<div class="col-md-4">
									<p id="phone">${ACCOUNT.getPhone() }</p>
									<input type="text" id="fullPhone" style="display: none;" value="${ACCOUNT.getPhone() }">
								</div>
								<div class="col-md-4">
								</div>
							</div>
							<input type="submit" id="btnSave" name="" style="display: none;"
									value="Save" />
						</div>
						<div class="tab-pane fade" id="profile" role="tabpanel"
							aria-labelledby="profile-tab">
							<div class="row">
								<div class="col-md-4">
									<label>Company</label>
								</div>
								<div class="col-md-4">
									<p id="company">${ACCOUNT.getCompany() }</p>
									<input type="text" id="fullCompany" style="display: none;" value="${ACCOUNT.getCompany() }">
								</div>
								<div class="col-md-4">
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<label>Gender</label>
								</div>
								<div class="col-md-4">
									<p id="gender">
										<c:if test="${ACCOUNT.getGender() == true }">
											Male
										</c:if>
										<c:if test="${ACCOUNT.getGender() == false }">
											Female
										</c:if>
									</p>
								</div>
								<div class="col-md-4">
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="follow" role="tabpanel"
							aria-labelledby="follow-tab">
							<div style="text-align: center;">
								<img
									src="<c:url value= "/resources/images/system/featuresoon/system_featuresoon_1.jpg" />"
									style="width: 50%">
								<p>Features will be coming soon</p>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
<script>
	const empProfile = document.querySelector('.emp-profile');
	const closeDetailUser = document.querySelector('#closeDetailUser');
	const backgroundShadow = document.querySelector('.backgroundshadow');
	const editBtn = document.querySelector('.profile-edit-btn');
	function myFunction1(id) {
		empProfile.style.display = "block";
		document.querySelector('#userImage').src = '${pageContext.request.contextPath}'+'/${ACCOUNT.avatar}';
		backgroundShadow.style.display = 'block';
	}
	closeDetailUser.addEventListener('click', function (event) {
	empProfile.style.display = 'none';
	backgroundShadow.style.display = 'none';
	});
	editBtn.addEventListener('click', function (event) {
		document.querySelector('#name').style.display = 'none';
		document.querySelector('#address').style.display = 'none';
		document.querySelector('#phone').style.display = 'none';
		document.querySelector('#company').style.display = 'none';
		document.querySelector('#fullName').style.display = 'block';
		document.querySelector('#fullAddress').style.display = 'block';
		document.querySelector('#fullPhone').style.display = 'block';
		document.querySelector('#fullCompany').style.display = 'block';
		document.querySelector('#btnSave').style.display = 'block';
		});
	document.querySelector('#btnSave').addEventListener('click',function(e){
		e.preventDefault();
		var data = {};
		data["name"] = document.querySelector('#fullName').value;
		data["address"] = document.querySelector('#fullAddress').value;
		data["phone"] = document.querySelector('#fullPhone').value;
		data["company"] = document.querySelector('#fullCompany').value;
		data["id"] = ${ACCOUNT.getUserId()}
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/api-admin/user/edit',
			contentType : 'application/json',
			data : JSON.stringify(data),
			success : function (result) {
				location.reload(true);
			},
			error : function (error) {
				console.log(error);
			}
		});
	});
</script>