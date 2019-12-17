<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/common/papago-head.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="colorlib">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta charset="UTF-8">
	
	<title>Translate</title>
	<link href="https://fonts.googleapis.com/css?family=Playfair+Display:700|Roboto:400,400i,500" rel="stylesheet">
	<style>
	h1 {
	text-align:center;
	}
	h4 {
	text-align:right;
	}
	
	[class^=source]{
		float:left; 
		font-size:18px;
		width: 350px;
		height: 500px;
		padding:30px;
		margin:20px;
	}
	[class^=target]{
		float:right; 
		font-size:18px;
		width: 350px;
		height: 500px;
		padding:30px;
		margin:20px;
	}
	.class{
		width:500px;height: 500px;
	}
	#text{
		width: 320px;
		height: 400px;
		margin-top:10px; font-size:18px;
	}#result{
		width: 320px;
		height: 400px;
		margin-top:10px; font-size:18px;
	}
	div.button{
	text-align:center;
	}
	</style>
</head>

<body>
	<!--================ start main Area =================-->
	<section class="home-banner-area">
		<div class="container">
			<div class="row justify-content-end fullscreen">
				<div class="col-lg-11 col-md-12 home-banner-left d-flex fullscreen align-items-center">
					<div class="test">
						<h1 class="">
							 <span>Papago</span>Translate <br>
							
						</h1>
						<h4 class="">-by hyeyoung-</h4>
						<div class="source-container">
						<select id="source" class="lang-source" aria-label="작성 언어">
								<option value="ko">한국어</option>
								<option value="en">영어</option>
								<option value="ja">일본어</option>
								<option value="zh-CN">중국어(간체)</option>
								<option value="zh-TW">중국어(번체)</option>
								<option value="es">스페인어</option>
								<option value="fr">프랑스어</option>
								<option value="de">독일어</option>
								<option value="ru">러시아어</option>
								<option value="pt">포르투갈어</option>
								<option value="it">이탈리아어</option>
								<option value="vi">베트남어</option>
								<option value="th">태국어</option>
								<option value="id">인도네시아어</option>
								<option value="hi">힌디어</option>
						</select><br><br>
						<textarea id="text" placeholder="번역할 내용을 입력하세요."></textarea><br>
						</div>
						
						<div class="target-container">
						<select id="target" class="lang-target" aria-label="번역 언어">
							<option value="ko">한국어</option>
							<option value="en">영어</option>
							<option value="ja">일본어</option>
							<option value="zh-CN">중국어(간체)</option>
							<option value="zh-TW">중국어(번체)</option>
							<option value="es">스페인어</option>
							<option value="fr">프랑스어</option>
							<option value="de">독일어</option>
							<option value="ru">러시아어</option>
							<option value="pt">포르투갈어</option>
							<option value="it">이탈리아어</option>
							<option value="vi">베트남어</option>
							<option value="th">태국어</option>
							<option value="id">인도네시아어</option>
							<option value="hi">힌디어</option>
						</select><br>
							<textarea id="result" readonly ></textarea>
						</div>

						<p class="mx-auto mb-40">
							
						</p>
						<div class="button">
						<button id="btn" class="primary-btn">Translate</button>
						<button id="goHistory" class="primary-btn">History</button>
						</div>
						
					</div>
				
				
				</div>
			</div>
		</div>
	</section>
	<!--================ End main Area =================-->

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
							<a href="#"><i class="fa fa-twitter"></i></a>
							<a href="#"><i class="fa fa-dribbble"></i></a>
							<a href="#"><i class="fa fa-behance"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--================ End footer Area  =================-->


	<script src="/resources/bootstrap/bt-papago/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 crossorigin="anonymous"></script>
	<script src="/resources/bootstrap/bt-papago/js/vendor/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/bt-papago/js/jquery.ajaxchimp.min.js"></script>
	<script src="/resources/bootstrap/bt-papago/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/bootstrap/bt-papago/js/parallax.min.js"></script>
	<script src="/resources/bootstrap/bt-papago/js/owl.carousel.min.js"></script>
	<script src="/resources/bootstrap/bt-papago/js/jquery.nice-select.min.js"></script>
	<script src="/resources/bootstrap/bt-papago/js/jquery.sticky.js"></script>
	<script src="/resources/bootstrap/bt-papago/js/hexagons.min.js"></script>
	<script src="/resources/bootstrap/bt-papago/js/jquery.counterup.min.js"></script>
	<script src="/resources/bootstrap/bt-papago/js/waypoints.min.js"></script>
	<script src="/resources/bootstrap/bt-papago/js/main.js"></script>
	<script>
	
	$(document).ready(function(){
		$('#goHistory').on('click',function(){
			location.href='/views/papago/history';
		})
		$('#btn').on('click',function(){
			var param = {
					source : $('#source option:selected').val(),
					target : $('#target option:selected').val(),
					text : document.querySelector('#text').value
				}
			ajax({
				contentType: 'application/json; charset=utf-8',
				method : 'POST',
				url : '/papago',
				dataType: 'json',
				data: JSON.stringify(param),
				beforeSend:function(xhr){
					xhr.setRequestHeader('x-ajax','true');
				},
				success : function(res) {	
					console.log(res);
					$('#result').val(res.result.translatedText);
				},
				error : function(res) {
					console.log(res);
				}
				
			});	
		})
	});
	</script>
</body>
</html>