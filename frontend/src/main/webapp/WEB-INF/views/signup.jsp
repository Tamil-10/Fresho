<%-- <%@ include file="Header.jsp"%> --%>
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
<!-- <!DOCTYPE html> -->
<style>
  html {
    height: 100%;
    width: 100%;
}

body {
    background: url("https://3.bp.blogspot.com/-wJqw2lP5Xqg/UprBlPxzd0I/AAAAAAAAAaM/QA8GeihSdAU/s1600/beautiful-fruits-wallpapers-hd.jpg") no-repeat center center fixed;
    background-size: cover;
    font-family: 'Droid Serif', serif;
}

#container {
    background: rgba(3, 3, 55, 0.5);
    width: 25.75rem;
    height: 42rem;
    margin: auto;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
}

header {
    text-align: center;
    vertical-align: middle;
    line-height: 5rem;
    height: 5rem;
    background: rgba(3, 3, 55, 0.7);
    font-size: 1.4rem;
    color: #d3d3d3;
}

fieldset {
    border: 0;
    text-align: center;
}

input[type="submit"] {
    background: rgba(235, 30, 54, 1);
    border: 0;
    display: block;
    width: 100%;
    margin: 0 auto;
    color: white;
    padding: 0.7rem;
    cursor: pointer;
}

input {
    background: transparent;
    border: 0;
    border-left: 4px solid;
    border-color: #FF0000;
    padding: 10px;
    color: white;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="password"]:focus {
    outline: 0;
    background: rgba(235, 30, 54, 0.3);
    border-radius: 1.2rem;
    border-color: transparent;
}

::placeholder {
    color: #d3d3d3;
}

/*Media queries */

@media all and (min-width: 481px) and (max-width: 568px) {
    #container {
        margin-top: 10%;
        margin-bottom: 10%;
    }
}
    @media all and (min-width: 569px) and (max-width: 768px) {
        #container {
            margin-top: 5%;
            margin-bottom: 5%;
        }
    }
    
  </style>
</head>
<body>
<%@include file="Header.jsp" %>
      <div id="container">
         <header>Register new account</header>
         <form action="addNewUser" method="post">
            <fieldset>
               <br/>
               <input type="text" name="userName" id="userName" placeholder="Username" required autofocus>
               <br/><br/>
               <input type="email" name="emailId" id="emailid" placeholder="E-mail" required>
               <br/><br/>
               <input type="password" name="password" id="password" placeholder="Password" required>
               <br/><br/>
               <input type="text" name="contactNumber" id="contactNumber" placeholder="Contact Number" required>
               <br/><br/>
               <input type="text" name="address" id="address" placeholder="Address" required>
               <br/><br/>
               <input type="text" name="zipcode" id="zipcode" placeholder="Zip code" required>
                <br/> <br/> <br/> <br/>
               <label for="submit"></label>
               <input type="submit"  id="submit" value="REGISTER">
                <!-- <button type="submit" class="btn btn-dark" id="subbutton">Signup</button> -->
            </fieldset>
         </form>
         <!-- name="submit" -->
      </div>
   </body>
</html>