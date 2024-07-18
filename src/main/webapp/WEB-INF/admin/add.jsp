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
		<div >
			<h2 class="mb-4">Add Product</h2>
			<form action="${url}/product/add" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="id" value="${productDetails.product.id}" />

				<div class="mb-3">
					<label for="name" class="form-label">Product Name</label> <input
						type="text" class="form-control" id="name" name="name"
						value="${productDetails.product.name}" required>
				</div>
				<div class="mb-3">
					<label for="price" class="form-label">Price</label> <input
						type="number" class="form-control" id="price" name="price"
						value="${productDetails.product.price}" required>
				</div>

				<div class="mb-3">
					<label for="images" class="form-label">Images</label> <input
						type="file" class="form-control" id="images" name="images"
						multiple>
					<div class="mt-3">
						<c:forEach var="image" items="${productDetails.images}">
							<img src="/images/product/${image}" alt="Product Image"
								class="img-thumbnail" style="width: 100px; height: 100px;">
						</c:forEach>
					</div>
				</div>
				<button type="submit" class="btn btn-primary">Update</button>
			</form>
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
