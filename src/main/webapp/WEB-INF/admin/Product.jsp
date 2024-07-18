<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<style>
.bi {
	color: black;
}

video {
	width: 100%;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<c:url var="url" value="/admin" />


	<%@include file="../admin/_layout.jsp"%>


	<div class="container">
		<h2 class="mb-4">Search Products by Price Range</h2>
		<form action="${url}/product/search" method="get" class="form-inline mb-4">
			<div class="form-group mr-2">
				<input type="number" name="min" value="${param.min}"
					class="form-control" placeholder="Min Price?" step="0.01">
			</div>
			<div class="form-group mr-2">
				<input type="number" name="max" value="${param.max}"
					class="form-control" placeholder="Max Price?" step="0.01">
			</div>
			<button type="submit" class="btn btn-primary">Search</button>
		</form>

		<div class="row">
			<c:forEach var="p" items="${page}" varStatus="loop">
				<div class="col-md-4 mb-4 py-2">
					<a class="card card-span h-90 text-white"
						href="chitietsanpham${p.product.id}"> <img
						class="img-fluid h-90" src="/images/product/${p.images[0]}"
						alt="${p.product.name}" />
						<div class="card-img-overlay ps-0"></div>
						<div class="card-body ps-0 bg-200">
							<h5 class="fw-bold text-1000 text-truncate">${p.product.name}</h5>
							<div class="fw-bold">
								<span class="text-600 me-2 text-decoration-line-through">${p.product.price + 100000}</span>
								<span class="text-danger">${p.product.price} vnđ</span>
							</div>
						</div>
					</a> <a href="${url}/product/update/${p.product.id}" class="btn btn-lg btn-dark">Edit</a>  <a href="${url}/product/delete/${p.product.id}" class="btn btn-lg btn-dark">Delete</a>
				</div>
			</c:forEach>
		</div>

	</div>


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





</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

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


</html>
