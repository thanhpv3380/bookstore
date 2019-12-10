<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/View" var="url"></c:url>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- Title Page-->
	<title>Register</title>
	
	<!-- Icons font CSS-->
	<link
		href="${url}/vendor/mdi-font/css/material-design-iconic-font.min.css"
		rel="stylesheet" media="all">
	<link href="${url}/vendor/font-awesome-4.7/css/font-awesome.min.css"
		rel="stylesheet" media="all">
	<!-- Font special for pages-->
	<link
		href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
		rel="stylesheet">
	
	<!-- Vendor CSS-->
	<link href="${url}/vendor/select2/select2.min.css" rel="stylesheet"
		media="all">
	<link href="${url}/vendor/datepicker/daterangepicker.css"
		rel="stylesheet" media="all">
	
	<!-- Main CSS-->
	<link href="${url}/css/main2.css" rel="stylesheet" media="all">
</head>
<body>
	<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
		<div class="wrapper wrapper--w790">
			<div class="card card-5">
				<div class="card-heading">
					<h2 class="title">Đăng Ký WebBook.com</h2>
				</div>
				<div class="card-body">
					<form method="POST" action="RegisterController">
						<div class="form-row">
							<div class="name">Username</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" required type="text"
										name="username" id="username" onChange="sendInfo()" />
								</div>
							</div>
							<div id="result"></div>
							
						</div>
						
						<div class="form-row">
							<div class="name">Password</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" required type="password"
										name="password">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">Email</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" required type="text" name="email">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">Address</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" required type="text"
										name="address">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">Date of birth</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" required type="date" name="dob">
								</div>
							</div>
						</div>
						<div class="form-row m-b-55">
							<div class="name">Điện thoại</div>
							<div class="value">
								<div class="row row-refine">
									<!-- <div class="col-3">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="area_code">
                                            <label class="label--desc">Area Code</label>
                                        </div>
                                    </div> -->
									<div class="col-9">
										<div class="input-group-desc">
											<input class="input--style-5" required type="text"
												name="phone">
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- <div class="form-row">
                            <div class="name">Subject</div>
                            <div class="value">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select name="subject">
                                            <option disabled="disabled" selected="selected">Choose option</option>
                                            <option>Subject 1</option>
                                            <option>Subject 2</option>
                                            <option>Subject 3</option>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
						<!-- <div class="form-row p-t-20">
							<label class="label label--block">Đồng ý với điều khoản?</label>
							<div class="p-t-15">
								<label class="radio-container m-r-55">Có <input
									type="radio" checked="checked" name="exist"> <span
									class="checkmark"></span>
								</label> <label class="radio-container">Không <input
									type="radio" name="exist"> <span class="checkmark"></span>
								</label>
							</div>
						</div> -->
						<div>
							<button class="btn btn--radius-2 btn--blue" type="submit">Register</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Jquery JS-->
	<script src="${url}/vendor/jquery/jquery.min.js"></script>
	<!-- Vendor JS-->
	<script src="${url}/vendor/select2/select2.min.js"></script>
	<script src="${url}/vendor/datepicker/moment.min.js"></script>
	<script src="${url}/vendor/datepicker/daterangepicker.js"></script>

	<!-- Main JS-->
	<script src="${url}/js/global.js"></script>
	<script>
		$(document).ready(function(){
			$('#username').keyup(function(){
				var username = $('#username').val();
				$.ajax({
					type:'POST',
					data:{username: username},
					url:  'RegisterAjaxController',
					success: function(result){
						$('#result').html(result);	
					}
				});
			});
		});
	</script>
</body>
</html>