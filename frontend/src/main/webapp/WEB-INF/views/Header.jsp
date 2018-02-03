<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
  .navbar-default {
    background-color:black;
    border-color: #2AB20B;
}

.navbar-default .navbar-brand {
    color: white;
}
.navbar-default .navbar-brand:hover,
.navbar-default .navbar-brand:focus {
    color: green;
}
.navbar-default .navbar-nav > li > a {
    color: white;
}
.nav .open>a, .nav .open>a:focus, .nav .open>a:hover{
    background-color: green;
}
.navbar, .dropdown-menu{
background:#49F722  ;
border: none;

}

.nav>li>a, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover, .dropdown-menu>li>a, .dropdown-menu>li{
  border-bottom: 3px solid transparent;
}
.nav>li>a:focus, .nav>li>a:hover,.nav .open>a, .nav .open>a:focus, .nav .open>a:hover, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover{
  border-bottom: 3px solid transparent;
  background: none;
}
.navbar a, .dropdown-menu>li>a, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover, .navbar-toggle{
 color: #fff;
}
.dropdown-menu{
      -webkit-box-shadow: none;
    box-shadow:none;
}

.nav li:hover:nth-child(8n+1), .nav li.active:nth-child(8n+1){
  border-bottom: #C4E17F 3px solid;
}
.nav li:hover:nth-child(8n+2), .nav li.active:nth-child(8n+2){
  border-bottom: #F7FDCA 3px solid;
}
.nav li:hover:nth-child(8n+3), .nav li.active:nth-child(8n+3){
  border-bottom: #FECF71 3px solid;

}
.navbar-toggle .icon-bar{
    color: black;
    background: #fff;
}
.navbar-right {
margin-right:10px;
}
 i {
   padding-left:10px;
   }
  </style>
<script>
    $(document).ready(function () {
        $('.dropdown-toggle').dropdown();
    });
</script>
</head>
<body>
 <div class="container-fluid">
 <div class="row">
<nav class="navbar navbar-default navbar-fixed-top">

    <div class="navbar-header">
     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    <a class="navbar-brand" href="#" title="Only fresh Fruits and Vegetables">
  <img style="max-width:120px; margin-top: -18px;" src="resources/logo/imageedit_2_93202877191.png" alt="Fresho" >
</a>
  </div>
  
  <div class="collapse navbar-collapse" id="myNavbar">
    <ul class="nav navbar-nav">
      <li><a href="index">Home</a></li>
      <c:if test="${pageContext.request.userPrincipal.name==null }">
							<li><a href="displayartist" id="page">Supplier</a></li>
							<li><a href="albums" id="page">Products</a></li>
							</c:if>
							<security:authorize access="hasRole('ROLE_USER')">
							<li><a href="displayartist" id="page">Supplier</a></li>
							<li><a href="albums" id="page">Products</a></li>
							</security:authorize>
      <security:authorize access="hasRole('ROLE_ADMIN')">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="CategoryView">View</a></li>
          <li><a href="Category">Add</a></li>
        
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Supplier<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="SupplierView">View</a></li>
          <li><a href="Supplier">Add</a></li>
        
        </ul>
      </li>
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Product<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="viewProduct">View</a></li>
          <li><a href="Product">Add</a></li>
       
        </ul>
      </li>
      </security:authorize>
      <li><a href="#">About Us</a></li>
    </ul>
    <c:if test="${pageContext.request.userPrincipal.name==null }">
   <form class="navbar-form navbar-left" action="/action_page.php">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search here" name="search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search" style="color: #49F722;font-size: 1.45em;padding-left:10px;"></i>
          </button>
        </div>
      </div>
    </form>
    </c:if>
    <security:authorize access="hasRole('ROLE_USER')">
     <form class="navbar-form navbar-left" action="/action_page.php">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search here" name="search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search" style="color: #49F722;font-size: 1.45em;padding-left:10px;"></i>
          </button>
        </div>
      </div>
    </form>
    </security:authorize>
    <ul class="nav navbar-nav navbar-right">
    <c:if test="${pageContext.request.userPrincipal.name==null }">
    <c:url value="/login" var="login"> </c:url>
     <li><a href="${login}"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
     <c:url value="/signup" var="signup"> </c:url>
      <li><a href="${signup}"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      </c:if>
      <c:if test="${pageContext.request.userPrincipal.name!=null }">
									<li id="right"><security:authorize access="hasRole('ROLE_USER')">
					<li><a href="#">Hi ${pageContext.request.userPrincipal.name}!!</a></li>
					</security:authorize></li>
					<c:url value="/logout" var="logout"></c:url>
							<li id="right"><a href="${logout}"><span
									class="glyphicon glyphicon-log-out"></span> Logout</a></li>
									</c:if>
      </ul>
    </div>
  </div>
  </div>
</nav>
</body>
</html>