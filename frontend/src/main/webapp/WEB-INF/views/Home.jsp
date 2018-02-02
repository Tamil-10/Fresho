<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Fresho</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="resources/css/style.css" type="text/css">
</head>
<body style="background-color:#fff">
<nav class="navbar navbar-default navbar-fixed-top">
 <div class="container-fluid">
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
      <li><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Fruits</a></li>
          <li><a href="#">Vegetables</a></li>
        
        </ul>
      </li>
      <li><a href="#">About Us</a></li>
    </ul>
   <form class="navbar-form navbar-left" action="/action_page.php">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search here" name="search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search" style="color: #49F722"></i>
          </button>
        </div>
      </div>
    </form>
    <ul class="nav navbar-nav navbar-right">
    <c:url value="/login" var="login"> </c:url>
    <c:url value="/signup" var="signup"> </c:url>
     <li><a href="${login}"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      <li><a href="${signup}"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
     
    </ul>
    </div>
  </div>
</nav>
<br><br><br>
<h4 style="color:black;">&nbsp;&nbsp;&nbsp;Eat healthy, stay healthy</h4><br>


</body>
</html>