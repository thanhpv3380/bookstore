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
		<div class="container">
			<div class="row">
				<div class="col-md-0"></div>
				<div class="col-md-12">
					<div class="checkout-page">
						<ol class="checkout-steps">
							<li class="steps active">
								<h2 class="step-title">
									<strong>billing information</strong>
								</h2>
								<div class="step-description">
									<form action="CheckoutController?total=${total}" method="POST">
										<div class="row">
											<div class="col-md-12 col-sm-12">
												<div class="your-details">
													<h5>Your Persional Details</h5>
													<div class="form-row">
														<label class="lebel-abs"> Name <strong class="red">
																* </strong>
														</label> <input type="text" class="input namefild" required name="name">
													</div>
													<div class="form-row">
														<label class="lebel-abs"> Telephone <strong
															class="red"> * </strong>
														</label> <input type="text" class="input namefild" required name="phone">
													</div>
													<div class="form-row">
														<label class="lebel-abs"> Address <strong
															class="red"> * </strong>
														</label> <input type="text" class="input namefild" required name="address">
													</div>

												</div>
											</div>
											<div class="col-md-6 col-sm-6">
												<div class="subtotal">
													<h5>Sub Total</h5>
													<span> ${total} </span>
												</div>
												<input type="submit" class="btn-warning" value="Order" />
											</div>
										</div>
									</form>
								</div>
							</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Bootstrap core JavaScript==================================================-->
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