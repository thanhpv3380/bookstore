<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.List" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="BEAN.Category_Prod" %>
<%@ page import="BEAN.Users" %>
<%@ page import="DAO.Category_ProdDAO" %>
<c:url value="/View" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
</head>
<body>
	<!--================ start header Area  =================-->
	<% 
		Users user =  (Users)session.getAttribute("user");
	%> 
	<div class="header">
		<div class="container">
			<div class="row">
				<div class="col-md-2 col-sm-2">
					<div class="logo">
						<a href="TrangchuController"><img src="${url}/images/logo.png"
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
									<% if (user != null){ %>
										<li style="color:#fff;">Welcome, <% out.println(user.getUserName()); %></li>
										<li><a href="LogoutController" class="reg">Logout</a></li>
									<% } else { %>
										<li><a href="LoginController" class="log">Login</a></li>
										<li><a href="RegisterController" class="reg">Register</a></li>
									<% } %> 
									
								</ul>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="header_bottom">
						<ul class="option">
							<li id="search" class="search">
								<form>
									<input class="search-submit" type="submit" value=""><input
										class="search-input" placeholder="Enter your search term..."
										type="text" value="" name="search">
								</form>
							</li>
							<li class="option-cart"><a href="CartController" class="cart-icon">cart
							</a>
						</ul>
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span><span
									class="icon-bar"></span><span class="icon-bar"></span><span
									class="icon-bar"></span>
							</button>
						</div>
						<% 
							Connection conn = DBConnection.CreateConnection();
							List<Category_Prod> listcateProd = Category_ProdDAO.listCategory_Prod(conn);
						%>
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
								<li><a href="TrangchuController">Trang chủ</a></li>
								<% for (int i = 0; i < 5; i++){ %>
									<li><a href="ProductListController?id=<%out.print(listcateProd.get(i).getId_categoryprod());%>&page=1"><% out.print(listcateProd.get(i).getName()); %></a></li>
								<% } %>
								<li>
									<a href="index.html" class="dropdown-toggle"
									data-toggle="dropdown">khác</a>
									<div class="dropdown-menu">
										<ul class="mega-menu-links">
											<% for (int i = 5; i < listcateProd.size(); i++){ %>
												<li><a href="ProductListController?id=<%out.print(listcateProd.get(i).getId_categoryprod());%>&page=1"><% out.print(listcateProd.get(i).getName()); %></a></li>
											<% } %>
										</ul>
									</div>
								</li>
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