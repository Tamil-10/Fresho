<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About Us</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
body {
	background: url(resources/images/bg/background.jpg) !important;
	padding: 0px;
}
#footer{
margin-top:200px;
}
</style>
<script src="resources/js/validate.js"></script>
<%@ include file="Header.jsp"%>
</head>
<div style="margin-top: 100px;" class="container">
	<c:if test="${!flag}">
		<form action="addAddress" method="post" class="form-horizontal"
			onsubmit="return formShiping()">
	</c:if>
	<c:if test="${flag}">
		<form action="updateAdd" method="post" class="form-horizontal"
			onsubmit="return formShiping()">
	</c:if>
	<div style="margin-top: 50px;" class="mainbox col-xs-6 col-xs-offset-3">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div style="font-size: 25px;" class="panel-title">Shipping
					Address</div>
			</div>

			<div style="padding-top: 30px" class="panel-body">

				<div style="display: none" id="login-alert"
					class="alert alert-danger col-sm-12"></div>
				<c:if test="${flag }">
					<div class="form-group">
						<label class="col-xs-3 control-label">ShipId</label>
						<div class="col-xs-9">
							<input type="text" class="form-control"
								value="${ship.shipmentId}" name="shippingId" readonly="readonly">
						</div>
					</div>
				</c:if>
				<div class="form-group">
					<label class="col-xs-3 control-label">Name</label>
					<div class="col-xs-9">
						<input type="text" class="form-control" id="userName"
							value="${ship.userName}" name="userName" placeholder="Enter Name"
							autofocus>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 control-label">ContactNo</label>
					<div class="col-xs-9">
						<input type="text" class="form-control" id="contactNumber"
							value="${ship.contactNumber }" name="contactNumber"
							placeholder="Enter phoneNumber">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 control-label">Address</label>
					<div class="col-xs-9">
						<input type="address" id="address" class="form-control"
							value="${ship.address }" name="address"
							placeholder="Enter Address">
					</div>
				</div>
				<c:if test="${!flag}">
					<div class="form-group">
						<!-- Button -->
						<div class="col-xs-offset-5 col-xs-2 col-xs-offset-5">
							<button type="submit" class="btn btn-info">Add Address</button>
						</div>
					</div>
				</c:if>
				<c:if test="${flag}">
					<div class="form-group">
						<!-- Button -->
						<div class="col-xs-offset-5 col-xs-2 col-xs-offset-5">
							<button type="submit" class="btn btn-info">Update
								Address</button>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	</form>
</div>
</html>