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
		<section class="py-5">

			<div id="page-content">
				<!--Page Title-->
				<div class="page section-header text-center mt-5">
					<div class="page-title">
						<div class="wrapper">
							<h3 class="page-width">CHI TIẾT ĐƠN HÀNG</h3>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 mb-3">
							<div class="customer-box returning-customer">
								<h3>
									<i class="icon anm anm-user-al"></i> <a href="#customer-login"
										id="customer" class="text-white text-decoration-underline"
										data-toggle="collapse"></a>
								</h3>
							</div>
						</div>

						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 mb-3">
							<div class="customer-box customer-coupon">
								<h3 class="font-15 xs-font-13">
									<i class="icon anm anm-gift-l"></i>
								</h3>
								<div id="have-coupon" class="collapse coupon-checkout-content">
								</div>
							</div>
						</div>
					</div>

					<div class="row billing-fields">
						<div
							class="col-xl-6 col-lg-6 col-md-6 col-sm-12 sm-margin-30px-bottom">
							<div class="create-ac-content bg-light-gray padding-20px-all">
								<form name="frmOrder">
									<fieldset>
										<h4 class="login-title mb-3">Chi tiết thanh toán</h4>
										<div class="row">
											<div class="form-group col-md-6 col-lg-6 col-xl-6 required">
												<label for="input-firstname">Username<span
													class="required-f">*</span></label> <input disabled="disabled"
													name="username" value="${order.account.username}"
													id="username" type="text">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-md-6 col-lg-6 col-xl-6 required">
												<label for="input-firstname">Họ và tên<span
													class="required-f">*</span></label> <input disabled="disabled"
													name="fullname" value="${order.account.fullname}"
													id="input-firstname" type="text">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-md-6 col-lg-6 col-xl-6 required">
												<label for="input-email">E-Mail <span
													class="required-f">*</span></label> <input disabled="disabled"
													name="email" value="${order.account.email}"
													id="input-email" type="email">
											</div>

										</div>
									</fieldset>
									<fieldset>
										<div class="row">
											<div class="form-group col-md-6 col-lg-6 col-xl-6 required">
												<label for="input-address-1">Địa chỉ <span
													class="required-f">*</span></label> <input disabled="disabled"
													name="address" value="${order.address}"
													id="input-address-1" required type="text">
											</div>
										</div>
									</fieldset>
									<fieldset>
										<div class="row">
											<div class="form-group col-md-12 col-lg-12 col-xl-12">
												<label for="input-company">Ghi chú<span
													class="required-f">*</span></label>
												<textarea disabled="disabled"
													class="form-control resize-both" rows="3"></textarea>
											</div>
										</div>
									</fieldset>
								</form>
							</div>
						</div>

						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
							<div class="your-order-payment">
								<div class="your-order">
									<h4 class="order-title mb-4">Đơn hàng của bạn</h4>

									<div class="table-responsive-sm order-table">
										<table
											class="bg-white table table-bordered table-hover text-center">
											<thead>
												<tr>
													<th class="text-left">Sản phẩm</th>
													<th>Giá</th>
													<th>Số lượng</th>
													<th>Tổng cộng</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="o" items="${order.orderDetails}">
													<tr>
														<td class="text-left">${o.product.name}</td>
														<td>${(o.price)}</td>
														<td>${o.quantity}</td>
														<td>${o.price * o.quantity}</td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot class="font-weight-600">
												<tr>
													<td colspan="4" class="text-right font-weight-bold">Thanh
														toán</td>
													<td class="font-weight-bold">${total}</td>
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
			<%@include file="../layout/_footer.jsp"%>

		</section>
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
