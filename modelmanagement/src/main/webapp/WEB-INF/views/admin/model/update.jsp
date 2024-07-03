  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<c:url var="APIuri" value="/admin-model" />
<c:url var="LISTurl" value="/admin-model" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sách</title>
</head>

<body>
	<div class="content-wrapper" style="min-height: 1200.88px;">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Model Edit</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Model</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<section class="content">
			<div class="row">
			<div class="col-3"></div>
				<div class="col-6" >
					<div class="card" >
						<div class="card-body align-items-center"  >
								<form method="post" action="edit" name="findModel">
									
									<input type="text" name="id" style="display:none" value="${findModel.getId() }"/>
									<c:choose>
										<c:when test="${findModel.getId() != 0}">
											<input type="text" name="modifiedby" style="display:none" value="${ACCOUNT.getUsername() }"/>
											<input type="text" name="createdby" style="display:none" value="${findModel.getCreatedby() }"/>
										</c:when>
										<c:when test="${findModel.getId()== 0}">
											<input type="text" name="createdby" style="display:none" value="${ACCOUNT.getUsername() }"/>
											<input type="text" name="modifiedby" style="display:none" value="${ACCOUNT.getUsername() }"/>
										</c:when>
									</c:choose>
									<div>
										Name <br />
										<input type="text" name="name" required="required" value="${findModel.getName() }"/>
									</div>
									<div>
										Address <br />
										<input type="text" name="address" required="required" value="${findModel.getAddress() }"/>
									</div>
									<div>
										Email <br />
										<input type="email" name="email" required="required" value="${findModel.getEmail() }"/>
									</div>
									<div>
										Phone <br />
										<input type="text" name="phone" required="required" value="${findModel.getPhone() }"/>
									</div>
									<div>
										Rank <br/>
										<select name="rankid" required="required">
											<c:forEach items="${rankModel }" var="rank" >
												<c:choose>
													<c:when test="${findModel.getRankid() == rank.id}">
														<option value="${rank.id}" selected="selected">${rank.name}</option>
													</c:when>
													<c:when test="${findModel.getRankid() != rank.id}">
														<option value="${rank.id}">${rank.name}</option>
													</c:when>
												</c:choose>
											</c:forEach>
										</select>
									</div>
									<div>
										Height <br />
										<input type="text" name="height" required="required" value="${findModel.getHeight() }"/>
									</div>
									<div>
										Weight <br />
										<input type="text" name="weight" value="${findModel.getWeight() }"/>
									</div>
									<div>
										Birthday <br />
										<input type="date" name="birthday" value="${findModel.getBirthday() }"/>
									</div>
									<div>
										Gender <br/>
										<select name="gender" required="required" >
												<option value="0">Female</option>
												<option value="1">Male</option>
										</select>
									</div>
									<div>
										Nation <br />
										<input type="text" name="nation" required="required" value="${findModel.getNation() }"/>
									</div>
									<div>
										Description <br />
										<input type="text" name="description" value="${findModel.getDescription() }"/>
									</div>
									<div>
										Status <br />
										<input type="text" name="status" value="1" style="display:none" />
									</div>
									<div>
										Chest <br />
										<input type="text" name="chest" value="${findModel.getChest() }"/>
									</div>
									<div>
										Hip <br />
										<input type="text" name="hip" value="${findModel.getHip() }"/>
									</div>
									<div>
										Waist <br />
										<input type="text" name="waist" value="${findModel.getWaist() }"/>
									</div>
									<div>
										Showonhome <br />
										<select name="showonhome" required="required">
												<option value="0">False</option>
												<option value="1">True</option>
										</select>
									</div>
									
									<div>
										<input type="submit" value="SUBMIT"  />
										<a href="${APIuri}/=0"
											class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
											style="margin-left: 10px" data-toggle="tooltip"
											title='Thoát'>
											<span> <i class="fa fa-times-circle"></i>
											</span>
										</a>
									</div>
									
								</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<script
		src="<c:url value = '/template/admin/plugins/jquery/jquery.min.js'/>">
		
	</script>
	
</body>

</html>