<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-contact" />
<c:url var="LISTurl" value="/admin-contact" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact</title>
</head>
<body>
	<div class="content-wrapper" style="min-height: 1200.88px;">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Contact</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Contact</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<section class="content">
			
			<form action="${LISTurl}" id="formSubmit" method="get" onsubmit="DoSubmit();">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<div class="row">
									<div class="col-4">
											<input	type="hidden" name="type" value = "list" />
											<input type="text" class="form-control" name="textSearch" id="textSearch" value="${model.textSearch}"
												placeholder="Search..." />
									</div>
									<div class="card-tool" align="right" style="margin-bottom: 5px">
										<div class="dt-buttons btn-overlap btn-group">
											
											<button id="btnDelete" type="button"
												class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Xóa'>
												<span> <i class="fa fa-trash"></i>
												</span>
											</button>
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
															<th>Name</th>
															<th>Email</th>
															<th>Message</th>
															<th>Createdate</th>
															<th>Modifieddate</th>
															<th>Createby</th>
															<th>Modifiedby</th>
															<th>Action</th>
														</tr>
													</thead>
													<tbody id="tbody">
														<c:forEach var="item" items="${contactList}">
															<tr class="test">
																<td><input type="checkbox" id="checkbox_${item.id}"
																		value="${item.id}"></td>
																<td>${item.name}</td>
																<td>${item.email}</td>
																<td>${item.message}</td>
																<td>${item.getCreatedate()}</td>
																<td>${item.getModifieddate()}</td>
																<td>${item.getCreatedby()}</td>
																<td>${item.getModifiedby()}</td>
																<td>
																 	
																	<a class="btn btn-sm btn-primary btn-edit"
																		data-toggle="tooltip" title="Xoa"
																		href="${LISTurl}/${item.id}"><i class="fa fa-trash"
																			aria-hidden="true"></i> </a>
																</td>
											
															</tr>
														</c:forEach>
													</tbody>
												</table>
												<ul class="pagination" id="pagination"></ul>
												<input type="hidden" value="${model.page}" id="page" name="page" />
												<input type="hidden" value="${model.maxPageItem}" id="maxPageItem" name="maxPageItem" />
												<input type="hidden" value="${model.sortName}" id="sortName" name="sortName" />
												<input type="hidden" value="${model.sortBy}" id="sortBy" name="sortBy" />
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
	
	$('#
		checkAllHead').click(function() {
			$('input:checkbox').not(this).prop('checked', this.checked)
		});

		function notiDelete() {
			var x = confirm("Do you want delete?");
			if (x) {
				return true;
			} else
				return false;
		}

		$('#textSearch')
				.keyup(
						function() {
							var textSearch = this.value;
							$
									.ajax({
										type : 'GET',
										url : 'admin-contact/search',
										contentType : 'application/json',
										data : {
											'name' : textSearch
										},
										dataType : 'json',
										success : function(result) {
											var test = "";
											for (var i = 0; i < result.length; ++i) {
												let date = new Date(
														(result[i].createdate / 1000 + 25200) * 1000)
														.toISOString().slice(0,
																19).replace(
																'T', ' ');
												let date1 = new Date(
														(result[i].modifieddate / 1000 + 25200) * 1000)
														.toISOString().slice(0,
																19).replace(
																'T', ' ');
												test += "<tr><td><input type='checkbox' id='checkbox_"+result[i].id+"' value='"+result[i].id+"'></td>";
												test += "<td>" + result[i].name
														+ "</td>";
												test += "<td>"
														+ result[i].email
														+ "</td>";
												test += "<td>"
														+ result[i].message
														+ "</td>";
												test += "<td>" + date + "</td>";
												test += "<td>" + date1
														+ "</td>";
												test += "<td>"
														+ result[i].createdby
														+ "</td>";
												test += "<td>"
														+ result[i].modifiedby
														+ "</td>";

												test += "<td><a class='btn btn-sm btn-primary btn-edit' data-toggle='tooltip' title='Xoa'' href='${LISTurl}/"+result[i].id+"'><i class='fa 					fa-trash' aria-hidden='true'></i> </a></td></tr>";
											}
											$('.test').css('display', 'none');
											$('#tbody').html(test);
										},
										error : function(error) {
											console.log(error);
										}
									});
						});

		$("#btnDelete").click(function() {
			var data = {};
			var ids = $('tbody input[type=checkbox]:checked').map(function() {
				return $(this).val();
			}).get();
			data['ids'] = ids;

			deleteTalent(data);
		});

		function deleteTalent(data) {
			$.ajax({
				url : 'http://localhost:8080/model/api-admin/contact/delete',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'text',
				success : function(result) {
					location.reload(true);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
	</script>
</body>
</html>