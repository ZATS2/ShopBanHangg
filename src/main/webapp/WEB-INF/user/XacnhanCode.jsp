<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
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
</head>
<body>
	<main class="main" id="top">
		<%@include file="../layout/_nav.jsp"%>

		<div class="col-lg">
			<section class="">
				<div class="px-4 py-5 px-md-5 text-center text-lg-start">
					<div class="container">
						<div class="row gx-lg-5 align-items-center">
							<div class="col-lg-6 mb-5 mb-lg-0">
								<h1 class="my-5 display-3 fw-bold ls-tight">
									Chào Mùng Đến Với<br /> <span class="text-primary"> <a
										class="navbar-brand d-inline-flex" href="/"> <span
											class="text-1000 fs-10 fw-bold ms-2">Majestic</span>
									</a></span>
								</h1>
								<p style="color: hsl(217, 10%, 50.8%)">ĐĂNG NHẬP ĐỂ TIẾP TỤC</p>
							</div>

							<div class="col-lg-6 mb-5 mb-lg-0">
								<div class="card">
									<div class="card-body py-5 px-md-5">
										<form action="/DoiPass" method="post" id="CustomerLoginForm"
											accept-charset="UTF-8">
											<h2>Lấy Lại Mật Khẩu</h2>
											<label for="id">Code</label>
											<div class=" mb-1">
												<input type="text" class="form-control" name="code">
											</div>
											<label for="password">Password</label>
											<div class=" mb-3">
												<input type="password" name="password" class="form-control"
													id="password">
											</div>
											<div class=" mb-1"></div>

											<button type="submit" class="btn btn-primary btn-block mb-4"
												>Đổi Mật Khẩu</button>

										</form>


										<div class="text-center">
											<p>
												<a
													class="link-offset-2 link-underline link-underline-opacity-25"
													href="#">Tiếp Tục Đăng Nhập</a>
											</p>


										</div>

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
	<script
		src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
	<script src="vendors/feather-icons/feather.min.js"></script>
	<script>
		feather.replace();
	</script>
	<script src="assets/js/theme.js"></script>
</body>
</html>
