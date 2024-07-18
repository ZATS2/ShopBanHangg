<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light"
	style="height: 100px;">
	<div class="container-fluid">
		<h4>
			<span class="text-primary">Admin</span>
		</h4>



	</div>
	<div class="container">
		<form action="${url}/index" method="post">
			<div class="input-group mb-1 ">
				<input type="text" class="form-control" placeholder="Tìm Kiếm"
					name="keywords" aria-label="Tìm Kiếm"
					aria-describedby="button-addon2">
				<button class="btn btn-outline-secondary"
					formaction="${url}/TiemKiem" type="submit" id="button-addon2">
					<i class="bi bi-search"></i>
				</button>
			</div>
		</form>

	</div>

</nav>
<div class="row">
	<div class="col-md-auto side-nav position-fixed bg-light"
		style="height: 200vh; width: 100px">
		<div class="d-flex flex-column align-items-center"
			style="height: 150vh;">
			<ul
				class="nav flex-column mb-auto text-center align-items-center justify-content-center"
				style="height: 50%;">
				<li class="nav-item"><a class="nav-link py-3 px-2" href="/login"
					title="" data-bs-toggle="tooltip" data-bs-placement="right"
					data-bs-original-title="Home"> <i class="bi-house fs-4"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link py-3 px-2"
					href="${url}/product/add" title=""
					data-bs-toggle="tooltip" data-bs-placement="right"
					data-bs-original-title="Products"> <i class="bi-plus-circle fs-4"></i>
				</a></li>
				
				<li class="nav-item"><a class="nav-link py-3 px-2"
					href="/logout" title="" data-bs-toggle="tooltip"
					data-bs-placement="right" data-bs-original-title="Add"> <i
						class="bi-box-arrow-left fs-4"></i>
				</a></li>

			</ul>
		</div>
	</div>
</div>