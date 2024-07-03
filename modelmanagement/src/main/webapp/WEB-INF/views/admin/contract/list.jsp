<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<c:url var="APIuri" value="/admin-contract" />
<c:url var="LISTurl" value="/admin-contract-detail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content-wrapper" style="min-height: 1200.88px;">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Contract</h1>
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
										<input type="date" class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" id="textSearch" onchange="search()"/>
										<select id="choiceDate" onchange="search()" class="dt-button buttons-colvis btn btn-white btn-primary btn-bold">
											<option value="createdate" label="Createdate"></option>
											<option value="modifieddate" label="Modifieddate"></option>
										</select>
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
													<thead id="bodythead">
														<tr class="theaddetail">
															<th><input type="checkbox" id="checkAllHead" onclick="clickSelect(this)"></th>
															<td>User's Name</td>
															<td>Description</td>
															<td>Status</td>
															<td>Totalprice</td>
															<td>Createdate</td>
															<td>Modifieddate</td>
															<td>Createdby</td>
															<td>Modifiedby</td>
															<td>Action</td>
														</tr>
													</thead>
													<tbody id="tbody">	
														<c:forEach items="${allListDTO }" var="l">
															<tr class="test">
																<td>
																	<c:if test="${l.status == 0}">
																		<input class="checkSelect" type="checkbox" id="checkbox_${l.id }" value="${l.id }" >
																	</c:if>
																</td>
																<td>${l.username}</td>
																<td>${l.description}</td>
																<td>${l.statusName}</td>
																<td>${l.totalprice}</td>
																<td>${l.createdate}</td>
																<td>${l.modifieddate}</td>
																<td>${l.createdby}</td>
																<td>${l.modifiedby}</td>
																<td>
																	<a href="${APIuri}-detail/search=${l.id}" class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip" title="Detail" ><i class="fa fa-edit" aria-hidden="true"></i> </a>
																	<c:choose>
																		<c:when test="${l.status == 0}">
																			<div onclick="checkActive(${l.id })" class="btn btn-sm btn-primary btn-edit">
																				<i class="fa fa-check" aria-hidden="true"></i>
																			</div>
																		</c:when>
																	</c:choose>
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
		
		function search(){
			var textSearch = $('#textSearch').val();
			var choice = $('#choiceDate').val();
			$.ajax({
				type : 'POST',
				url : '/model/api-admin/contract/search',
				contentType : 'application/json',
				data : JSON.stringify({
					'statusName' : choice,
					'description' : textSearch
				}),
				
				dataType : 'json',
				success : function(result){
					var test = "";
					for(var i = 0 ; i < result.length ; ++i){
						let date = new Date((result[i].createdate/1000 + 25200)*1000 ).toISOString().slice(0, 21).replace('T', ' ');
						let date1 = new Date((result[i].modifieddate/1000 + 25200)*1000 ).toISOString().slice(0, 21).replace('T', ' ');
						test += "<tr><td>";
						if(result[i].status == 0){
							test += "<input type='checkbox' id='checkbox_"+result[i].id+"' value='"+result[i].id+"'>";
						}
						test += "</td>";
						test += "<td>"+result[i].username+"</td>";
						test += "<td>"+result[i].description+"</td>";
						test += "<td>"+result[i].statusName+"</td>";
						if(result[i].totalprice==null){
							result[i].totalprice=0;
						}
						test += "<td>"+result[i].totalprice.toFixed(1)+"</td>";
						test += "<td>"+date+"</td>";
						test += "<td>"+date1+"</td>";
						test += "<td>"+result[i].createdby+"</td>";
						test += "<td>"+result[i].modifiedby+"</td>";
						test += "<td><a href=\"${APIuri}-detail/search="+result[i].id+"\" class=\"btn btn-sm btn-primary btn-edit\" data-toggle=\"tooltip\" title=\"Detail\" ><i class=\"fa fa-edit\" aria-hidden=\"true\"></i> </a>";
						if(result[i].status=='0'){
							test += "<div onclick=\"checkActive("+result[i].id+")\" class=\"btn btn-sm btn-primary btn-edit\">";
							test += "<i class=\"fa fa-check\" aria-hidden=\"true\"></i></div>";
						}
						test += "</td></tr>"			
					}
					$('.test').css('display' , 'none');
					$('#tbody').html(test);
				},
				error : function(error){
					console.log(error);
				}
			});
		}
		 
		 function checkActive(id){
					$.ajax({
						type : 'POST',
						url: '/model/api-admin/contract/active',
						contentType : 'application/json',
						data : JSON.stringify({
							'id' : id 
						}),
						dataType : 'json',
						success : function(result){
							var test = "";
							for(var i = 0 ; i < result.length ; ++i){
								let date = new Date((result[i].createdate/1000 + 25200)*1000 ).toISOString().slice(0, 21).replace('T', ' ');
								let date1 = new Date((result[i].modifieddate/1000 + 25200)*1000 ).toISOString().slice(0, 21).replace('T', ' ');
								test += "<tr><td>";
								if(result[i].status == 0){
									test += "<input type='checkbox' id='checkbox_"+result[i].id+"' value='"+result[i].id+"'>";
								}
								test += "</td>";
								test += "<td>"+result[i].username+"</td>";
								test += "<td>"+result[i].description+"</td>";
								test += "<td>"+result[i].statusName+"</td>";
								if(result[i].totalprice==null){
									result[i].totalprice=0;
								}
								test += "<td>"+result[i].totalprice.toFixed(1)+"</td>";
								test += "<td>"+date+"</td>";
								test += "<td>"+date1+"</td>";
								test += "<td>"+result[i].createdby+"</td>";
								test += "<td>"+result[i].modifiedby+"</td>";
								test += "<td><a class='btn btn-sm btn-primary btn-edit' data-toggle='tooltip' title='Edit' href=\"${APIuri}search="+result[i].id+"\"><i class='fa fa-edit' aria-hidden='true'></i></a>  ";
								if(result[i].status=='0'){
									test += "<div onclick=\"checkActive("+result[i].id+")\" class=\"btn btn-sm btn-primary btn-edit\">";
									test += "<i class=\"fa fa-check\" aria-hidden=\"true\"></i></div>";
								}
								test += "</td></tr>"
							}
							$('.test').css('display' , 'none');
							$('#tbody').html(test);
						},
						error : function(error){
							console.log(error);
						}
					});
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
					deleteContract(data);
				}
			});
		 function deleteContract(data) {
				$.ajax({
					url: '/model/api-admin/contract/delete',
					type: 'POST',
					contentType: 'application/json',
					data: JSON.stringify(data),
					dataType: 'json',
					success: function (result) {
						var test = "";
						for(var i = 0 ; i < result.length ; ++i){
							let date = new Date((result[i].createdate/1000 + 25200)*1000 ).toISOString().slice(0, 21).replace('T', ' ');
							let date1 = new Date((result[i].modifieddate/1000 + 25200)*1000 ).toISOString().slice(0, 21).replace('T', ' ');
							test += "<tr><td>";
							if(result[i].status == 0){
								test += "<input type='checkbox' id='checkbox_"+result[i].id+"' value='"+result[i].id+"'>";
							}
							test += "</td>";
							test += "<td>"+result[i].username+"</td>";
							test += "<td>"+result[i].description+"</td>";
							test += "<td>"+result[i].statusName+"</td>";
							test += "<td>"+result[i].totalprice.toFixed(1)+"</td>";
							test += "<td>"+date+"</td>";
							test += "<td>"+date1+"</td>";
							test += "<td>"+result[i].createdby+"</td>";
							test += "<td>"+result[i].modifiedby+"</td>";
							test += "<td><a class='btn btn-sm btn-primary btn-edit' data-toggle='tooltip' title='Edit' href=\"${APIuri}/search="+result[i].id+"\"><i class='fa fa-edit' aria-hidden='true'></i></a>  ";
							if(result[i].status=='0'){
								test += "<div onclick=\"checkActive("+result[i].id+")\" class=\"btn btn-sm btn-primary btn-edit\">";
								test += "<i class=\"fa fa-check\" aria-hidden=\"true\"></i></div>";
							}
							test += "</td></tr>"			
						}
						$('.test').css('display' , 'none');
						$('#tbody').html(test);
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
		
	</script>
</body>
</html>