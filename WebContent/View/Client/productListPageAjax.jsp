<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/View" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List Ajax</title>
</head>
<body>
	<div class="products-grid">
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
						<h4 class="price">${l.price}00VND</h4>
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
			<div class="pager">
				<a href="#" class="prev-page"> <i class="fa fa-angle-left">
				</i>
				</a>
				<%
					int numberpage = (Integer) request.getAttribute("page");
					for (int i = 0; i < numberpage; i++) {
				%>
				<a href="#"
					onclick="sendInfo(${id_categoryprod},<%out.println(i + 1);%>)">
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
</body>
</html>