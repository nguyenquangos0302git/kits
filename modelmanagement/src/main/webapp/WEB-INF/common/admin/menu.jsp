<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4"
	style="z-index: 1">
	<!-- Brand Logo -->
	<a href="<c:url value = "/"/>" class="brand-link"
		style="border-bottom: none !important;"> <img
		src="<c:url value = '/resources/images/logo/logo_header.png'/>"
		alt="Admin Logo" class="brand-image img-circle elevation-3"
		style="box-shadow: none !important; border-radius: 0 !important; max-height: 50px; margin-left: 1.3em; margin-top: 0;">
	</a>
	<div class="container emp-profile" style="display: none;">
		<i class="fas fa-times"
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
									src="<c:url value = '/resources/images/system/featuresoon/system_featuresoon_1.jpg'/>"
									style="width: 50%">
								<p>Features will be coming soon</p>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
	<!-- Sidebar -->
	<div class="sidebar"
		style="display: initial; margin: 0; padding-left: 7px;">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="info">
				<a style="color: yellow; font-weight: bold; cursor: pointer;"
					onclick="myFunction(${ACCOUNT.getId()})"
					class="d-block" >Welcome,${ACCOUNT.getName()}</a> <a
					style="color: red" href="<c:url value = '/logout'/>">Exit</a>
			</div>
		</div>
		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
				<li class="nav-item has-treeview menu-open"><a href="#"
					class="nav-link active"> <i
						class="nav-icon fas fa-tachometer-alt"></i>
						<p>
							Management <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a
							href="<c:url value = '/admin-model/=0'/>" class="nav-link">
								<p>Model</p>
						</a></li>
						<li class="nav-item"><a
							href="<c:url value = '/admin-talent'/>" class="nav-link">
								<p>Talent</p>
						</a></li>
						<li class="nav-item"><a href="<c:url value = '/admin-rank'/>"
							class="nav-link">
								<p>Rank</p>
						</a></li>
						<li class="nav-item"><a
							href="<c:url value = '/admin-account'/>" class="nav-link">
								<p>Account</p>
						</a></li>
						<li class="nav-item"><a
							href="<c:url value = '/admin-role'/>"
							class="nav-link">
								<p>Role</p>
						</a></li>
						<li class="nav-item"><a
							href="<c:url value = '/admin-contract'/>"
							class="nav-link">
								<p>Contract</p>
						</a></li>
						<li class="nav-item"><a
							href="<c:url value = '/admin-slide'/>"
							class="nav-link">
								<p>Slide</p>
						</a></li>
						<li class="nav-item"><a
							href="<c:url value = '/admin-contact'/>" class="nav-link">
								<p>Contact</p>
						</a></li>
					</ul></li>
			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	
	<!-- /.sidebar -->
<!-- 	<div class="container emp-profile" style="display: none;">
		<i class="fas fa-times"
			style="position: absolute; top: 20px; right: 20px; border: 1px solid black; border-radius: 7px; padding: 5px 7px 5px 7px; cursor: pointer"
			id="closeDetailUser"></i>
		<form method="post">
			<div class="row">
				<div class="col-md-4">
					<div class="profile-img">
						<img src="" alt="" id="userImage" />
						<div class="file btn btn-lg btn-primary">
							Change Photo <input type="file" name="file"
								style="width: 100%; height: 100%" />
						</div>
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
								aria-controls="home" aria-selected="true">About</a></li>
							<li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Timeline</a>
                            </li>
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
						<p>WORK LINK</p>
                        <a href="">Website Link</a><br/>
                        <a href="">Bootsnipp Profile</a><br/>
                        <a href="">Bootply Profile</a>
                        <p>SKILLS</p>
                        <a href="">Web Designer</a><br/>
                        <a href="">Web Developer</a><br/>
                        <a href="">WordPress</a><br/>
                        <a href="">WooCommerce</a><br/>
                        <a href="">PHP, .Net</a><br/>
					</div>
				</div>
				<div class="col-md-8">
					<div class="tab-content profile-tab" id="myTabContent">
						<div class="tab-pane fade show active" id="home" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="row">
								<div class="col-md-6">
									<label>User Id</label>
								</div>
								<div class="col-md-6">
									<p id="userId"></p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Name</label>
								</div>
								<div class="col-md-6">
									<p id="userFullName"></p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Company</label>
								</div>
								<div class="col-md-6">
									<p id="userCompany"></p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Salary</label>
								</div>
								<div class="col-md-6">
									<p id="userSalary"></p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>ID Card</label>
								</div>
								<div class="col-md-6">
									<p id="userIdCard"></p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Gender</label>
								</div>
								<div class="col-md-6">
									<p id="userGender"></p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Status</label>
								</div>
								<div class="col-md-6">
									<p id="userStatus"></p>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Experience</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>Expert</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Hourly Rate</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>10$/hr</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Total Projects</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>230</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>English Level</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>Expert</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Availability</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>6 months</p>
                                        </div>
                                    </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Your Bio</label><br/>
                                    <p>Your detail description</p>
                                </div>
                            </div>
                        </div>
					</div>
				</div>
			</div>
		</form>
	</div> -->
	
</aside>
<script>
	const empProfile = document.querySelector('.emp-profile');
	const closeDetailUser = document.querySelector('#closeDetailUser');
	const backgroundShadow = document.querySelector('.backgroundshadow');
	const editBtn = document.querySelector('.profile-edit-btn');
	function myFunction(id) {
		empProfile.style.display = "block";
		document.querySelector('#userImage').src = '${pageContext.request.contextPath}'+'/${ACCOUNT.avatar}';
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
