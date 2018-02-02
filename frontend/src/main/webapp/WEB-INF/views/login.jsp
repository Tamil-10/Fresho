
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
	background-image: url("resources/images/bg/background.jpg");
}
label{
	color: white;
}
#btn{
background-color: red;
color: black;
text-decoration: none !important;
}
#footer{
margin-top: 300px;
}
b{
color: red;
text-align: center;
}
</style>
<title>Login</title>
</head>
<body>
<br> <br> <br>
<br> <br> <br>
<%@ include file="Header.jsp"%>
<form class="form-horizontal" action="isvaliduser" method="post">
  <div class="form-group">
    <label class="control-label col-sm-offset-2 col-sm-3" for="email">Email:</label>
    <div class="col-sm-3">
      <input type="email" class="form-control" name="emailId" id="emailId" placeholder="Enter email" required>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-offset-2 col-sm-3" for="pwd">Password:</label>
    <div class="col-sm-3"> 
      <input type="password" class="form-control" name="password" id="password" placeholder="Enter password" required>
    </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-offset-2 col-sm-3" for="password"></label>
    <div class="col-sm-3"> 
      <c:if test="${not empty error}">
				<div class="error"><b>${error}</b></div>
	 			</c:if> 
				<c:if test="${not empty logout}">
			<div class="msg"><b>${logout}</b></div>
				</c:if>				
				<b>${message}</b>
    </div>
				</div>
  <div class="form-group"> 
    <div class="col-sm-offset-5 col-sm-3">
      <button type="submit" class="btn btn-dark" id="subbutton">Login</button>
      <c:url value="/signup" var="register"></c:url>
	  <u><button id="btn" class= "btn btn-danger"><a id="btn" href="${register}">New User?</a></button></u><br>
    </div>
  </div>
</form>
</body>
</html>