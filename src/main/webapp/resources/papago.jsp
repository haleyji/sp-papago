<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

</head>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous">
  </script>
<style>
	* {
		font-family:'Malgun Gothic';
 		box-sizing: border-box;
	}
	[id$=wrap]{
		width: 1200px;
		height: 100px;
		background-color: white;
		margin:0 auto;
		padding:20px
	}
	#header-wrap{
		background-color: #4CAF50;
		text-align: center; font:bold; font-size:large;
		color:white;
		font-size: 40px;
		
	}
	#container-wrap{
		align-content: center;
		text-align: center;  
		height: 500px;
	}
	[class^=source]{
		float:left; font-size:18px;
		width: 50%;
		height: 500px;
	}
	[class^=target]{
		float:right; font-size:18px;
		width: 50%;
		height: 500px;
	}
	#text{
		width: 70%;
		height: 400px;
		margin-top:10px; font-size:18px;
	}
	#result{
		width: 70%;
		height: 400px;
		margin-top:10px; font-size:18px;
	}
	[class^=lang]{
		width:400px;
		height:40px;
	}
	#btn{
	 	width:200px;
	 	height:50px;
		background-color: #4CAF50; /* Green */
  		border: none;
		color: white;
		padding: 15px 32px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 18px;
	}

</style>
<body>
	<div id="header-wrap">
		<b>sp-papago project</b>
	</div>

	<div id="container-wrap">
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
		</select><br>
		<textarea id="text" placeholder="번역할 내용을 입력하세요."></textarea><br>
		<button id="btn">번역</button>
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
	</div>

	<div id="footer-wrap">

	</div>
	
	<script>
	
	$(document).ready(function(){
		$('#btn').on('click',function(){
			var param = {
					source : $('#source option:selected').val(),
					target : $('#target option:selected').val(),
					text : document.querySelector('#text').value
				}
			$.ajax({
				contentType: 'application/json; charset=utf-8',
				method : 'POST',
				url : '/papago',
				dataType: 'json',
				data: JSON.stringify(param),
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

