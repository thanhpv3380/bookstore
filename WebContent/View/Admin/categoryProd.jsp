<%@page import="BEAN.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="BEAN.Users"%> 
<c:url value="/View" var="url"></c:url>
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
	<div class="container mt-20">
		<div class="title">Category-Product</div>
		<table class="table table-hover table-bordered">
			<thead>
				<tr>
					<th>id</th>
					<th>Name CategoryProd</th>
					<th><a href="AddCategoryProdController" class="btn btn-info">Add</a></th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${listCategoryProd}" var="lCateProd">

					<tr>
						<td>${lCateProd.id_categoryprod}</td>
	
						<td>${lCateProd.name}</td>
						<td><a href="EditCateProdController?idCateProd=${lCateProd.id_categoryprod}" class="btn btn-warning">Edit</a> -
						<a href="DeleteController?name=category_prod&id=${lCateProd.id_categoryprod}" class="btn btn-danger">Delete</a>
						
						</td>
					</tr>

				</c:forEach>


			</tbody>
		</table>

	</div>
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