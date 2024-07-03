<%@include file="/WEB-INF/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><dec:title default="Register" /></title>
<!-- Font Icon -->
<link rel="stylesheet"
	href="<c:url value = "/resources/register/fonts/material-icon/css/material-design-iconic-font.min.css" />">
<!-- Main css -->
<link rel="stylesheet"
	href="<c:url value = "/resources/web/css/login.css"/>" />
	<link rel="shortcut icon" href="#">
</head>
<body>

	<div class="main">
		<dec:body />
	</div>

</body>
<!-- JS -->
<script src="<c:url value = "/resources/register/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value = "/resources/register/js/main.js" />"></script>
</html>