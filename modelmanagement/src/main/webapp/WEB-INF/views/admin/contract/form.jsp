  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<c:url var="APIuri" value="/admin-contract/" />
<c:url var="LISTurl" value="/admin-contract" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contract</title>
</head>

<body>
	<div class="content-wrapper" style="min-height: 1200.88px;">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Contract Edit</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Contract</li>
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
									<input type="text" name="accountid" style="display:none" value="${ACCOUNT.getId() }"/>
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
										Description <br />
										<input type="text" name="description" required="required" value="${findModel.getDescription() }"/>
									</div>
									
									<div>
										Totalprice <br />
										<input type="number" name="totalprice" required="required" value="${findModel.getTotalprice() }"/>
									</div>
									
									<div>
										<input type="submit" value="SUBMIT"  />
										<a href="${LISTurl}"
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