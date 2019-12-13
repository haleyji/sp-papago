<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<jsp:include page="/WEB-INF/views/common/home-head.jsp"></jsp:include>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="img/fav.png">
	<!-- Author Meta -->
	<meta name="author" content="colorlib">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>Main</title>

	<link href="https://fonts.googleapis.com/css?family=Playfair+Display:700|Roboto:400,400i,500" rel="stylesheet">

	<link rel="stylesheet" href="/resources/bootstrap/bt-home/css/main.css">
</head>

<body>
	<!--================ start banner Area =================-->
	<section class="home-banner-area">
		<div class="container">
			<div class="row justify-content-end fullscreen">
				<div class="col-lg-6 col-md-12 home-banner-left d-flex fullscreen align-items-center">
					<div>
						<h1 class="">
							<span>Welcome </span>to <br>
							Our Website <br>
							of <span>Papago Project</span>
						</h1><br>
					<c:if test="${ui==null }">
						<a href="/views/user/login" class="primary-btn">Login</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<a href="/views/user/signup" class="primary-btn">Signup</a>
					</c:if>
					<c:if test="${ui!=null}">
						<a href="/views/papago/papago" class="primary-btn">Translate</a>
						<a href="/views/papago/history" class="primary-btn">History</a> 
					</c:if>
					</div>
				</div>
				<div class="col-lg-6 col-md-12 no-padding home-banner-right d-flex fullscreen align-items-end">
					<img class="img-fluid" src="/resources/bootstrap/bt-home/img/header-img.png" alt="">
				</div>
			</div>
		</div>
	</section>
	<!--================ End banner Area =================-->


	<!--================ Start Service Area =================-->
	<section class="service-area section-gap">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-9 text-center">
					<div class="section-title">
						<h1> We Provide These <span>Services</span><br> to Our Customers</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- single-features -->
				<div class="col-lg-3 col-sm-6 col-md-6">
					<div class="single-service">
						<div class="service-icon">
							<img src="/resources/bootstrap/bt-home/img/service/shape1.png" alt="">
							<img class="s-icon" src="/resources/bootstrap/bt-home/img/service/icon1.png" alt="">
							<img class="clr-icon" src="/resources/bootstrap/bt-home/img/service/clr-icon1.png" alt="">
						</div>
						<div class="service-content">
							<h4>Translate</h4>
							<p>inappropriate behavior is often laughed off as boys will be boys,” women face higher conduct standards
								especially in the workplace that’s why.</p>
						</div>
					</div>
				</div>
				<!-- single-features -->
				<div class="col-lg-3 offset-lg-1 col-sm-6 col-md-6">
					<div class="single-service">
						<div class="service-icon">
							<img src="/resources/bootstrap/bt-home/img/service/shape1.png" alt="">
							<img class="s-icon" src="/resources/bootstrap/bt-home/img/service/icon2.png" alt="">
							<img class="clr-icon" src="/resources/bootstrap/bt-home/img/service/clr-icon2.png" alt="">
						</div>
						<div class="service-content">
							<h4>Userservice</h4>
							<p>inappropriate behavior is often laughed off as boys will be boys,” women face higher conduct standards
								especially in the workplace that’s why.</p>
						</div>
					</div>
				</div>
				<!-- single-features -->
				<div class="col-lg-3 offset-lg-1 col-sm-6 col-md-6">
					<div class="single-service">
						<div class="service-icon">
							<img src="/resources/bootstrap/bt-home/img/service/shape1.png" alt="">
							<img class="s-icon" src="/resources/bootstrap/bt-home/img/service/icon3.png" alt="">
							<img class="clr-icon" src="/resources/bootstrap/bt-home/img/service/clr-icon3.png" alt="">
						</div>
						<div class="service-content">
							<h4>Retrieve</h4>
							<p>inappropriate behavior is often laughed off as boys will be boys,” women face higher conduct standards
								especially in the workplace that’s why.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ End Service Area =================-->


	<!--================ start footer Area  =================-->
	<footer class="footer-area section_gap">
		<div class="container">
		</div>
		
		<div class="footer-bottom d-flex justify-content-between align-items-center flex-wrap">
			<div class="container">
				<div class="row justify-content-between">
					<div class="col-lg-12">
						<div>
							<p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
						</div>
						<div class="footer-social d-flex align-items-center">
							<a href="#"><i class="fa fa-facebook"></i></a>
							<a href="#"><	i class="fa fa-twitter"></i></a>
							<a href="#"><i class="fa fa-dribbble"></i></a>
							<a href="#"><i class="fa fa-behance"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--================ End footer Area  =================-->

</body>

</html>