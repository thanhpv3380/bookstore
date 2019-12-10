<%@page import="BEAN.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/View" var="url"></c:url>
<%@page import="BEAN.Product"%> 
<%@page import="BEAN.Users"%> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WebBook-Admin</title>
<link href="${url}/css/bootstrap.css" rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100'
	rel='stylesheet' type='text/css'>
<link href="${url}/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="${url}/css/flexslider.css" type="text/css"
	media="screen" />
<link href="${url}/css/sequence-looptheme.css" rel="stylesheet"
	media="all" />
<link href="${url}/css/style.css" rel="stylesheet">
<link href="${url}/css/style-admin.css" rel="stylesheet">

</head>
<body>
	<% 
	
		Users user = (Users)session.getAttribute("admin");
		if (user == null) {
			 response.sendRedirect("TrangchuController");
		} 
	%> 
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Start feature Area -->
	<div class="clearfix"></div>
	<% 
		List<Product> list = (ArrayList<Product>)request.getAttribute("listProd");
		if (list.size() <= 0) {
	%>
	<h1 style="text-align: center;margin:232.5px;">No Result</h1>
	<% } else { %>
	<div class="container-fluid content">
		<div class="title">Product</div>
		<table class="table table-hover table-bordered">
			<thead>
				<tr>
					<th>Id</th>
					<th>Name </th>
					<th>Image</th>
					<th>Price(VND)</th>
					<th>Detail</th>
					<th>Amount</th>
					<th>Year</th>
					<th>Dimension</th>
					<th>Weight</th>
					<th>Author</th>
					<th>Publisher</th>
					<th>Category</th>
					<th><a href="AddProductController"><button type="button" class="btn btn-info">Add</button></a></th>
				</tr>
			</thead>
			
				
			<tbody>
				
				<c:forEach items="${listProd}" var="l">
					<tr>
						<td>${l.id_product}</td>
						<td>${l.name}</td>
						<td><img src="uploadDir/${l.img}" width="180" height="180"/></td>
						<td>${l.price}00</td>
						<td>${l.detail}</td>
						<td>${l.amount}</td>
						<td>${l.year}</td>
						<td>${l.dimension}</td>
						<td>${l.weight}</td>
						<td>${l.author}</td>
						<td>${l.publisher}</td>
						<td>${l.categoryprod}</td>
						<td>
							<a href="EditProductController?idProd=${l.id_product}"><button type="button" class="btn btn-warning">Edit</button></a>
							<a href="DeleteController?name=product&id=${l.id_product}"><button type="button" class="btn btn-danger">Delete</button></a>
						</td>
					</tr>
				</c:forEach>			
			</tbody>			
		</table>
	</div>
	<% } %>
	<div class="clearfix"></div>
	<!-- End feature Area -->
	<!--================ start footer Area  =================-->
	<jsp:include page="footer.jsp"></jsp:include>
	<!--================ End footer Area  =================-->

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!-- Bootstrap core JavaScript==================================================-->
	<script type="text/javascript" src="${url}/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${url}/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="${url}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${url}/js/jquery.sequence-min.js"></script>
	<script type="text/javascript"
		src="${url}/js/jquery.carouFredSel-6.2.1-packed.js"></script>
	<script defer src="${url}/js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="${url}/js/script.min.js"></script>
</body>

</html>