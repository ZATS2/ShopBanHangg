<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block"
	data-navbar-on-scroll="data-navbar-on-scroll">
	<div class="container">
		<a class="navbar-brand d-inline-flex" href="/"> <img
			class="d-inline-block" src="assets/img/gallery/logo.png" alt="logo">
			<span class="text-1000 fs-0 fw-bold ms-2">Majestic</span>
		</a>
		<button class="navbar-toggler collapsed" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div
			class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0"
			id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item px-2"><a class="nav-link fw-medium active"
					aria-current="page" href="/">Trang Chủ</a></li>
				<li class="nav-item px-2"><a class="nav-link fw-medium"
					href="/list">Mĩ Phẩm</a>
			</ul>
			<form class="d-flex">
				<a class="text-1000" href="/cart"> <svg
						class="feather feather-shopping-cart me-3"
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
								<circle cx="9" cy="21" r="1"></circle>
								<circle cx="20" cy="21" r="1"></circle>
								<path
							d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
							</svg>
				</a> <a class="text-1000" href="/login"> <svg
						class="feather feather-user me-3"
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
								<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
								<circle cx="12" cy="7" r="4"></circle>
							</svg>
				</a> 
			</form>
		</div>
	</div>
</nav>