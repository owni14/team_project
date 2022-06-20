<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(document).ready(function() {
	var isExistenceFile = "${isExistence}";
	var driverResult = "${driverResult}";
	var registerDriver = "${registerDriver}";
	if (isExistenceFile == "true") {
		alert("이미 등록된 면허증입니다.");
	}
	if (driverResult == "true") {
		alert("운전등록이 완료되었습니다.");
	} else if (driverResult == "false")  {
		alert("운전등록에 실패하였습니다. \n실패가 계속 될 경우 고객센터로 문의부탁드립니다.")
	}
	if (registerDriver == "true") {
		alert("운전자등록신청이 정상적으로 제출되었습니다. \n승인까지 시간이 걸릴 수 있으니 양해 부탁드립니다.")
	} else if (registerDriver == "false") {
		alert("운전자등록신청에 실패하였습니다. \n실패가 계속 될 경우 고객센터에 문의부탁드립니다.")
	}
});
</script>

<!-- Start Categories of The Month -->
	<section class="container">
		<div class="row">
			<div class="col-12 col-md-6 p-5 mt-3">
				<a href="board/drive"><img style="width:500px; height:300px;" src="/resources/assets/img/driver.jpg"
					class=" img-fluid border"></a>
				<h5 class="text-center mt-3 mb-3">운전하기 / 탑승자 확인</h5>
			</div>
			<div class="col-12 col-md-6 p-5 mt-3">
				<a href="board/reservation"><img style="width:500px; height:300px;" src="/resources/assets/img/reservation.jpg"
					class=" img-fluid border"></a>
				<h2 class="h5 text-center mt-3 mb-3">예약하기</h2>
			</div>
<!-- 			<div class="col-12 col-md-4 p-5 mt-3"> -->
<!-- 				<a href="#"><img src="/resources/assets/img/category_img_03.jpg" -->
<!-- 					class="rounded-circle img-fluid border"></a> -->
<!-- 				<h2 class="h5 text-center mt-3 mb-3">Accessories</h2> -->
<!-- 				<p class="text-center"> -->
<!-- 					<a class="btn btn-success">Go Shop</a> -->
<!-- 				</p> -->
<!-- 			</div> -->
		</div>
	</section>
	<!-- End Categories of The Month -->

<!-- Start Banner Hero -->
	<div id="template-mo-zay-hero-carousel" class="carousel slide"
		data-bs-ride="carousel">
		<ol class="carousel-indicators">
			<li data-bs-target="#template-mo-zay-hero-carousel"
				data-bs-slide-to="0" class="active"></li>
			<li data-bs-target="#template-mo-zay-hero-carousel"
				data-bs-slide-to="1"></li>
			<li data-bs-target="#template-mo-zay-hero-carousel"
				data-bs-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="container">
					<div class="row p-5">
						<div class="mx-auto col-md-8 col-lg-6 order-lg-last">
							<img class="img-fluid" src="/resources/assets/img/banner_img_01.jpg"
								alt="">
						</div>
						<div class="col-lg-6 mb-0 d-flex align-items-center">
							<div class="text-align-left align-self-center">
								<h1 class="h1 text-success">
									<b>Zay</b> eCommerce
								</h1>
								<h3 class="h2">Tiny and Perfect eCommerce Template</h3>
								<p>
									Zay Shop is an eCommerce HTML5 CSS template with latest version
									of Bootstrap 5 (beta 1). This template is 100% free provided by
									<a rel="sponsored" class="text-success"
										href="https://templatemo.com" target="_blank">TemplateMo</a>
									website. Image credits go to <a rel="sponsored"
										class="text-success" href="https://stories.freepik.com/"
										target="_blank">Freepik Stories</a>, <a rel="sponsored"
										class="text-success" href="https://unsplash.com/"
										target="_blank">Unsplash</a> and <a rel="sponsored"
										class="text-success" href="https://icons8.com/"
										target="_blank">Icons 8</a>.
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="container">
					<div class="row p-5">
						<div class="mx-auto col-md-8 col-lg-6 order-lg-last">
							<img class="img-fluid" src="/resources/assets/img/banner_img_02.jpg"
								alt="">
						</div>
						<div class="col-lg-6 mb-0 d-flex align-items-center">
							<div class="text-align-left">
								<h1 class="h1">Proident occaecat</h1>
								<h3 class="h2">Aliquip ex ea commodo consequat</h3>
								<p>
									You are permitted to use this Zay CSS template for your
									commercial websites. You are <strong>not permitted</strong> to
									re-distribute the template ZIP file in any kind of template
									collection websites.
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="container">
					<div class="row p-5">
						<div class="mx-auto col-md-8 col-lg-6 order-lg-last">
							<img class="img-fluid" src="/resources/assets/img/banner_img_03.jpg"
								alt="">
						</div>
						<div class="col-lg-6 mb-0 d-flex align-items-center">
							<div class="text-align-left">
								<h1 class="h1">Repr in voluptate</h1>
								<h3 class="h2">Ullamco laboris nisi ut</h3>
								<p>We bring you 100% free CSS templates for your websites.
									If you wish to support TemplateMo, please make a small
									contribution via PayPal or tell your friends about our website.
									Thank you.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev text-decoration-none w-auto ps-3"
			href="#template-mo-zay-hero-carousel" role="button"
			data-bs-slide="prev"> <i class="fas fa-chevron-left"></i>
		</a> <a class="carousel-control-next text-decoration-none w-auto pe-3"
			href="#template-mo-zay-hero-carousel" role="button"
			data-bs-slide="next"> <i class="fas fa-chevron-right"></i>
		</a>
	</div>
	<!-- End Banner Hero -->

	
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>