
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
<script>
	var request;
	function sendInfo(id,page) {
	  	var url = "ProductListControllerAjax?id="+id+"&page="+page;
	 
	  	if (window.XMLHttpRequest) {
	   		request = new XMLHttpRequest();
	  	} else if (window.ActiveXObject) {
	   		request = new ActiveXObject("Microsoft.XMLHTTP");
	  	}
	 
	  	try {
	   		request.onreadystatechange = getInfo;
	   		request.open("POST", url, true);
	   		request.send();
	  	} catch (e) {
	   		alert("Unable to connect to server");
	  	}
	}
	function getInfo() {
		if (request.readyState == 4) {
	   		var val = request.responseText;
	   		document.getElementById("result").innerHTML = val;
	  	}
	} 
	
	/* left option */
	function sendInfo1(id,page) {
	  	var url = "ProductListPageAjaxController?id="+id+"&page="+page;
	 
	  	if (window.XMLHttpRequest) {
	   		request = new XMLHttpRequest();
	  	} else if (window.ActiveXObject) {
	   		request = new ActiveXObject("Microsoft.XMLHTTP");
	  	}
	 
	  	try {
	   		request.onreadystatechange = getInfo1;
	   		request.open("POST", url, true);
	   		request.send();
	  	} catch (e) {
	   		alert("Unable to connect to server");
	  	}
	}
	function getInfo1() {
		if (request.readyState == 4) {
	   		var val = request.responseText;
	   		document.getElementById("right").innerHTML = val;
	  	}
	} 
</script>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Start feature Area -->
	<div class="clearfix"></div>
	<div class="container_fullwidth">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="category leftbar">
						<h3 class="title">Categories</h3>
						<ul>
							<c:forEach items="${listCateProd}" var="l">
								<li><a href="#" onclick="sendInfo1(${l.id_categoryprod},1)">${l.name}</a></li>
							</c:forEach>
						</ul>
					</div>
					<%-- <div class="branch leftbar">
						<h3 class="title">Author</h3>
						<ul>
							<c:forEach items="${listAuthor}" var="l">
								<li><a href=""> ${l.name} </a></li>
							</c:forEach>
						</ul>
					</div> --%>
					<!-- <div class="price-filter leftbar">
						<h3 class="title">Price</h3>
						<form class="pricing">
							<label> $ <input type="number">
							</label> <span class="separate"> - </span> <label> $ <input
								type="number">
							</label> <input type="submit" value="Go">
						</form>
					</div> -->
				</div>
				<div class="col-md-9" id="right">
					<div class="products-grid">
						<!-- <div class="toolbar">
							<div class="sorter">
								<div class="sort-by">
									Sort by : <select name="">
										<option value="Default" selected>Default</option>
										<option value="Name">Name</option>
										<option value="Price">Price</option>
									</select>
								</div>
								<div class="limiter">
									Show : <select name="">
										<option value="3" selected>3</option>
										<option value="6">6</option>
										<option value="9">9</option>
									</select>
								</div>
							</div>
							<div class="pager">
								<a href="#" class="prev-page"> <i class="fa fa-angle-left">
								</i>
								</a> <a href="#" class="active"> 1 </a> <a href="#"> 2 </a> <a
									href="#"> 3 </a> <a href="#" class="next-page"> <i
									class="fa fa-angle-right"> </i>
								</a>
							</div>
						</div> -->
						<div class="clearfix"></div>
						<div class="row" id="result">
							<c:forEach items="${listProd_Category}" var="l">
								<div class="col-md-4 col-sm-6" title="${l.name}">
									<div class="products">
										<div class="thumbnail">
											<a href="DetailProdController?idProd=${l.id_product}"> <img
												src="uploadDir/${l.img}" width="150px" height="220px"
												alt="Product Name">
											</a>
										</div>
										<div class="productname">
											<c:if test="${l.name.length() >= 25}">
												${l.name.substring(0,25)}
											</c:if>
											<c:if test="${l.name.length() < 25}">
												${l.name}
											</c:if>
										</div>
										<h4 class="price">${l.price}00 VND</h4>
										<div class="button_group">
											<a style="cursor: pointer;" class="button add-cart" href="AddToCartController?idProd=${l.id_product}">Add To
												Cart</a>
											
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

						<div class="clearfix"></div>
						<div class="toolbar">
							<%-- <div class="sorter bottom">
								<div class="sort-by">
									Sort by : <select name="">
										<option value="Default" selected>Default</option>
										<option value="Name">Name</option>
										<option value="<strong>#</strong>">Price</option>
									</select>
								</div>
								<div class="limiter">
									Show : <select name="">
										<option value="3" selected>3</option>
										<option value="6">6</option>
										<option value="9">9</option>
									</select>
								</div>
							</div> --%>
							<div class="pager">
								<a href="#" class="prev-page"> <i class="fa fa-angle-left">
								</i>
								</a>
								<%
									int numberpage = (Integer) request.getAttribute("page");
									for (int i = 0; i < numberpage; i++) {
								%>
								<a href="#" onclick="sendInfo(${id_categoryprod},<%out.println(i + 1);%>)">
									<%
										out.println(i + 1);
									%>
								</a>
								<%
									}
								%>
								<a href="#" class="next-page"> <i class="fa fa-angle-right">
								</i>
								</a>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<!-- <div id="result"></div> -->
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