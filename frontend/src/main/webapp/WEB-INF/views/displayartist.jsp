<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.container1 {
	background: transparent;
	border: 1px solid #b4f7b5;
	border-radius: 5px;
	margin: 5px;
}
#f1_container1 {
	position: relative;
	width: 200px;
	margin-bottom: 5px;
	margin-left: 5px;
	height: 200px;
	z-index: 1;
}
#f1_container1 {
	perspective: 1000;
}
#f1_card1 {
	width: 100%;
	height: 100%;
	transform-style: preserve-3d;
	transition: all 1.0s linear;
}
#f1_container1:hover #f1_card1 {
	transform: rotateY(180deg);
	box-shadow: -5px 5px 5px #aaa;
}
.face {
	position: absolute;
	width: 100%;
	height: 100%;
	backface-visibility: hidden;
}
.face.back {
	display: block;
	transform: rotateY(180deg);
	box-sizing: border-box;
	padding: 10px;
	color: white;
	text-align: center;
	background-color:black;
}
.proname{
	background-color: white;
	font-size: 20px;
	margin-top: 25px;
	color: black;
}
.proprice{
	font-size: 20px;
	margin-top: 30px;
}
.alb{
height: 200px;
width: 200px;
}
#albums{
background: threedlightshadow;
color: black;
font-size: x-large;
font-family: fantasy;
margin-top: 5px; 
margin-bottom: 5px; 
}
.Latest{
padding-top: 10px;
}
#footer{
margin-top: 250px;
}
body {
	background: url(resources/images/bg/background.jpg) !important;
	padding: 0px;
	height: 100%;
}
</style>
</head>
<body>
<%@ include file="Header.jsp"%>
		<div id="albums" class="col-sm-12">
			<p class="Latest">Supplier</p>
	</div>
  <c:forEach items="${supplierList}" var="supplier" varStatus="status">
<div class="col-sm-2">
					<div id="f1_container1">
						<div id="f1_card1" class="shadow">
							<div class="front face">
								<img class="alb" src="resources/Supplier/${supplier.supplierId}.jpg" />
							</div>
							<div class="back face center">
								<p class="proname">${supplier.supplierName}</p>
								<p><a href="displayproduct?suppliername=${supplier.supplierName}"><button type="submit" class="btn btn-warning btn-md"><span class="glyphicon glyphicon-eye-open"></span>View</button></a></p>
							</div>
						</div>
					</div>
				</div>
  </c:forEach>
</body>