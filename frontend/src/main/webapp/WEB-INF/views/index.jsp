<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!-- <link rel="stylesheet" href="resources/css/style.css" type="text/css"> -->
  <title>Fresho</title>
  <style type="text/css">
 .content{
	padding-bottom: 60px;
}
  
  </style>
  </head>
<body>
 <br><br><br>
 <div class="content">
 <%@include file="Header.jsp" %>
 
 <br>
 <h4 style="color:black;">&nbsp;&nbsp;&nbsp;Eat healthy, stay healthy</h4>
 
 <%@include file="Carousel.jsp" %> 	
 <br><br>
 <c:if test="${pageContext.request.userPrincipal.name==null }">
					<%@ include file="displayfeatured.jsp"%>
					</c:if>
					<c:if test="${pageContext.request.userPrincipal.name!=null }">
					<security:authorize access="hasRole('ROLE_USER')">
					<%@ include file="displayfeatured.jsp"%>
					</security:authorize>
					</c:if>
					<br><br>
	<%-- 				<%@ include file="Footer.jsp"%> --%>
     
</div>
  	 	
</body>

</html>

