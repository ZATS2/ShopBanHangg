<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!DOCTYPE html>
<html>
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
	<%@include file="../layout/_nav.jsp"%>

		<section>
		<div class="container">
			<div class="row g-0">
				<div class="col-md-6">
					<div class="bg-300 text-white p-4 h-100 d-flex flex-column justify-content-center">
						<h4 class="text-800">${product[0].product.price} vnđ</h4>
						<h1 class="fw-semi-bold lh-sm fs-4 fs-lg-5 fs-xl-6">${product[0].product.name}</h1>
						<div class="d-grid gap-2 d-md-block"><a class="btn btn-lg btn-dark" href="/add/${product[0].product.id}" role="button">Thêm Vào Giỏ Hàng</a></div>
					</div>
				</div>
				<div class="col-md-6">
					<div id="productCarousel" class="card card-span h-100 text-white">
						<div id="productCarousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<c:forEach var="image" items="${product[0].images}" varStatus="loop">
									<div class="carousel-item ${loop.index == 0 ? 'active' : ''}">
										<img class="d-block w-100" src="/images/product/${image}" alt="Slide ${loop.index + 1}">
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="card-img-overlay bg-dark-gradient d-flex align-items-end justify-content-center h-100">
							
						</div>
					</div>
				</div>
			</div>
			<div class="row h-10 g-2 py-1">
				<c:forEach var="image" items="${product[0].images}" varStatus="loop">
					<div class="col-md-3">
						<div class="card card-span h-0 text-white">
							<img class="card-img h-100" src="/images/product/${image}" alt="..."/>
							<div class="card-img-overlay bg-dark-gradient">
								<div class="d-flex align-items-end justify-content-center h-100">
									
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<%@include file="../layout/_footer.jsp"%>

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
			var toast = new bootstrap.Toast(toastElement);
			toast.show();
			toastElement.querySelector('.btn-close').addEventListener('click', function() {
				toast.hide();
			});
		});

		var slideIndex = 1;
		function currentSlide(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			if (n > slides.length) { slideIndex = 1 }
			if (n < 1) { slideIndex = slides.length }
			for (i = 0; i < slides.length; i++) {
				slides[i].className = slides[i].className.replace(" active-slide", "");
			}
			slides[slideIndex - 1].className += " active-slide";
		}
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