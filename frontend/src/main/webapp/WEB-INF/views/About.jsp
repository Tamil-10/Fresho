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
#albums{
background: white;
color: black;
font-size: x-large;
font-family: fantasy;
margin-top: 5px;
margin-bottom: 5px;
}
.Latest{
padding-top: 10px;
margin-left: 20px;
}
h3{
font-family: fantasy;
}
#para{
color: blue;
font-size: large;
}	
#footer{
margin-top: 400px;
}
	</style>
</head>
<body>
<%@ include file="Header.jsp"%>
<br><br><br>
	<div class="row">
		<div id="albums" class="col-sm-12">
			<p class="Latest">About</p>
	</div>
	</div>
<div class="row col-sm-12">
<br><br>
<p id="para" align="center">Fresho is Indias largest online grocery store.We currently offer our services in  Chennai, Coimbatore, Madurai, Selam, Nellai, Trichy city limits. </p>
</div>
<%@ include file="Footer.jsp"%>
</body>
</html>
