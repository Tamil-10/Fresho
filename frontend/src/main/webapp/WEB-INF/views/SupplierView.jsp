<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br><br><br><br><br>

<head>
<style>
.artist {
  margin: 1em 8em;
  width: 80%;
  overflow: hidden;
  background: transparent;
  color: blue;
  border-radius: 10px;
  border: 1px solid white;
}
.artist tr {
  border: 1px solid white;
}
.artist tr:nth-child(odd) {
  background-color: transparent;
}
.artist th {
  display: none;
  border: 1px solid white;
  background-color: white;
  color: black;
  padding: 1em;
}
.artist th:first-child {
  display: table-cell;
  text-align: center;
}
.artist th:nth-child(2) {
  display: table-cell;
}
.artist th:nth-child(2) span {
  display: none;
}
.artist th:nth-child(2):after {
  content: attr(data-th);
}
@media (min-width: 480px) {
  .artist th:nth-child(2) span {
    display: block;
    
  }
  .artist th:nth-child(2):after {
    display: none;
  }
}
.artist td {
  display: block;
  word-wrap: break-word;
  max-width: 7em;
}
.artist td:first-child {
  display: table-cell;
  text-align: center;
  border-right: 1px solid white;
}
@media (min-width: 480px) {
  .artist td {
    border: 1px solid white;
  }
}
.artist th, .artist td {
  text-align: center;
  margin: .5em 1em;
}
@media (min-width: 480px) {
  .artist th, .artist td {
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
			<p class="Latest">Supplier</p>
	</div>
	</div>
	</div>
<table class="artist">
	<thead>
		<tr>
		<th align="left">S.No</th>
		<th align="left">Id</th>
		<th align="left">Name</th>
		<th align="left">ContactNumber</th>
		<th align="left">Edit</th>
		<th align="left">Delete</th>
		</tr>
		 <c:forEach items="${supplierList}" var="supplier" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td>${supplier.supplierId}</td>
			<td>${supplier.supplierName}</td>
			<td>${supplier.contactNumber}</td>
			<td><a href="EditSupplier?supplierId=${supplier.supplierId}"><span
									class="glyphicon glyphicon-pencil"></span></a></td>
			<td><a href="DeleteSupplier?supplierId=${supplier.supplierId}"onclick="return confirm('Are You Sure? Do you Want Delete this Supplier : ${supplier.supplierName} ?')"><span
									class="glyphicon glyphicon-trash"></span></a></td>
		</tr>
	</c:forEach>
</table>
</body>