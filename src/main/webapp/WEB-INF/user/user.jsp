<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your Page Title</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Font Awesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Favicon -->
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
<!-- Custom CSS -->
<link href="assets/css/theme.css" rel="stylesheet">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
</head>

<body>
	<%@include file="../layout/_nav.jsp"%>

	<section class="py-5">
		<div id="page-content">
			<div class="container mt-5">
				<div class="row">
					<div class="col-md-3">
						<div class="closeFilter d-block d-md-none d-lg-none">
							<i class="icon icon anm anm-times-l"></i>
						</div>
						<div class="sidebar_tags">
							<div class="sidebar_widget filterBox filter-widget">
								<div class="widget-title">
									<h2>Tài Khoản</h2>
								</div>
								<form action="">
									<button formaction="/login" class="btn mb-2">Thông
										Tin</button>
									<button formaction="/listOdert" class="btn mb-2">Đơn
										Hàng</button>
									<button formaction="/logout" class="btn mb-2 btn-lg btn-dark">Đăng
										Xuất</button>
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-9">
						<div class="productList">

							<div class="row">
								<form action="${url}/index" method="post">
									<div class="form-group">
										<label for="id">Username:</label> <input type="text"
											class="form-control" id="id" name="id"
											value="${sessionScope.loggedInUser.username}" readonly>
									</div>
									<div class="form-group">
										<label for="fullname">Full Name:</label> <input type="text"
											class="form-control" id="fullname" name="fullname"
											value="${sessionScope.loggedInUser.fullname}" required>
									</div>
									<div class="form-group">
										<label for="email">Email:</label> <input type="email"
											class="form-control" id="email" name="email"
											value="${sessionScope.loggedInUser.email}" required>
									</div>
									<hr>
									<button type="submit" class="btn btn-primary"
										formaction="${url}/edit-profile">Update</button>
								</form>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="../layout/_footer.jsp"%>


	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
	<!-- Bootstrap Icons -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.7.2/bootstrap-icons.min.js"></script>
	<!-- Feather Icons -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"></script>
	<script>
		feather.replace();
	</script>
	<!-- Your Custom Script -->
	<script src="assets/js/theme.js"></script>
</body>

</html>
