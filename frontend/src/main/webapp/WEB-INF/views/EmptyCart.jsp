<%@ include file="Header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
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
background: threedlightshadow;
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
#footer{
margin-top: 200px;
}
#txxt{
margin-top: 150px;
margin-bottom: 150px;
}
.cont {
	margin-top: 90px;
}
</style>
	</head>

	<div class="container cont">
		<div id="albums" class="col-sm-12">
			<p class="Latest">Cart</p>
	</div>
	<h2 class="text-center" id="txxt">Your Cart is Empty !</h2>
			<div class="text-center"><a href="index"
				class="btn btn-info"> <span
					class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
			</a></div>
</div>