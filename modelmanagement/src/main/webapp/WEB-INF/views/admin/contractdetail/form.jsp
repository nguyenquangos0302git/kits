  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<c:url var="APIuri" value="/admin-contract-detail" />
<c:url var="LISTurl" value="/admin-contract-detail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contract Detail</title>
</head>

<body>
	<div class="content-wrapper" style="min-height: 1200.88px;">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Contract Detail Edit</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Contract Detail</li>
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
										ContractID <br/>
										<select name="contractid" required="required">
											<c:forEach items="${allContract }" var="ids" >
												<c:choose>
													<c:when test="${findModel.getContractid() == ids.id}">
														<option value="${ids.id}" selected="selected">${ids.id}</option>
													</c:when>
													<c:when test="${findModel.getContractid() != ids.id}">
														<option value="${ids.id}">${ids.id}</option>
													</c:when>
												</c:choose>
											</c:forEach>
										</select>
									</div>
									<div>
										Detail <br />
										<input type="text" name="detail" required="required" value="${findModel.getDetail() }"/>
									</div>
									
									<div>
										Model's Name <br/>
										<select name="modelid" required="required">
											<c:forEach items="${allModel }" var="model" >
												<c:choose>
													<c:when test="${findModel.getModelid() == model.id}">
														<option value="${model.id}" selected="selected">${model.name}</option>
													</c:when>
													<c:when test="${findModel.getModelid() != model.id}">
														<option value="${model.id}">${model.name}</option>
													</c:when>
												</c:choose>
											</c:forEach>
										</select>
									</div>
									
									<div>
										<input type="submit" value="SUBMIT"  />
										<a href="${APIuri}"
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