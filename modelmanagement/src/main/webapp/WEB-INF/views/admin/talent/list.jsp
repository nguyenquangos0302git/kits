<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-talent" />
<c:url var="LISTurl" value="/admin-talent" />
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
											<a class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Thêm'
												href="${LISTurl}/add"> <span>
													<i class="fa fa-plus-circle bigger-110 purple"></i>
												</span>
											</a>
											<button onclick="return notiDelete()" id="btnDelete" type="button"
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
															<th>Createdate</th>
															<th>Modifieddate</th>
															<th>Createby</th>
															<th>Modifiedby</th>
														</tr>
													</thead>
													<tbody id="tbody">
														<c:forEach var="item" items="${talentList}">
															<tr class="test">
																<td><input type="checkbox" id="checkbox_${item.id}"
																		value="${item.id}"></td>
																<td>${item.name}</td>
																<td>${item.getCreatedate()}</td>
																<td>${item.getModifieddate()}</td>
																<td>${item.getCreatedby()}</td>
																<td>${item.getModifiedby()}</td>
																<td>
																 	<a class="btn btn-sm btn-primary btn-edit"
																		data-toggle="tooltip" title="Cập nhật"
																		href="${LISTurl}/update/${item.id}"><i class="fa fa-edit"
																			aria-hidden="true"></i> </a>
																	<a onclick="return notiDelete()" class="btn btn-sm btn-primary btn-edit"
																		data-toggle="tooltip" title="Xóa"
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
	
		$('#checkAllHead').click(function () {
			$('input:checkbox').not(this).prop('checked', this.checked)
		});
		
		function notiDelete()
	       {
	         var x = confirm("Do you want delete?");
	         if (x){
	             return true; 
	         }
	         else
	           return false;
	       }
		
		$('#textSearch').keyup(function(){
			var textSearch = this.value;
			$.ajax({
				type : 'POST',
				url : '/model/api-admin/talent/search',
				contentType : 'application/json',
				data : JSON.stringify({
					'name' : textSearch
				}),
				dataType : 'json',
				success : function(result){
					var test = "";
					for(var i = 0 ; i < result.length ; ++i){
						let date = new Date((result[i].createdate/1000 + 25200)*1000 ).toISOString().slice(0, 19).replace('T', ' ');
						let date1 = new Date((result[i].modifieddate/1000 + 25200)*1000 ).toISOString().slice(0, 19).replace('T', ' ');
						test += "<tr><td><input type='checkbox' id='checkbox_"+result[i].id+"' value='"+result[i].id+"'></td>";
						test += "<td>"+result[i].name+"</td>";
						test += "<td>"+date+"</td>";
						test += "<td>"+date1+"</td>";
						test += "<td>"+result[i].createdby+"</td>";
						test += "<td>"+result[i].modifiedby+"</td>";
						test += "<td><a class='btn btn-sm btn-primary btn-edit' data-toggle='tooltip' title='Cập nhật' href='${LISTurl}/update/"+result[i].id+"'><i class='fa fa-edit' aria-hidden='true'></i></a>  ";
						test += "<a class='btn btn-sm btn-primary btn-edit' data-toggle='tooltip' title='Xoa'' href='${LISTurl}/"+result[i].id+"'><i class='fa fa-trash' aria-hidden='true'></i> </a></td></tr>";
					}
					$('.test').css('display' , 'none');
					$('#tbody').html(test);
				},
				error : function(error){
					console.log(error);
				}
			});
		});
		
		$("#btnDelete").click(function () {
			var data = {};
			var ids = $('tbody input[type=checkbox]:checked').map(function () {
				return $(this).val();
			}).get();
			data['ids'] = ids;
			
			deleteTalent(data);
		});
		
		function deleteTalent(data) {
			$.ajax({
				url: '/model/api-admin/talent/delete',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'text',
				success: function (result) {
					location.reload(true);
				},
				error: function (error) {
					console.log(error);
				}
			});
		}
	</script>
</body>
</html>