<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
html {
	height: 100%;
}
body {
	background: url(resources/images/bg/background.jpg) !important;
	padding: 0px;
	height: 100%;
}
#pic {
	width: 200px;
	height: 200px;
	align: left;
}
#marginbot
{
	margin-bottom: 100px;
}
h5{
	color: blue;
}
</style>
</head>
<body>
<%@ include file="Header.jsp"%>
<br><br><br>
<br><br><br>
<div class="col-sm-offset-3 col-sm-3">
 <img id="pic"src="resources/product/${product.productId}.jpg" alt="${product.productId}">
 </div>
 <div class="col-sm-6">
<h5 >Product Name: ${product.productName}</h5>
<h5 >Product Description: ${product.productDescription}</h5>
  <h5>Price: $ ${product.price}</h5>
 <span style="color: red;"> ${message}</span>

  	<c:if test="${empty OutofStock}">
    <c:if test="${pageContext.request.userPrincipal.name == null }">
  <p><a href="login"><button class="btn btn-success">Add To Cart</button></a></p>
  <p><a href="index"><button align="left" class="btn btn-danger">Go Back</button></a></p>
  </c:if>
    <c:if test="${pageContext.request.userPrincipal.name != null }">
  <p><a href="addtocart?productId=${product.productId}"><button class="btn btn-success">Add To Cart</button></a></p>
  <p><a href="afterlogin"><button align="left" class="btn btn-danger">Go Back</button></a></p> 
  </c:if>
  </c:if>
    	<c:if test="${not empty OutofStock}">
    <c:if test="${pageContext.request.userPrincipal.name == null }">
  <p><button class="btn btn-warning">Out of Stock</button></p>
  <p><a href="index"><button align="left" class="btn btn-danger">Go Back</button></a></p>
  </c:if>
    <c:if test="${pageContext.request.userPrincipal.name != null }">
  <p><button class="btn btn-warning">Out of Stock</button></p>
  <p><a href="afterlogin"><button align="left" class="btn btn-danger">Go Back</button></a></p> 
  </c:if>
  </c:if>
  
</div>
<div id=marginbot></div>

</body>

</html>