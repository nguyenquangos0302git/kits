<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<c:url var="editurl" value="/admin-slide" />
<c:url var="APIurl" value="/api-admin-slide" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Slide</title>
</head>

<body>
	<div class="content-wrapper" style="min-height: 1200.88px;">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Slide</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Slide</li>
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
										<label>IMG:&nbsp&nbsp&nbsp&nbsp&nbsp</label>
										<input type="text" class="form-control"
											name="img" value="${slideModel.img}"/>
									</div>
									<div>
										<label>Description:&nbsp&nbsp&nbsp&nbsp&nbsp</label>
										<input type="text" class="form-control"
											name="description" value="${slideModel.description}"/>
									</div>
									<c:if test="${not empty slideModel}">
										<input class="input-but" type='submit' value='Update' />
									</c:if>
									<c:if test="${empty slideModel}">
										<input class="input-but" type='submit' value='Add' />
									</c:if>
								</div>
								<c:if test="${not empty slideModel}">
										<input type="hidden" name="id" value="${slideModel.id}" />
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