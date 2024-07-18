<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en" ng-app="registrationApp">
<head>
<meta charset="UTF-8">
<title>Your Page Title</title>
<link rel="apple-touch-icon" sizes="180x180"
	href="assets/img/favicons/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="assets/img/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/img/favicons/favicon-16x16.png">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicons/favicon.ico">
<link rel="manifest" href="assets/img/favicons/manifest.json">
<meta name="msapplication-TileImage"
	content="assets/img/favicons/mstile-150x150.png">
<meta name="theme-color" content="#ffffff">
<link href="assets/css/theme.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<!-- AngularJS -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
</head>
<body ng-controller="registrationController">
	<main class="main" id="top">
		<%@include file="../layout/_nav.jsp"%>

		<div class="col-lg">
			<section class="">
				<div class="px-4 py-5 px-md-5 text-center text-lg-start">
					<div class="container">
						<div class="row gx-lg-5 align-items-center">
							<div class="col-lg-6 mb-5 mb-lg-0">
								<h1 class="my-5 display-3 fw-bold ls-tight">
									Chào Mừng Đến Với<br /> <span class="text-primary"> <a
										class="navbar-brand d-inline-flex" href="/"> <span
											class="text-1000 fs-10 fw-bold ms-2">Majestic</span>
									</a></span>
								</h1>
								<p style="color: hsl(217, 10%, 50.8%)">ĐĂNG KÝ ĐỂ TIẾP TỤC</p>
							</div>

							<div class="col-lg-6 mb-5 mb-lg-0">
								<div class="card">
									<div class="card-body py-5 px-md-5">
										<form name="frmregister" action="/SignUp" method="post" id="CustomerLoginForm" accept-charset="UTF-8" novalidate>

											<h2>Đăng Ký</h2>
											<div class="mb-3">
												<label for="username">Username</label>
												<input type="text" class="form-control" name="username" ng-model="user.username" required>
												<div ng-show="frmregister.username.$touched && frmregister.username.$invalid" class=" m-2">Vui lòng nhập username</div>
											</div>
											<div class="mb-3">
												<label for="fullname">Họ Và Tên</label>
												<input type="text" class="form-control" name="fullname" ng-model="user.fullname" required>
												<div ng-show="frmregister.fullname.$touched && frmregister.fullname.$invalid" class=" m-2">Vui lòng nhập họ và tên</div>
											</div>
											<div class="mb-3">
												<label for="email">Email</label>
												<input type="email" class="form-control" name="email" ng-model="user.email" required>
												<div ng-show="frmregister.email.$touched && frmregister.email.$invalid" class=" m-2">Vui lòng nhập email</div>
											</div>
											<div class="mb-3">
												<label for="password">Mật Khẩu</label>
												<input type="password" name="password" class="form-control" id="password" ng-model="user.password" required>
												<div ng-show="frmregister.password.$touched && frmregister.password.$invalid" class=" m-2">Vui lòng nhập mật khẩu</div>
											</div>
											<div class="mb-3">
												<label for="password1">Nhập Lại Mật khẩu</label>
												<input type="password" name="password1" class="form-control" id="password1" ng-model="user.password1" required>
												<div ng-show="frmregister.password1.$touched && frmregister.password1.$invalid" class=" m-2">Vui lòng nhập xác nhận mật khẩu</div>
												<div ng-show="user.password !== user.password1" class=" m-2">Xác nhận mật khẩu không đúng</div>
											</div>
											<button type="submit" class="btn btn-primary btn-block mb-4" ng-disabled="frmregister.$invalid">Đăng Ký</button>

										</form>

										<a class="btn btn-primary-outline btn-block mb-4" href="/login">Đăng Nhập</a>
										

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<%@include file="../layout/_footer.jsp"%>

	</main>
	<%
	String message = (String) request.getAttribute("message");
	if (message != null && !message.isEmpty()) {
	%>
	<div id="toastContainer" aria-live="polite" aria-atomic="true"
		style="position: fixed; top: 86%; right: 10px; z-index: 9999">
		<div class="toast" role="alert" aria-live="assertive"
			aria-atomic="true" data-delay="5000">
			<div class="toast-header">
				<strong class="me-auto">Thông báo</strong>
				<button type="button" class="btn-close" data-dismiss="toast"
					aria-label="Close"></button>
			</div>
			<div class="toast-body"><%=message%></div>
		</div>
	</div>
	<%
	}
	%>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var toastElement = document.querySelector('.toast');
			var toast = new bootstrap.Toast(toastElement); // Khởi tạo toast
			toast.show();
			toastElement.querySelector('.btn-close').addEventListener('click',
					function() {
						toast.hide();
					});
		});
	</script>
	<script src="vendors/@popperjs/popper.min.js"></script>
	<script src="vendors/bootstrap/bootstrap.min.js"></script>
	<script src="vendors/is/is.min.js"></script>
	<script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
	<script src="vendors/feather-icons/feather.min.js"></script>
	<script>
		feather.replace();
	</script>
	<script src="assets/js/theme.js"></script>

	<script>
		var app = angular.module('registrationApp', []);
		app.controller('registrationController', function($scope) {
			$scope.user = {};
		});
	</script>
</body>
</html>
