<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<c:url var="LISTurl" value="/admin-role" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rank</title>
</head>

<body>
	<div class="content-wrapper" style="min-height: 1200.88px;">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>ROLE</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">ROLE</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<section class="content">
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6">
					<div class="card">
						<div class="card-body align-items-center">
							<form method="post" action="${LISTurl}/add1" id="RoleModel">


								<div>
									Name <br /> <input type="text" name="name" required="required" value="${roleModel.getName()}"
										 />
								</div>
								<div>
									Description <br /> <input type="text" name="description"
										required="required" value ="${roleModel.getDescription()}" />
								</div>
								<div>
									Salary <br /> <input type="text" name="salary"
										required="required" value="${roleModel.getSalary()} "/>
								</div>
								
								<div>
									<input type="submit" value="SUBMIT" /> 
									<c:if test="${not empty roleModel}">
										<input type="hidden" name="id" value="${roleModel.getId()}">
									</c:if>
																		
									<a href="${LISTurl}"
										class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
										style="margin-left: 10px" data-toggle="tooltip" title='exit'>
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