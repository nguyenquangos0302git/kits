<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<c:url var="editurl" value="/admin-talent" />
<c:url var="APIurl" value="/api-admin-talent" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Talent</title>
</head>

<body>
	<div class="content-wrapper" style="min-height: 1200.88px;">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Talent</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Talent</li>
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
							<form id="formSubmit" method='post' action="add">
								<div class="form-group">
									<div>
										<label>Name:&nbsp&nbsp&nbsp&nbsp&nbsp</label>
										<input type="text" class="form-control"
											name="name" value="${talentModel.name}"/>
									</div>
									<c:if test="${not empty talentModel}">
										<input class="input-but" type='submit' value='Update' />
									</c:if>
									<c:if test="${empty talentModel}">
										<input class="input-but" type='submit' value='Add' />
									</c:if>
								</div>
								<c:if test="${not empty talentModel}">
										<input type="hidden" name="id" value="${talentModel.id}" />
								</c:if>
								
							</form>
							
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>

</html>