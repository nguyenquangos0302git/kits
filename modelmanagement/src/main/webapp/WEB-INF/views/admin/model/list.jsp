<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<c:url var="APIuri" value="/admin-model/" />
<c:url var="LISTurl" value="/admin-model" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model</title>
</head>
<body>
	<div class="content-wrapper" style="min-height: 1200.88px;">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Model</h1>
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
											<input	type="hidden" name="type" value = "list" />
											<input type="text" class="form-control" name="textSearch" id="textSearch" value="${model.textSearch}"
												placeholder="Search name..." />
									</div>
									<div class="card-tool" align="right" style="margin-bottom: 5px">
										<div class="dt-buttons btn-overlap btn-group">
											<a class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Thêm' href="${APIuri}update=0"> 
															<span> <i class="fa fa-plus-circle bigger-110 purple"></i> </span>
															</a>
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
														<th><input type="checkbox" id="checkAllHead" onclick="clickSelect(this)"></th>
														<td>Name</td>
														<td>Address</td>
														<td>Email</td>
														<td>Phone</td>
														<td>Model's Rank</td>
														<td>Rating</td>
														<td>Birthday</td>
														<td>Gender</td>
														<td>Nation</td>
														<td>Showonhome</td>
														<td>Createdate</td>
														<td>Modifieddate</td>
														<td>Createdby</td>
														<td>Modifiedby</td>
														<td>Action</td>
													</tr>
												</thead>
												<tbody id="tbody">

													<c:forEach items="${allList }" var="l">
														<tr class="test">
															<td><input class="checkSelect" type="checkbox" id="checkbox_${l.id}" value="${l.id}" ></td>
															<td>${l.name }</td>
															<td>${l.address }</td>
															<td>${l.email }</td>
															<td>${l.phone }</td>
															<c:forEach items="${rankModel }" var="r">
																<c:if test="${l.rankid == r.id }">
																	<td>${r.name }</td>
																</c:if>
															</c:forEach>
															<td>${l.rating }</td>
															<td>${l.birthday }</td>
															<td>
																<c:choose>
																	<c:when test="${l.gender ==false}">
																		<p>Male</p>
																	</c:when>
																	<c:when test="${l.gender ==true }">
																		<p>Female</p>
																	</c:when>
																</c:choose>
															</td>
															<td>${l.nation }</td>
															<td>${l.showonhome }</td>
															<td>${l.createdate }</td>
															<td>${l.modifieddate }</td>
															<td>${l.createdby }</td>
															<td>${l.modifiedby }</td>
															<td>
																<a class="btn btn-sm btn-primary btn-edit"
																		data-toggle="tooltip" title="Cập nhật"
																		href="${APIuri}update=${l.id}"><i class="fa fa-edit"
																			aria-hidden="true"></i> </a>
																<a id="btnDelete" onclick="return ConfirmDelete()" href="${APIuri}delete=${l.id}" type="button" class="btn btn-sm btn-primary btn-bold" title='Delete'>
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
		
		 function clickSelect(check) {
			var checkSelect = document.getElementsByClassName("checkSelect");
			if(!check.checked){
				for(var i = 0 ; i < checkSelect.length; i++){
					checkSelect[i].checked = '';
				}
			}else {
				for(var i = 0 ; i < checkSelect.length; i++){
					checkSelect[i].checked = 'checked';
				}
			}
		}
		document.getElementById("btnDelete").addEventListener("click", function () { 
			if(ConfirmDelete()){
				var data = {};
				var array = [];
				var checkSelect = document.getElementsByClassName("checkSelect");
				for(var i = 0 ; i < checkSelect.length; i++){
					if(checkSelect[i].checked){
						array.push(checkSelect[i].value);
					}
				}
				data['ids'] = array;
				deleteTalent(data);
			}
		});
		
		function deleteTalent(data) {
			$.ajax({
				url: '/model/api-admin/model/remove',
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
		
 		function ConfirmDelete()
	       {
	         var x = confirm("Are you sure you want to delete ?");
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
				url : '/model/api-admin/model/search',
				contentType : 'application/json',
				data : JSON.stringify({
					'name' : textSearch
				}),
				
				dataType : 'json',
				success : function(result){
					var test = "";
					for(var i = 0 ; i < result.length ; ++i){
						let date = new Date((result[i].createdate/1000 + 25200)*1000 ).toISOString().slice(0, 21).replace('T', ' ');
						let date1 = new Date((result[i].modifieddate/1000 + 25200)*1000 ).toISOString().slice(0, 21).replace('T', ' ');
						test += "<tr><td><input class=\"checkSelect\" type='checkbox' id='checkbox_"+result[i].id+"' value='"+result[i].id+"'></td>";
						test += "<td>"+result[i].name+"</td>";
						test += "<td>"+result[i].address+"</td>";
						test += "<td>"+result[i].email+"</td>";
						test += "<td>"+result[i].phone+"</td>";
						test += "<td>"+result[i].rank+"</td>";
						test += "<td>"+result[i].rating+"</td>";
						test += "<td>"+result[i].birthday+"</td>";
						test += "<td>"+result[i].gender+"</td>";
						test += "<td>"+result[i].nation+"</td>";
						test += "<td>"+result[i].showonhome+"</td>";
						test += "<td>"+date+"</td>";
						test += "<td>"+date1+"</td>";
						if(result[i].createdby==null){
							test += "<td></td>";
						}else{
							test += "<td>"+result[i].createdby+"</td>";
						}
						if(result[i].modifiedby!=null){
							test += "<td></td>";
						}else{
							test += "<td>"+result[i].modifiedby+"</td>";
						}
						test += "<td><a class='btn btn-sm btn-primary btn-edit' data-toggle='tooltip' title='Update' href=\"${APIuri}update="+result[i].id+"\"><i class='fa fa-edit' aria-hidden='true'></i></a>  ";
						test += "<a id='btnDelete' onclick='return ConfirmDelete()' href='${APIuri}delete="+result[i].id+"' type='button' class='btn btn-sm btn-primary btn-bold' title='Delete'>";
						test += "<span><i class=\"fa fa-trash\" ></i></span></a></td></tr>"					
					}
					$('.test').css('display' , 'none');
					$('#tbody').html(test);
				},
				error : function(error){
					console.log(error);
				}
			});
		});
		
	</script>
</body>
</html>