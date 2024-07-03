<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<c:url var="LISTurl" value="/admin-rank" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rank</title>
</head>
<body>
	<div class="content-wrapper" style="min-height: 1200.88px;">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Rank</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Rank</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<section class="content">
			<div class="row">
				<div class="col-12">
					<div align="right">
						
					</div>
				</div>
			</div>
			<form action="${LISTurl}" id="formSubmit" method="get" onsubmit="DoSubmit();">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<div class="row">
									<div class="col-4">
									<from method = "get" action="${LISTurl}/search" >
											<input	type="hidden" name="type" value = "list" />
											<input type="text" class="form-control" name="textSearch" id="textSearch" value="${model.textSearch}"
												placeholder="Search..." />
									</from>			
									</div>
									<div class="card-tool" align="right" style="margin-bottom: 5px">
										<div class="dt-buttons btn-overlap btn-group">
											<a class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='ADD'
												href="${LISTurl}/add"> <span>
													<i class="fa fa-plus-circle bigger-110 purple"></i>
												</span>
											</a>
											
												
												</span>
											</a>
										</div>
									</div>
									
									
								</div>
								<div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
										<div class="row">
											<div class="col-sm-12">
												<table id="example1" class="table table-bordered table-striped dataTable"
													role="grid" aria-describedby="example1_info">
													<thead>
													<tr>
														<th><input type="checkbox" id="checkAllHead"></th>
														<td>Name</td>
														<td>Price</td>										
														<td>Salary</td>
														<td>Status</td>
														<td>Createdate</td>
														<td>Modifieddate</td>
														<td>Createdby</td>
														<td>Modifiedby</td>
														
														
														<td>
															Active
														
														</td>
													</tr>
												</thead>
												<tbody>

													<c:forEach items="${rankList }" var="l">
														<tr>
															<td><input type="checkbox" id="checkbox_${list.id}" value="${list.id}"></td>
															<td>${l.name }</td>
															<td>${l.price }</td>
															<td>${l.salary }</td>
															<td>
															<c:choose>
																	<c:when test="${l.status =='0'}">
																		<p>InActive</p>
																	</c:when>
																	<c:when test="${l.status !='0' }">
																		<p>Active</p>
																	</c:when>
																</c:choose>
															</td>
															<td>${l.createdate }</td>
															<td>${l.createdby }</td>
															<td>${l.modifiedby }</td>
															<td></td>
															<td>
																<a class="btn btn-sm btn-primary btn-edit"
																		data-toggle="tooltip" title="Edit"
																		href="${LISTurl}/edit/${l.id}"><i class="fa fa-edit"
																			aria-hidden="true"></i> </a>
																<a id="btnDelete" type="button" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"  title="DELETE"
																href="${LISTurl}/${l.id}">
															<span><i class="fa fa-trash" ></i></span>
															</a>
															</td>
														</tr>
													</c:forEach>

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
		</section>
	</div>
	<script>
		
		$('#checkAllHead').click(function () {
			$('input:checkbox').not(this).prop('checked', this.checked)
		});

 
		
	</script>
</body>
</html>