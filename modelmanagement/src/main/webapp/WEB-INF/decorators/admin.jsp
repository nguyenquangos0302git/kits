<%@include file="/WEB-INF/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<title>Quản lý</title>

<!-- Font Awesome Icons -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value = '/resources/admin/dist/css/adminlte.min.css'/>">
<%-- <link rel="stylesheet"
	href="<c:url value = '/resources/admin/plugins/datables-bs4/css/dataTables.bootstrap4.min.css'/>"> --%>
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet" />
<!-- jQuery -->
<script
	src="<c:url value = '/resources/admin/plugins/jquery/jquery.min.js'/>"></script>
<script
	src="<c:url value='/resources/paging/jquery.twbsPagination.js'/>"></script>
<script src="<c:url value = '/resources/admin/js/fstdropdown.js'/>"></script>
<link rel="stylesheet"
	href="<c:url value = '/resources/admin/css/fstdropdown.css'/>">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value = '/resources/admin/css/style.css'/>">
<link rel="stylesheet"
	href="<c:url value = '/resources/admin/css/style1.css'/>">
<link rel="stylesheet"
	href="<c:url value = '/resources/admin/css/style2.css'/>">
<link rel="stylesheet"
	href="<c:url value="/resources/private/admin/account/css/style.css"/>">
<link rel="shortcut icon" href="#">
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<div class="backgroundshadow"></div>
		<!-- header -->
		<%@include file="/WEB-INF/common/admin/header.jsp"%>
		<%@include file="/WEB-INF/common/admin/menu.jsp"%>
		<!-- header -->

		<dec:body />

		<!-- footer -->
		<%@include file="/WEB-INF/common/admin/footer.jsp"%>
		<!-- footer -->
	</div>



	<!-- Bootstrap 4 -->
	<script
		src="<c:url value = '/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	<!-- AdminLTE App -->
	<script
		src="<c:url value = '/resources/admin/dist/js/adminlte.min.js'/>"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
	<script src="<c:url value="/resources/ckeditor/ckeditor.js"/>"></script>
</body>
</html>