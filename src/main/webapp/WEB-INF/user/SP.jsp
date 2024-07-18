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


	<section class="py-5">
		<div id="page-content">
			<div class="container mt-5">
				<div class="row">
					<!--Sidebar-->
					<div class="col-md-3">
						<div class="closeFilter d-block d-md-none d-lg-none">
							<i class="icon icon anm anm-times-l"></i>
						</div>
						<div class="sidebar_tags">
							<div class="sidebar_widget filterBox filter-widget">
								<div class="widget-title">
									<h2>Giá</h2>
								</div>
								<form action="">
									<button formaction="/under100" class="btn mb-2">Dưới
										100K</button>
									<button formaction="/100-300" class="btn mb-2">Từ 100K
										- 300K</button>
									<button formaction="/300-900" class="btn mb-2">Từ 300K
										- 900K</button>
									<button formaction="/over900" class="btn mb-2">Trên
										900K</button>
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-9">
						<div class="widget-title">
							<h2>Các Sản Phẩm</h2>
						</div>
						<div class="productList">
							<!--Toolbar-->
							<button type="button"
								class="btn btn-filter d-block d-md-none d-lg-none">Product
								Filters</button>
							<div class="toolbar">
								<div class="filters-toolbar-wrapper">
									<div class="row">
										<div class="col-md-12">
											<div class="filters-toolbar__item">
												<form action="/sort" method="get">
													<label for="SortBy" class="hidden">Sort</label> <select
														name="sortBy" id="SortBy"
														class="filters-toolbar__input filters-toolbar__input--sort form-select"
														onchange="this.form.submit()">
														<option value="title-ascending" selected="selected">Sort</option>
														<option value="A-Z">A-Z</option>
														<option value="Z-A">Z-A</option>
														<option value="Giá, thấp đến cao">Giá, thấp đến
															cao</option>
														<option value="Giá, cao đến thấp">Giá, cao đến
															thấp</option>
													</select> <input class="collection-header__default-sort"
														type="hidden" value="manual">
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<c:forEach var="p" items="${page}" varStatus="loop">
									<div class="col-md-4 mb-4 py-2">
										<a class="card card-span h-90 text-white" href="chitietsanpham${p.product.id}">
											<img class="img-fluid h-90"
												src="/images/product/${p.images[0]}" alt="${p.product.name}"  />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">${p.product.name}</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">${p.product.price + 100000}</span>
													<span class="text-danger">${p.product.price} vnđ</span>
												</div>
											</div>
										</a>
										<a href="/add/${p.product.id}" class="btn btn-lg btn-dark">Add
											Cart</a>
									</div>
								</c:forEach>
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
										<c:choose>
											<c:when test="${currentPage > 0}">
												<li class="page-item"><a class="page-link"
													href="?page=${currentPage - 1}">Previous</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link"
													href="#">Previous</a></li>
											</c:otherwise>
										</c:choose>
										<c:forEach var="i" begin="0" end="${totalPages - 1}">
											<c:choose>
												<c:when test="${i == currentPage}">
													<li class="page-item active"><a class="page-link"
														href="?page=${i}">${i + 1}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="?page=${i}">${i + 1}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${currentPage < totalPages - 1}">
												<li class="page-item"><a class="page-link"
													href="?page=${currentPage + 1}">Next</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link"
													href="#">Next</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
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