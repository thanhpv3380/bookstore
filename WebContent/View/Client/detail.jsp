
<%@page import="BEAN.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/View" var="url"></c:url>
<!DOCTYPE html>
<%@page import="BEAN.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

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
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div class="products-details">
						<div class="preview_image">
							<div class="preview-small" style="text-align:center;">
								<img id="zoom_03" src="uploadDir/${prod.img}" height="300px" alt="">
							</div>
						</div>
						<div class="products-description">
							<h5 class="name">${prod.name}</h5>
							<p>
								<img alt="" src="${url}/images/star.png">
							</p>
							<hr class="border">
							<div class="price">
								Price : <span class="new_price"> ${prod.price}00 VND </span>
							</div>
							<hr class="border">
							<div class="wided">
								<div class="qty">
									Amount &nbsp;&nbsp;: &nbsp;&nbsp; <input type="text"
										style="text-align: center;" size="3" name="amount" value="1" />
								</div>
								<div class="button_group">
									<a style="cursor: pointer;background-color: #f7544a; color: white;" class="button add-cart" href="AddToCartController?idProd=${prod.id_product}">Add To
												Cart</a>
									
								</div>
							</div>

						</div>
					</div>
					<div class="clearfix"></div>
					<div class="tab-box">
						<div id="tabnav">
							<ul>
								<li><a href="#Descraption"> DESCRIPTION </a></li>
							</ul>
						</div>
						<div class="tab-content-wrap">
							<div class="tab-content" id="Descraption">
								<p>${prod.detail}</p>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					<div id="productsDetails" class="hot-products">
						<h3 class="title">
							<strong> Relate </strong> Products
						</h3>
						<div class="control">
							<a id="prev_hot" class="prev" href="#"> &lt; </a> <a
								id="next_hot" class="next" href="#"> &gt; </a>
						</div>
						<ul id="hot">
							<%
								List<Product> list = (ArrayList<Product>) request.getAttribute("listProd_CategoryProd");
								int leng = list.size();
								int l = leng / 3;
								if (leng % 3 != 0)
									l++;
								for (int i = 0; i < l; i++) {
							%>
							<li>
								<div class="row">
									<%
										int col;
											if (i * 3 + 3 > leng)
												col = leng;
											else
												col = i * 3 + 3;
											for (int j = i * 3; j < col; j++) {
												Product prod = list.get(j);
									%>
									<div class="col-md-4 col-sm-4">
										<div class="products">
											<div class="thumbnail">
												<a
													href="DetailProdController?idProd=<%out.print(prod.getId_product());%>"><img
													src="uploadDir/<%out.print(prod.getImg());%>"
													width="150px" height="220px" alt="Product Name"></a>
											</div>
											<div class="productname">
												<%
													out.print(prod.getName());
												%>
											</div>
											<h4 class="price">
												<%
													out.print(prod.getPrice());
												%>00 VND
											</h4>
											<div class="button_group">
												<button class="button add-cart" type="button">Add
													To Cart</button>
											</div>
										</div>
									</div>
									<%
										}
									%>
								</div>
							</li>
							<%
								}
							%>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-3">
					<div class="special-deal leftbar">
						<h4 class="title">
							<strong> Information </strong>
						</h4>
						<div class="special-item" style="font-size: 15px;">
							<div class="product-image">
								Category: 
							</div>
							<div class="product-info">
								${prod.categoryprod}
							</div>
						</div>
						<div class="special-item" style="font-size: 15px;">
							<div class="product-image">
								Publisher: 
							</div>
							<div class="product-info">
								${prod.publisher}
							</div>
						</div>
						<div class="special-item" style="font-size: 15px;">
							<div class="product-image">
								Author: 
							</div>
							<div class="product-info">
								${prod.author}
							</div>
						</div>
						<div class="special-item" style="font-size: 15px;"> 
							<div class="product-image">
								Dimension: 
							</div>
							<div class="product-info">
								${prod.dimension} cm
							</div>
						</div>
						<div class="special-item" style="font-size: 15px;">
							<div class="product-image">
								Weight
							</div>
							<div class="product-info">
								${prod.weight} (g)
							</div>
						</div>
						<div class="special-item" style="font-size: 15px;">
							<div class="product-image">
								Year:
							</div>
							<div class="product-info">
								${prod.year}
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="our-brand"></div>
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