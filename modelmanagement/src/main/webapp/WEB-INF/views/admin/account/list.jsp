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
<title>Admin Account</title>
</head>
<body style="position: relative;">


	<div class="row m-y-2 formAddAccount">
		<i class="fas fa-times"
			style="position: absolute; top: 20px; right: 20px; border: 1px solid black; border-radius: 7px; padding: 5px 7px 5px 7px; cursor: pointer"
			id="closeAddUser"></i>
		<div class="col-lg-8 push-lg-4">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a href="" data-target="#add"
					data-toggle="tab" class="nav-link active">Add</a></li>
			</ul>
			<div class="tab-content p-b-3">
				<div class="tab-pane active" id="edit">
					<h4 class="m-y-2">Add Account</h4>
					<form role="form">

						<div class="form-group row" style="margin-bottom: 0">
							<label class="col-lg-3 col-form-label form-control-label">FullName</label>
							<div class="col-lg-9">
								<input class="form-control addData" type="text" value=""
									name="name" placeholder="FullName" required="required"
									id="addUserFullName">
							</div>
						</div>
						<p class="notification" style="margin-bottom: 0; margin-top: 0;">Notification</p>

						<div class="form-group row" style="margin-bottom: 0">
							<label class="col-lg-3 col-form-label form-control-label">Email</label>
							<div class="col-lg-9">
								<input class="form-control addData" type="email" value=""
									name="email" placeholder="Email" required="required"
									id="addUserEmail">
							</div>
						</div>
						<p class="notification" style="margin-bottom: 0">Notification</p>

						<div class="form-group row" style="margin-bottom: 0">
							<label class="col-lg-3 col-form-label form-control-label">Phone</label>
							<div class="col-lg-9">
								<input class="form-control addData" type="number" value=""
									name="phone" placeholder="Phone" required="required"
									id="addUserPhone">
							</div>
						</div>
						<p class="notification" style="margin-bottom: 0">Notification</p>

						<div class="form-group row" style="margin-bottom: 0">
							<label class="col-lg-3 col-form-label form-control-label">Id
								Card</label>
							<div class="col-lg-9">
								<input class="form-control addData" type="text" value=""
									name="idcard" placeholder="Phone" required="required"
									id="addUserIdCard">
							</div>
						</div>
						<p class="notification" style="margin-bottom: 0">Notification</p>

						<div class="form-group row" style="margin-bottom: 0">
							<label class="col-lg-3 col-form-label form-control-label">Birthday</label>
							<div class="col-lg-9">
								<input type="date" id="start" name="birthday" value="2018-07-22"
									style="color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; width: 100%; padding: 5px; outline: none; margin-bottom: 19px;"
									class="addData">
							</div>
						</div>

						<div class="form-group row" style="margin-bottom: 0">
							<label class="col-lg-3 col-form-label form-control-label">Company</label>
							<div class="col-lg-9">
								<input class="form-control addData" type="text" value=""
									name="company" placeholder="Company" required="required"
									id="addUserCompany">
							</div>
						</div>
						<p class="notification" style="margin-bottom: 0">Notification</p>

						<div class="form-group row" style="margin-bottom: 0">
							<label class="col-lg-3 col-form-label form-control-label">Address</label>
							<div class="col-lg-9">
								<input class="form-control addData" type="text" value=""
									name="address" placeholder="Address" required="required"
									id="addUserAddress">
							</div>
						</div>
						<p class="notification" style="margin-bottom: 0">Notification</p>

						<div class="form-group row" style="margin-bottom: 0">
							<label class="col-lg-3 col-form-label form-control-label">Username</label>
							<div class="col-lg-9">
								<input class="form-control addData" type="text" value=""
									name="username" placeholder="Username" required="required"
									id="addUserName">
							</div>
						</div>
						<p class="notification" style="margin-bottom: 0">Notification</p>

						<div class="form-group row js-role form-check"
							style="text-align: right; margin-bottom: 0"></div>
						<p class="notification" style="margin-bottom: 10px">Notification</p>

						<div class="form-group" style="display: inline-block;">
							<label class="container1">Male <input type="radio"
								checked="checked" name="gender" value="1"> <span
								class="checkmark1"></span>
							</label> <label class="container1">Female <input type="radio"
								name="gender" value="0"> <span class="checkmark1"></span>
							</label>
						</div>

						<div class="form-group row">
							<label class="col-lg-3 col-form-label form-control-label"></label>
							<div class="col-lg-9">
								<input type="reset" class="btn btn-secondary" value="Reset">
								<input type="button" class="btn btn-primary" value="Add Account"
									id="insertAccount">
							</div>
						</div>
						<p class="notification">Notification</p>
						<button class="btn btn-success addLoading" type="button" disabled
							style="visibility: hidden; display: inline-block;">
							<span class="spinner-border spinner-border-sm loading"
								role="status" aria-hidden="true"></span> <span class="loading">Loading...</span>
						</button>
					</form>
				</div>
			</div>
		</div>
		<div class="col-lg-4 pull-lg-8 text-xs-center">
			<img src="//placehold.it/150" class="m-x-auto img-fluid" alt="avatar"
				id="output" style="width: 150px"> <label class="custom-file"
				style="margin-top: 15px;"> <input type="file"
				id="avatarUser" accept="image/png, image/jpeg" class="addData">
			</label>
			<p class="notification">Notification</p>
		</div>
	</div>

	<div class="container emp-profile" style="display: none;">
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
						<!-- <p>WORK LINK</p>
                        <a href="">Website Link</a><br/>
                        <a href="">Bootsnipp Profile</a><br/>
                        <a href="">Bootply Profile</a>
                        <p>SKILLS</p>
                        <a href="">Web Designer</a><br/>
                        <a href="">Web Developer</a><br/>
                        <a href="">WordPress</a><br/>
                        <a href="">WooCommerce</a><br/>
                        <a href="">PHP, .Net</a><br/> -->
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

						<div class="tab-pane fade" id="profile" role="tabpanel"
							aria-labelledby="profile-tab">
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
									<label>Coefficients Salary</label>
								</div>
								<div class="col-md-6">
									<p id="cosalary"></p>
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
									<label>birthday</label>
								</div>
								<div class="col-md-6">
									<p id="birthday"></p>
								</div>
							</div>
						</div>

						<div class="tab-pane fade" id="follow" role="tabpanel"
							aria-labelledby="follow-tab">
							<div style="text-align: center;">
								<img
									src="resources/images/system/featuresoon/system_featuresoon_1.jpg"
									style="width: 50%">
								<p>Features will be coming soon</p>
							</div>
						</div>

					</div>


				</div>
			</div>
		</form>
	</div>

	<div class="content-wrapper"
		style="min-height: 1200.88px; overflow-x: auto">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Account</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Account</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<section class="content">

			<div class="alert" role="alert"
				style="display: inline-block; visibility: hidden;"
				id="js-statusAction">Status</div>

			<form action="" id="formSubmit" method="get">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<div class="row">
									<div class="col-4">
										<input type="hidden" name="type" value="list" /> <input
											type="text" class="form-control" name="textSearch"
											id="textSearch" value="" placeholder="Search..." />
									</div>
									<div class="card-tool" align="right" style="margin-bottom: 5px">
										<div class="dt-buttons btn-overlap btn-group">
											<a id="account-add"
												class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Add New Account'> <span>
													<i class="fa fa-plus-circle bigger-110 purple"></i>
											</span>
											</a>
											<button id="btnDelete" type="button"
												class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Delect Account'>
												<span> <i class="fa fa-trash"></i>
												</span>
											</button>
										</div>
									</div>


								</div>
								<div id="example1_wrapper"
									class="dataTables_wrapper dt-bootstrap4">
									<div class="row">
										<div class="col-sm-12">
											<table id="example1"
												class="table table-bordered table-striped dataTable"
												role="grid" aria-describedby="example1_info">
												<thead>
													<tr>
														<th><input type="checkbox" id="checkAllHead"></th>
														<th>UserName</th>
														<th>Email</th>
														<th>Role</th>
														<th>Status</th>
														<th>Code Verification</th>
														<th>Expired Code</th>
														<th>Created Date</th>
														<th>Created By</th>
														<th>Modified Date</th>
														<th>Modified By</th>
														<th>Note</th>
														<th>Action</th>
													</tr>
												</thead>

												<tbody class="js-renderData">

												</tbody>
											</table>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
			<div style="display: flex; justify-content: space-between;">
				<p id="showEntries" style="margin-left: 20px;">Showing 1 to 10 of 50 entries</p>
				<ul id="pagination-demo" class="pagination-sm"
					style="justify-content: flex-end; margin-right: 20px;"></ul>
			</div>

		</section>
	</div>
	<script
		src="<%=contextPath%>/resources/private/admin/account/js/index.js"></script>
</body>
</html>