<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center" style="display: flex; margin-top: 100px; justify-content: center; align-items: center;">
		<div style="width: 35%">
			<img alt="" src="<c:url value="resources/images/payment/system_payment_3.png" />" style="width: 100%" />
		</div>
		<div>
			<h1>Payment Done. Thank you for purchasing our models</h1>
			<br />
			<h2>Receipt Details:</h2>
			<table>
				<tr>
					<td><b>Merchant:</b></td>
					<td>Company Comedians</td>
				</tr>
				<%-- <tr>
			<td><b>Payer:</b></td>
			<td>${payer.firstName} ${payer.lastName}</td>		
		</tr>
		<tr>
			<td><b>Description:</b></td>
			<td>${transaction.description}</td>
		</tr>	
		<tr>
			<td><b>Subtotal:</b></td>
			<td>${transaction.amount.details.subtotal} USD</td>
		</tr>
		<tr>
			<td><b>Shipping:</b></td>
			<td>${transaction.amount.details.shipping} USD</td>
		</tr>
		<tr>
			<td><b>Tax:</b></td>
			<td>${transaction.amount.details.tax} USD</td>
		</tr> --%>
				<tr>
					<td><b>Total:</b></td>
					<td>${transaction.amount.total}USD</td>
				</tr>
			</table>
		</div>
	</div>


</body>
</html>