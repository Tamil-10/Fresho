<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br><br><br><br><br>
<head>
<style>
.album {
  margin: 1em 8em;
  width: 80%;
  overflow: hidden;
  background: transparent;
  color: white;
  font-size:16px;
  border-radius: 10px;
  border: 1px solid white;
}
.album tr {
  border: 1px solid white;
}
.album tr:nth-child(odd) {
  background-color: transparent;
}
.album th {
  display: none;
  border: 1px solid white;
  background-color: white;
  color: black;
  padding: 1em;
}
.album th:first-child {
  display: table-cell;
  text-align: center;
}
.album th:nth-child(2) {
  display: table-cell;
}
.album th:nth-child(2) span {
  display: none;
}
.album th:nth-child(2):after {
  content: attr(data-th);
}
@media (min-width: 480px) {
  .album th:nth-child(2) span {
    display: block;
    
  }
  .album th:nth-child(2):after {
    display: none;
  }
}
.album td {
  display: block;
  word-wrap: break-word;
  max-width: 7em;
}
.album td:first-child {
  display: table-cell;
  text-align: center;
  border-right: 1px solid white;
}
@media (min-width: 480px) {
  .album td {
    border: 1px solid white;
  }
}
.album th, .album td {
  text-align: center;
  margin: .5em 1em;
}
@media (min-width: 480px) {
  .album th, .album td {
    display: table-cell;
    padding: 1em;
  }
}
a{
color:red;
}
body {
  background-image: url("http://www.intrawallpaper.com/static/images/HD-Desktop-Wallpapers44.jpg")!important;
}
h1 {
  font-weight: normal;
  color: #024457;
}
h1 span {
  color: #167F92;
}
</style>
</head>
<body>
<table class="album">
  <tr>
    <th align="left">S.No</th>
		<th>Id</th>
		<th>Product Image</th>
		<th>Name</th>
		<th>Description</th>
		<th>Stock</th>
		<th>Price</th>
		<th>Category</th>
		<th>SupplierName</th>
		<th>Edit</th>
		<th>Delete</th>
  </tr>
  <c:forEach items="${productList}" var="product" varStatus="status">
  <tr>
    <td>${status.count}</td>
			<td>${product.productId}</td>
			<td> <img src="resources/product/${product.productId}.jpg" alt="${product.productId}" width=100px; height=100px;></td>
			<td>${product.productName}</td>
			<td>${product.productDescription}</td>
			<td>${product.stock}</td>
			<td>${product.price}</td>
			<td>${product.category}</td>
			<td>${product.supplierName}</td>
			
			<td><a href="editProduct?productId=${product.productId}"><span
									class="glyphicon glyphicon-pencil"></span></a></td>
			<td><a href="deleteProduct?productId=${product.productId}" onclick="return confirm('Are You Sure? Do you Want Delete Album : ${product.productName} ?')"><span
									class="glyphicon glyphicon-trash"></span></a></td>
  </tr>
  </c:forEach>
</table>
</body>
