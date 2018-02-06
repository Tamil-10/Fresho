<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>Shipping Address</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
body {
	background-image: url("resources/images/bg/background.jpg");
}
label{
	color: white;
}
.boxed{
	background-color: black; 
	color: white;
	margin: 20px 10px; 
	border: 1px solid white; 
	border-radius: 15px;
}
#footer{
margin-top: 250px;
}
#del{
margin-top: 10px;
margin-left: 10px;
margin-bottom: 10px;
}
#edit{
margin-top: 10px;
margin-left: 170px;
margin-bottom: 10px;
}
</style>
</head>
<%@include file="/WEB-INF/views/Header.jsp" %>	
<div style="margin-top: 100px;" class="container">
	<div style="text-align: left; float: right; clear: right;">
		<a href="add" style="border-radius: 6px;"
			class="btn btn-md btn-success"><span
			style="padding-top: 3px; padding-bottom: 5px;"
			class="glyphicon glyphicon-plus"></span>Add Address</a>
	</div>
	<br>
	<hr />
	<c:forEach items="${shipdetail}" var="ship">
		<div
			class="col-md-3 boxed">
			<a href="deleteAdd?shipmentId=${ship.shipmentId}"
				class="btn btn-sm btn-danger" id="del"><span
				class="glyphicon glyphicon-trash"></span></a><a
				href="getUpdateAdd?shipmentId=${ship.shipmentId}"
				class="btn btn-sm btn-warning" id="edit"><span
				class="glyphicon glyphicon-pencil"></span></a>
			<div style="text-align: center;">
				<strong style="padding-right: 5px; word-wrap: break-word;">Name:</strong>${ship.userName}</div>
			<div style="text-align: center;">
				<strong style="padding-right: 5px; word-wrap: break-word;">Address:</strong>${ship.address }</div>
			<div style="text-align: center;">
				<strong style="padding-right: 5px; word-wrap: break-word;">PhoneNo:</strong>${ship.contactNumber}</div>
			<div style="text-align: center; margin-bottom: 10px;">
				<a href="pay?shipmentId=${ship.shipmentId}"
					style="border-radius: 6px; margin-top: 10px;" class="btn btn-md btn-info"><span
					class="glyphicon glyphicon-envelope"></span> Deliver</a>
			</div>
		</div>
	</c:forEach>
</div>