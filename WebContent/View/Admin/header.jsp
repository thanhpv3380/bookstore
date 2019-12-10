<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="BEAN.Users" %>
<c:url value="/View" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title>Header</title>
</head>
<body>
	<% 	
		Users user = (Users)session.getAttribute("admin");
	%> 
	<!--================ start header Area  =================-->
	<div class="header">
		<div class="container">
			<div class="row">
				<div class="col-md-2 col-sm-2">
					<div class="logo">
						<a href="ProductController"><img src="${url}/images/logo.png"
							alt="FlatShop"></a>
					</div>
				</div>
				<div class="col-md-10 col-sm-10">
					<div class="header_top">
						<div class="row">
							<div class="col-md-3"></div>
							<div class="col-md-6">
								<ul class="topmenu">
									<li><a href="#">WebBook.com - Đại Học Bách Khoa Hà Nội
											- 01688131321</a></li>
								</ul>
							</div>
							<div class="col-md-3">
								<ul class="usermenu">
								
									<li style="color:#fff;">Welcome, <% if (user != null) { out.print(user.getUserName()); } %></li> 
									<li><a href="LogoutController" class="reg">Logout</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="header_bottom">
						<ul class="option">
							<li id="search" class="search">
								<form method="POST" action="SearchProdController">
									<input class="search-submit" type="submit" value="">
									<input class="search-input" placeholder="Enter your search term..." type="text" value="" name="search">
								</form>
							</li>
						</ul>
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span><span
									class="icon-bar"></span><span class="icon-bar"></span><span
									class="icon-bar"></span>
							</button>
						</div>
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
								<li><a href="ProductController">Product</a></li>
								<li><a href="CategoryProdController">Category-Product</a></li>
								<li><a href="AuthorController">Author</a></li>
								<li><a href="PublisherController">Publisher</a></li>
								<li><a href="UserController">Users</a></li>
								<li><a href="OrderController">Order</a></li>
								<!-- <li>
									<a href="index.html" class="dropdown-toggle"
									data-toggle="dropdown">khác</a>
									<div class="dropdown-menu">
										<ul class="mega-menu-links">
											<li><a href="#">pip</a></li>
											<li><a href="#">pip</a></li>
											<li><a href="#">pip</a></li>
											<li><a href="#">pip</a></li>
											<li><a href="#">pip</a></li>
											<li><a href="#">pip</a></li>
										</ul>
									</div>
								</li> -->
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================Header Menu Area =================-->
</body>
</html>