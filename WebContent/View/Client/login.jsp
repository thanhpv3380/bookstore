<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/View" var="url"></c:url>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<!-- Title Page-->
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${url}/images/icons/favicon.ico"/>
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${url}/vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${url}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${url}/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${url}/vendor/animate/animate.css">
	<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${url}/vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${url}/vendor/select2/select2.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${url}/css/util.css">
	<link rel="stylesheet" type="text/css" href="${url}/css/main.css">
	<!--===============================================================================================-->
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
				<form class="login100-form validate-form" method="POST" action="LoginController">
					<span class="login100-form-title p-b-55"> Đăng Nhập </span>

					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="username"
							placeholder="Username"> <span class="focus-input100"></span>
						<span class="symbol-input100"><span
							class="lnr lnr-envelope"></span>
						</span>
					</div>

					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Password is required">
						<input class="input100" type="password" name="password"
							placeholder="Password"> <span class="focus-input100"></span>
						<span class="symbol-input100"> <span class="lnr lnr-lock"></span>
						</span>
					</div>

					<!-- <div class="contact100-form-checkbox m-l-4">
						<input class="input-checkbox100" id="ckb1" type="checkbox"
							name="remember-me"> <label class="label-checkbox100"
							for="ckb1"> lưu mật khẩu </label>
					</div> -->

					<div class="container-login100-form-btn p-t-25">
						<button class="login100-form-btn">Đăng Nhập</button>
					</div>

					<!-- <div class="text-center w-full p-t-42 p-b-22">
						<span class="txt1">
							Or login with
						</span>
					</div>

					<a href="#" class="btn-face m-b-10">
						<i class="fa fa-facebook-official"></i>
						Facebook
					</a>

					<a href="#" class="btn-google m-b-10">
						<img src="images/icons/icon-google.png" alt="GOOGLE">
						Google
					</a> -->

					<div class="text-center w-full p-t-115">
						<a href="TypeUsernameController"><span class="txt1"> Quên mật khẩu? </span></a> <a
							class="txt1 bo1 hov1" href="RegisterController"> Đăng Ký </a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!--===============================================================================================-->
	<script src="${url}/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="${url}/vendor/bootstrap/js/popper.js"></script>
	<script src="${url}/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="${url}/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="${url}/js/main.js"></script>
</body>
</html>