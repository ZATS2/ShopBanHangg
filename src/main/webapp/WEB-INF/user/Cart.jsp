<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<%@include file="../layout/_nav.jsp"%>
	<section class="py-5">
		<div class="container h-100 py-5">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th scope="col" class="h5">Shopping Bag</th>
									<th scope="col">Quantity</th>
									<th scope="col">Price</th>
									<th scope="col">Amount</th>
									<th scope="col">Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${cart}" varStatus="status">
									<tr>
										<th scope="row">
											<div class="d-flex align-items-center">
												<img src="/images/product/${item.images[0]}"
													class="img-fluid rounded-3" style="width: 120px;"
													alt="${item.product.name}">
												<div class="flex-column ms-4">
													<p class="mb-2">${item.product.name}</p>
												</div>
											</div>
										</th>
										<td class="align-middle">
											<form action="update/${item.product.id}" method="post"
												id="quantityForm${item.product.id}">
												<div class="d-flex flex-row align-middle">
													<button type="button" class="btn btn-link px-2"
														onclick="updateQuantity(this, 'decrease', ${item.product.id})">
														<i class="fas fa-minus"></i>
													</button>
													<input min="1" max="50" name="qty"
														value="${item.product.quantity}" type="number"
														class="custom-input" style="width: 50px;"
														onblur="this.form.submit()" />

													<button type="button" class="btn btn-link px-2"
														onclick="updateQuantity(this, 'increase', ${item.product.id})">
														<i class="fas fa-plus"></i>
													</button>
												</div>
												<input type="hidden" name="itemId"
													value="${item.product.id}">
											</form>
										</td>
										<td class="align-middle">
											<p class="mb-0" style="font-weight: 500;">${item.product.price}</p>
										</td>
										<td class="align-middle">
											<p class="mb-0" style="font-weight: 500;">${item.product.price * item.product.quantity}</p>
										</td>
										<td class="align-middle"><a
											href="/remove/${item.product.id}" class="btn btn-danger">Remove</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
							<thead>
								<tr>
									<th scope="col"><a href="/clear"
										class="btn btn-lg btn-dark">Clear Cart</a><a href="/listSP"
										class="btn btn-lg btn-darky">Add more</a></th>
									<th scope="col"></th> 
									<th scope="col"></th>
									<th scope="col">Total: <strong>${totalAmount}</strong></th>
									<th scope="col"><a href="/checkout"
										class="btn btn-lg btn-primary">Checkout</a></th>
								</tr>

							</thead>
						</table>
					</div>

				</div>
			</div>
		</div>
	</section>
	<%@include file="../layout/_footer.jsp"%>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"></script>
	<script>
        feather.replace();
    </script>
	<script src="assets/js/theme.js"></script>
</body>
</html>
