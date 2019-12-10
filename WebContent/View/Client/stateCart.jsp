<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="BEAN.Product"%>
<%@page import="BEAN.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BEAN.Users"%>
<c:url value="/View" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${url}/images/favicon.png">
<title>WebBook.com</title>
<link href="${url}/css/bootstrap.css" rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100'
	rel='stylesheet' type='text/css'>
<link href="${url}/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="${url}/css/flexslider.css" type="text/css"
	media="screen" />
<link href="${url}/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="clearfix"></div>
	<div class="container_fullwidth">
		<div class="container shopping-cart">
			<div class="row">
				<div class="col-md-12">
					<h3 class="title">Shipping</h3>
					<div class="clearfix"></div>
					<table class="shop-table">
						<thead>
							<tr>
								<th>Name</th>
								<th>Phone</th>
								<th>Address</th>
								<th>Date</th>
								<th>GRAND TOTAL</th>
								<th>State</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listOrder}" var="l">
							<tr>
								<td>
									<div class="shop-details">
										<div class="productname">
											<h5>${l.name}</h5>
										</div>
									</div>
								</td>
								<td>
									<div class="shop-details">
										<div class="productname">
											<h5>${l.phone}</h5>
										</div>
									</div>
								</td>
								<td>
									<div class="shop-details">
										<div class="productname">
											<h5>${l.address}</h5>
										</div>
									</div>
								</td>
								<td>
									<h5>${l.date_send}</h5>
								</td>

								<td>
									<h5>
										<strong class="red"> ${l.money} </strong>
									</h5>
								</td>
								<td>
									<h5>
										<strong class="red"> Waitting </strong>
									</h5>

								</td>
							</tr>
							</c:forEach>

						</tbody>
						<tfoot>
							<tr>
								<td colspan="6"></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>

	<!-- Bootstrap core JavaScript==================================================-->
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript" src="${url}/js/jquery-1.10.2.min.js">
		
	</script>
	<script type="text/javascript" src="${url}/js/bootstrap.min.js">
		
	</script>
	<script defer src="${url}/js/jquery.flexslider.js">
		
	</script>
	<script type="text/javascript"
		src="${url}/js/jquery.carouFredSel-6.2.1-packed.js">
		
	</script>
	<script type="text/javascript" src="${url}/js/script.min.js">
		
	</script>
</body>
</html>