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
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="images/favicon.png">
<title>WebBook</title>
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


</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Start feature Area -->
	<div class="clearfix"></div>
	<div class="container_fullwidth">
		<div class="container shopping-cart">
			<div class="row">
				<div class="col-md-12">
					<h3 class="title">Shopping Cart</h3>
					<div class="clearfix"></div>
					<table class="shop-table">
						<thead>
							<tr>
								<th>Image</th>
								<th>Dtails</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Price</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							<% 
								int id_cart = (Integer)request.getAttribute("id_cart");
								List<Cart> listCart = (ArrayList<Cart>)request.getAttribute("listCart");
								float total = 0;
								for (int i = 0; i < listCart.size(); i++){
									Cart cart = listCart.get(i);
									total += cart.getNumber()*cart.getPrice();
									
							%>
							<tr>
								<c:set var = "total" scope = "session" value = "0"/>
								<td><img src="uploadDir/<% out.println(cart.getImg()); %>" alt="">
								</td>
								<td>
									<div class="shop-details">
										<div class="productname"><% out.println(cart.getName()); %></div>
										<%-- <p>
											<img alt="" src="${url}/images/star.png"> <a
												class="review_num" href="#"> 02 Review(s) </a>
										</p> --%>
									</div>
								</td>
								<td>
									<h5><% out.println(cart.getPrice()); %></h5>
								</td>
								<td>
									<% out.println(cart.getNumber()); %>
									<%-- <input type="text" name="number" value="<% out.println(cart.getNumber()); %>" size="2"/> --%>
								<td>
									<h5>
										<strong class="red"> <% out.println(cart.getNumber()*cart.getPrice()); %> </strong>
										<c:set var = "total" scope = "session" value = "0"/>
									</h5>
								</td>
								<td><a href="DeleteProdInCartController?idProd=<% out.println(cart.getId_product()); %>&idCart=<% out.println(id_cart); %>"> <img src="${url}/images/remove.png" alt="">
								</a></td>
							</tr>
							<% } %>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="6"></td>
							</tr>
						</tfoot>
					</table>
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-4 col-sm-6"></div>
						<div class="col-md-4 col-sm-6"></div>
						<div class="col-md-4 col-sm-6">
							<div class="shippingbox">
								
								<div class="grandtotal">
									<h5>TOTAL:</h5>
									<span> <% out.println(total); %></span>
								</div>
								<a href="CheckoutController?total=<% out.println(total); %>"><button>Process To Checkout</button></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>

		</div>
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