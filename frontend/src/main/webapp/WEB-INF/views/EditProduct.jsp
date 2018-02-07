<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
body {
	background-image: url("resources/background.jpg");
}
label{
	color: white;
}
</style>
</head>
<body>
<script>
function formCategory(){
	// Make quick references to our fields
	
	var productname = document.getElementById('productname');
	var productdescription = document.getElementById('productdescription');
	// Check each input in the order that it appears in the form!
	
				if (notEmpty(productname, "Category Name Should not be empty")) {
						if (isAlphabet(productname,
								"Please enter only letters for Category Name")) {
							if (notEmpty(productdescription,"Category Description Should not be empty")){
							         if (isAlphabet(productdescription,
							        "Please enter only letters for Category Description")) {
															return true;
														}
													}
												}
											}
								
	
	return false;
}
function notEmpty(elem, helperMsg) {
	if (elem.value.length == 0) {
		alert(helperMsg);
		elem.focus(); // set the focus to this input
		return false;
	}
	return true;
}
function isAlphabet(elem, helperMsg) {
	var alphaExp = /^[a-z A-Z]+$/;
	if (elem.value.match(alphaExp)) {
		return true;
	} else {
		alert(helperMsg);
		elem.focus();
		return false;
	}
}
</script>
<br> <br> <br>
<br> <br> <br>
<form class="form-horizontal" action="productEdited" method="post" onsubmit="return formCategory()" enctype="multipart/form-data">
  <div class="form-group">
    <label class="control-label col-sm-offset-2 col-sm-3" for="email">Product ID:</label>
    <div class="col-sm-3">
      <input type="text" class= "form-control" name="productId" value="${product.productId}" readonly="true">
    </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-offset-2 col-sm-3" for="pwd">Product Name :</label>
    <div class="col-sm-3"> 
      <input type="text" class= "form-control" name="productName" value="${product.productName}">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-offset-2 col-sm-3" for="pwd">Product Description :</label>
    <div class="col-sm-3"> 
      <input type="text" class= "form-control" name="productDescription" value="${product.productDescription}">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-offset-2 col-sm-3" for="pwd">Supplier:</label>
    <div class="col-sm-3"> 
  <select class="form-control" name="supplierName" id="suppliername">
    <option value="">Select Supplier</option>
  <c:forEach items="${supplierList}" var="supplier" varStatus="status">
  <option value="${supplier.supplierName}">${supplier.supplierName}</option>
  </c:forEach></select>
    </div>
  </div>
      <div class="form-group">
    <label class="control-label col-sm-offset-2 col-sm-3" for="pwd">Category:</label>
    <div class="col-sm-3"> 
  <select class="form-control" name="category" id="category">
    <option value="">Select Category</option>
  <c:forEach items="${categoryList}" var="category" varStatus="status">
  <option value="${category.categoryName}">${category.categoryName}</option>
  </c:forEach></select>
    </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-offset-2 col-sm-3" for="pwd">Price:</label>
    <div class="col-sm-3"> 
      <input type="text" class="form-control" name="price" id="price" placeholder="Enter Price Amount" required>
    </div>
  </div>
      <div class="form-group">
    <label class="control-label col-sm-offset-2 col-sm-3" for="pwd">Stock:</label>
    <div class="col-sm-3"> 
      <input type="text" class="form-control" name="stock" id="stock" placeholder="Enter Stock Number" required>
    </div>
      <div class="form-group">
    <label class="control-label col-sm-offset-2 col-sm-3" for="pwd">Featured:</label>
    <div class="col-sm-3"> 
      <div class="checkbox">
  <label><input type="checkbox" name="featured"></label>
</div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-5 col-sm-3">
      <button type="submit" class="btn btn-dark" id="subbutton" value ="submit">Submit</button>
    </div>
  </div>
</form>
<br> <br> <br>
<br> <br> <br>
<br> <br> <br>
<br> <br> <br>
</body>
</html>