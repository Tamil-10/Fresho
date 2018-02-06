<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
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
</style>
</head>
<body>
		<div id="albums" class="col-sm-12">
			<p class="Latest">Featured Products</p>
	</div>
  <c:forEach items="${product}" var="product" varStatus="status">
<div class="col-sm-2">
					<div id="f1_container1">
						<div id="f1_card1" class="shadow">
							<div class="front face">
								<img class="alb" src="resources/product/${product.productId}.jpg" />
							</div>
							<div class="back face center">
								<p class="proname">${product.productName}</p>
								<p><a href="productdescription?productId=${product.productId}"><button type="submit" class="btn btn-warning btn-md"><span class="glyphicon glyphicon-eye-open"></span>View</button></a></p>
							</div>
						</div>
					</div>
				</div>
  </c:forEach>
</body>
