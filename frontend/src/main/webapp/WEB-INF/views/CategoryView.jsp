<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br><br><br><br><br>

<head>
<style>
.responstable {
  margin: 1em 8em;
  width: 80%;
  overflow: hidden;
  background: transparent;
  color: blue;
  border-radius: 10px;
  border: 1px solid white;
}
.responstable tr {
  border: 1px solid white;
}
.responstable tr:nth-child(odd) {
  background-color: transparent;
}
.responstable th {
  display: none;
  border: 1px solid white;
  background-color: white;
  color: black;
  padding: 1em;
}
.responstable th:first-child {
  display: table-cell;
  text-align: center;
}
.responstable th:nth-child(2) {
  display: table-cell;
}
.responstable th:nth-child(2) span {
  display: none;
}
.responstable th:nth-child(2):after {
  content: attr(data-th);
}
@media (min-width: 480px) {
  .responstable th:nth-child(2) span {
    display: block;
    
  }
  .responstable th:nth-child(2):after {
    display: none;
  }
}
.responstable td {
  display: block;
  word-wrap: break-word;
  max-width: 7em;
}
.responstable td:first-child {
  display: table-cell;
  text-align: center;
  border-right: 1px solid white;
}
@media (min-width: 480px) {
  .responstable td {
    border: 1px solid white;
  }
}
.responstable th, .responstable td {
  text-align: center;
  margin: .5em 1em;
}
@media (min-width: 480px) {
  .responstable th, .responstable td {
    display: table-cell;
    padding: 1em;
  }
}
a{
color:red;
}
body {
  padding: 0 2em;
  background-image: url("resources/images/bg/background.jpg");
}
h1 {
  font-weight: normal;
  color: #024457;
}
h1 span {
  color: #167F92;
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
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<div id="albums" class="col-sm-12">
			<p class="Latest">Category</p>
	</div>
	</div>
	</div>
<table class="responstable">
  
  <tr>
    <th align="left">S.No</th>
		<th align="left">Id</th>
		<th align="left">Name</th>
		<th align="left">Description</th>
		<th align="left">Edit</th>
		<th align="left">Delete</th>
		
  </tr>
  
  <c:forEach items="${categoryList}" var="category" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td>${category.categoryId}</td>
			<td>${category.categoryName}</td>
			<td>${category.categoryDescription}</td>
			<td><a href="EditCategory?categoryId=${category.categoryId}"><span
									class="glyphicon glyphicon-pencil"></span></a></td>
			<td><a href="DeleteCategory?categoryId=${category.categoryId}" onclick="return confirm('Are You Sure? Do you Want Delete Genre : ${category.categoryName} ?')"><span
									class="glyphicon glyphicon-trash"></span></a></td>
		</tr>
	</c:forEach>
</table>
</body>