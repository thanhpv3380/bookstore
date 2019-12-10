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
	<div class="container-fluid content">
		<div class="title">Product</div>
		<table class="table table-hover table-bordered">
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Phone</th>
					<th>Address</th>
					<th>Date_Send</th>
					<th>Date_Receive</th>
					<th>Money</th>
					<th>State</th>
					<th></th>
				</tr>
			</thead>	
			<tbody>
				
				<c:forEach items="${listOrder}" var="l">
					<tr>
						<td>${l.id_order}</td>
						<td>${l.name}</td>
						<td>${l.phone}</td>
						<td>${l.address}</td>
						<td>${l.date_send}</td>
						<td>${l.date_receive}</td>
						<td>${l.money}</td>
						<td>Waiting</td>
						<td>
							<a href="DeleteController?name=bookstore.order&id=${l.id_order}"><button type="button" class="btn btn-danger">Delete</button></a>
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