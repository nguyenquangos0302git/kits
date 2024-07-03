<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 Not Found</title>
</head>
<link rel="stylesheet"
	href="<c:url value="/resources/notfound/css/style.css"/>">
<body>


	<dec:body />

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.1.1/gsap.min.js"></script>
<script src="<c:url value = '/resources/notfound/js/index.js'/>"></script>
</html>