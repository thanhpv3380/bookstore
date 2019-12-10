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
	<%-- <div class="hom-slider">
		<div class="container">
			<div id="sequence">
				<div class="sequence-prev">
					<i class="fa fa-angle-left"></i>
				</div>
				<div class="sequence-next">
					<i class="fa fa-angle-right"></i>
				</div>
				<ul class="sequence-canvas">
					<li class="animate-in">
						<div class="flat-caption caption1 formLeft delay300 text-center">
							<span class="suphead">Paris show 2014</span>
						</div>
						<div class="flat-caption caption2 formLeft delay400 text-center">
							<h1>Collection For Winter</h1>
						</div>
						<div class="flat-caption caption3 formLeft delay500 text-center">
							<p>
								Lorem Ipsum is simply dummy text of the printing and typesetting
								industry.<br>Lorem Ipsum is simply dummy text of the
								printing and typesetting
							</p>
						</div>
						<div class="flat-button caption4 formLeft delay600 text-center">
							<a class="more" href="#">More Details</a>
						</div>
						<div class="flat-image formBottom delay200" data-duration="5"
							data-bottom="true">
							<img src="${url}/images/slider-image-01.png" alt="">
						</div>
					</li>
					<li>
						<div class="flat-caption caption2 formLeft delay400">
							<h1>Collection For Winter</h1>
						</div>
						<div class="flat-caption caption3 formLeft delay500">
							<h2>
								Etiam velit purus, luctus vitae velit sedauctor<br>egestas
								diam, Etiam velit purus.
							</h2>
						</div>
						<div class="flat-button caption5 formLeft delay600">
							<a class="more" href="#">More Details</a>
						</div>
						<div class="flat-image formBottom delay200" data-bottom="true">
							<img src="${url}/images/slider-image-02.png" alt="">
						</div>
					</li>
					<li>
						<div class="flat-caption caption2 formLeft delay400 text-center">
							<h1>New Fashion of 2013</h1>
						</div>
						<div class="flat-caption caption3 formLeft delay500 text-center">
							<p>
								Lorem Ipsum is simply dummy text of the printing and typesetting
								industry. <br>Lorem Ipsum is simply dummy text of the
								printing and typesetting
							</p>
						</div>
						<div class="flat-button caption4 formLeft delay600 text-center">
							<a class="more" href="#">More Details</a>
						</div>
						<div class="flat-image formBottom delay200" data-bottom="true">
							<img src="${url}/images/slider-image-03.png" alt="">
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="promotion-banner">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-sm-4 col-xs-4">
						<div class="promo-box">
							<img src="${url}/images/promotion-01.png" alt="">
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-4">
						<div class="promo-box">
							<img src="${url}/images/promotion-02.png" alt="">
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-4">
						<div class="promo-box">
							<img src="${url}/images/promotion-03.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> --%>
	<div class="container_fullwidth">
		<div class="container">
			<div class="hot-products">
				<h3 class="title">
					<strong>Newest</strong> Products
				</h3>
				<div class="control">
					<a id="prev_hot" class="prev" href="#">&lt;</a><a id="next_hot"
						class="next" href="#">&gt;</a>
				</div>
				<ul id="hot">
					<% 
						List<Product> list = (ArrayList<Product>)request.getAttribute("listProd_Year"); 
						int leng = list.size();
						int l = leng / 4;
						if (leng % 4 != 0) l++;
						for (int i = 0; i < l; i++){
							
						
					%>
					<li>
						<div class="row">
							<% 
								int col;
								if (i*4+4 > leng) col = leng; else col=i*4+4;
									for (int j=i*4; j < col; j++){
										Product prod = list.get(j);
								
							%>
								<div class="col-md-3 col-sm-6">
									<div class="products">
										<div class="thumbnail">
											<a href="DetailProdController?idProd=<% out.print(prod.getId_product()); %>"><img
												src="uploadDir/<% out.print(prod.getImg()); %>" width="150px" height="220px"
												alt="Product Name"></a>
										</div>
										<div class="productname">
											<br>
											
											<% out.print(prod.getName()); %>
										</div>
										<h4 class="price"><% out.print(prod.getPrice()); %>00 VND</h4>
										<div class="button_group">
											<a style="cursor: pointer;" class="button add-cart" href="AddToCartController?idProd=<% out.print(prod.getId_product()); %>">Add To
												Cart</a>
										</div>
									</div>
								</div>	
							<% } %>
						</div>
					</li>
					<% } %>
				</ul>
			</div>
			<div class="clearfix"></div>
			<div class="featured-products">
				<h3 class="title">
					<strong>Buy</strong> Products
				</h3>
				<div class="control">
					<a id="prev_featured" class="prev" href="#">&lt;</a><a
						id="next_featured" class="next" href="#">&gt;</a>
				</div>
				<ul id="featured">
					<% 
						list = (ArrayList<Product>)request.getAttribute("listProd_Amount"); 
						leng = list.size();
						l = leng / 4;
						if (leng % 4 != 0) l++;
						for (int i = 0; i < l; i++){			
					%>
					<li>
						<div class="row">
							<% 
								int col;
								if (i*4+4 > leng) col = leng; else col=i*4+4;
									for (int j=i*4; j < col; j++){
										Product prod = list.get(j);
								
							%>
							<div class="col-md-3 col-sm-6">
								<div class="products">
									<div class="thumbnail">
										<a href="DetailProdController?idProd=<% out.print(prod.getId_product()); %>"><img
											src="uploadDir/<% out.print(prod.getImg()); %>" width="150px" height="220px"
											alt="Product Name"></a>
									</div>
									<div class="productname">
										<% 
											out.print(prod.getName()); 
										%>
									</div>
									<h4 class="price"><% out.print(prod.getPrice()); %>00 VND</h4>
									<div class="button_group">
										<a style="cursor: pointer;" class="button add-cart" href="AddToCartController?idProd=<% out.print(prod.getId_product()); %>">Add To
												Cart</a>
									</div>
								</div>
							</div>
							<% } %>
						</div>
					</li>
					<% } %>
				</ul>
			</div>
			<div class="clearfix"></div>
			<div class="our-brand">
				<!-- <h3 class="title"><strong>Our </strong> Brands</h3>
               <div class="control"><a id="prev_brand" class="prev" href="#">&lt;</a><a id="next_brand" class="next"
                     href="#">&gt;</a></div>
               <ul id="braldLogo">
                  <li>
                     <ul class="brand_item">
                        <li>
                           <a href="#">
                              <div class="brand-logo"><img src="images/envato.png" alt=""></div>
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <div class="brand-logo"><img src="images/themeforest.png" alt=""></div>
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <div class="brand-logo"><img src="images/photodune.png" alt=""></div>
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <div class="brand-logo"><img src="images/activeden.png" alt=""></div>
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <div class="brand-logo"><img src="images/envato.png" alt=""></div>
                           </a>
                        </li>
                     </ul>
                  </li>
                  <li>
                     <ul class="brand_item">
                        <li>
                           <a href="#">
                              <div class="brand-logo"><img src="images/envato.png" alt=""></div>
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <div class="brand-logo"><img src="images/themeforest.png" alt=""></div>
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <div class="brand-logo"><img src="images/photodune.png" alt=""></div>
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <div class="brand-logo"><img src="images/activeden.png" alt=""></div>
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <div class="brand-logo"><img src="images/envato.png" alt=""></div>
                           </a>
                        </li>
                     </ul>
                  </li>
               </ul>-->
			</div>
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