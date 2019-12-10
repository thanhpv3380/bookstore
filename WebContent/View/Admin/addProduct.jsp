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
		<div class="title">Add Product</div>
		<form method="POST" action="AddProductController" enctype="multipart/form-data">
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th>Property</th>
						<th>Value</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Name</td>
						<td><input type="text" name="name" /></td>
					</tr>
					<tr>
						<td>Image</td>
						<td><input type="file" name="image"/></td>
					</tr>
					<tr>
						<td>Price</td>
						<td><input type="text" name="price" /></td>
					</tr>
					<tr>
						<td>Detail</td>
						<td><input type="text" name="detail"/></td>
					</tr>
					<tr>
						<td>Amount</td>
						<td><input type="text" name="amount"/></td>
					</tr>
					<tr>
						<td>Year</td>
						<td><input type="text" name="year"/></td>
					</tr>
					<tr>
						<td>Dimension</td>
						<td><input type="text" name="dimension"/></td>
					</tr>
					<tr>
						<td>Weight</td>
						<td><input type="text" name="weight"/></td>
					</tr>
					<tr>
						<td>Author</td>
						<td>
							<select name="author">
								<c:forEach items="${listAuthor}" var="l">
									<option value="${l.id_author}">${l.name}</option>
								</c:forEach>		
							</select>
						</td>
					</tr>
					<tr>
						<td>Publisher</td>
						<td>
							<select name="publisher">
								<c:forEach items="${listPublisher}" var="l">
									<option value="${l.id_publisher}">${l.name}</option>
								</c:forEach>		
							</select>
						</td>
					</tr>
					<tr>
						<td>Category</td>
						<td>
							<select name="categoryprod">
								<c:forEach items="${listCategoryProd}" var="l">
									<option value="${l.id_categoryprod}">${l.name}</option>
								</c:forEach>		
							</select>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" class="btn btn-info" value="Add"></td>
					</tr>

				</tbody>
			</table>
		</form>
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