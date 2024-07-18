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
	<div class="py-0 " id="page-content">
		<!--Page Title-->
		<div class="page section-header text-center mt-5">
			<div class="page-title">
				<div class="wrapper">
					<h4 class="page-width">CHECK OUT</h4>
				</div>
			</div>
		</div>
		<!--End Page Title-->

		<div class="container">
		

			<div class="row billing-fields">
				<div
					class="col-xl-6 col-lg-6 col-md-6 col-sm-12 sm-margin-30px-bottom">
					<div class="create-ac-content bg-light-gray padding-20px-all">
						<form name="frmOrder" action="/submitOrder" method="post">
							<fieldset>
								<h4 class="login-title mb-3">Checkout information</h4>
								<div class="row">
									<div class="form-group col-md-6 col-lg-6 col-xl-6 required">
										<label for="input-username">Username<span
											class="required-f">*</span></label>
										<div id="username">${sessionScope.loggedInUser.username}</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-6 col-lg-6 col-xl-6 required">
										<label for="input-fullname">Fullname<span
											class="required-f">*</span></label>
										<input name="fullname" value="${sessionScope.loggedInUser.fullname}"
											id="input-fullname" type="text" class="form-control">
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-6 col-lg-6 col-xl-6 required">
										<label for="input-email">E-Mail <span
											class="required-f">*</span></label>
										<input name="email" value="${sessionScope.loggedInUser.email}" id="input-email"
											type="email" class="form-control">
									</div>
								</div>
							</fieldset>
							<fieldset>
								<div class="row">
									<div class="form-group col-md-6 col-lg-6 col-xl-6 required">
										<label for="input-address">Address <span
											class="required-f">*</span></label>
										<input name="address" id="input-address" required
											type="text" class="form-control">
									</div>
								</div>
							</fieldset>
							<fieldset>
								<div class="row">
									<div class="form-group col-md-12 col-lg-12 col-xl-12">
										<label for="input-note">Note<span
											class="required-f">*</span></label>
										<textarea name="note" class="form-control resize-both" id="input-note" rows="3"></textarea>
									</div>
								</div>
							</fieldset>
							<div class="order-button-payment">
								<button class="btn btn-primary" value="Place order"
									type="submit">Submit</button>
							</div>
						</form>
					</div>
				</div>

				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
					<div class="your-order-payment">
						<div class="your-order">
							<h4 class="order-title mb-4">Your order</h4>

							<div class="table-responsive-sm order-table">
								<table
									class="bg-white table table-bordered table-hover text-center">
									<thead>
										<tr>
											<th class="text-left">Product</th>
											<th>Price</th>
											<th>Quantity</th>
											<th>Total</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${cart}">
										<tr>
											<td class="text-left">${item.product.name}</td>
											<td>${item.product.price}</td>
											<td>${item.product.quantity}</td>
											<td>${item.product.price * item.product.quantity}</td>
										</tr>
										</c:forEach>
									</tbody>
									<tfoot class="font-weight-600">
										<tr>
											<td colspan="3" class="text-right font-weight-bold">Total</td>
											<td class="font-weight-bold"><strong>${totalAmount}</strong></td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>

						<hr />
					</div>
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
