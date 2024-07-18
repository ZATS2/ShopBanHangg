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

		<section
			class="py-11 bg-light-gradient border-bottom border-white border-5">
			<div class="bg-holder overlay overlay-light"
				style="background-image: url(assets/img/gallery/header-bg.png); background-size: cover;">
			</div>
			<div class="container">
				<div class="row flex-center">
					<div class="col-12 mb-10">
						<div class="d-flex align-items-center flex-column">
							<h1 class="fw-normal">With an outstanding style, only for
								you</h1>
							<h1 class="fs-4 fs-lg-8 fs-md-6 fw-bold">Exclusively
								designed for you</h1>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="py-0" id="header"
			style="margin-top: -23rem !important;">
			<div class="container">
				<div class="row g-0">
					<div class="col-md-6">
						<div class="card card-span h-100 text-white">
							<img class="img-fluid" src="assets/img/gallery/her.png"
								width="790" alt="..." />
							<div class="card-img-overlay d-flex flex-center">
								<a class="btn btn-lg btn-light" href="#!">For Her</a>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card card-span h-100 text-white">
							<img class="img-fluid" src="assets/img/gallery/him.png"
								width="790" alt="..." />
							<div class="card-img-overlay d-flex flex-center">
								<a class="btn btn-lg btn-light" href="#!">For Him </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="py-0">
			<div class="container">
				<div class="row h-100">
					<div class="col-lg-7 mx-auto text-center mt-7 mb-5">
						<h5 class="fw-bold fs-3 fs-lg-5 lh-sm">Best Deals</h5>
					</div>
					<div class="col-12">
						<div class="carousel slide" id="carouselBestDeals"
							data-bs-touch="false" data-bs-interval="false">

							<div class="carousel-inner">
								<c:forEach var="item" items="${items}" varStatus="status">
									<c:if test="${status.index % 3 == 0}">
										<div
											class="carousel-item ${status.index == 0 ? 'active' : ''}"
											data-bs-interval="10000">
											<div class="row h-100 align-items-center g-2">
									</c:if>
									<div class="col-md-4 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="img-fluid h-100"
												src="/images/product/${item.images[0]}" alt="${item.name}" />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">${item.name}</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">${item.price + 100000}</span>
													<span class="text-danger">${item.price}</span>
												</div>
											</div>
											<a class="stretched-link" href="#"></a>
										</div>
									</div>
									<c:if
										test="${status.index % 3 == 2 or status.index == fn:length(items) - 1}">
							</div>
							<!-- Close row -->
						</div>
						<!-- Close carousel-item -->
						</c:if>
						</c:forEach>
					</div>


				</div>
				<div class="row">
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselBestDeals" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselBestDeals" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			</div>
			<div class="col-12 d-flex justify-content-center mt-5">
				<a class="btn btn-lg btn-dark" href="/list">View All</a>
			</div>
			</div>
		</section>

		<%@include file="../layout/_footer.jsp"%>


	</main>
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
