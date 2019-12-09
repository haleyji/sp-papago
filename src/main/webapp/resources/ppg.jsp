<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous">
  </script>
<style>
	* {
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
		background-color: rgb(217, 241, 172);
		text-align: center; 
		font-size: 40px;
		
	}
	#container-wrap{
		align-content: center;
		text-align: center; font:bold; font-size:large; 
		height: 500px;
		font-size:18px;

	}
	[class^=source]{
		float:left;
		width: 50%;
		height: 500px;
	}
	[class^=target]{
		float:right;
		width: 50%;
		height: 500px;
	}
	#text{
		width: 70%;
		height: 400px;
		margin-top:10px;
	}
	#result{
		width: 70%;
		height: 400px;
		margin-top:10px;
	}
	[class^=lang]{
		width:400px;
		height:40px;
	}
	#btn{
	 	width:200px;
	 	height:50px;
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
		<button id="btn" onclick="doTranslate()">번역</button>
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
			<input type="text" id="result" readonly >
		</div>
	</div>

	<div id="footer-wrap">

	</div>
	
	<script>
	$(document).ready(function(){
		alert('준비됨');
	})
		function doTranslate(){

			var conf = {
				method : 'POST',
				url : '/papago',
				callback : function(res) {
					var res = JSON.parse(res);
					console.log(res);
					document.querySelector('#result').value = res.result.translatedText;
				}
			}

			var xhr = new XMLHttpRequest();
			xhr.open(conf.method, conf.url);
			xhr.setRequestHeader("Content-Type", "application/json");
			xhr.onreadystatechange = function() {
				if (xhr.readyState == xhr.DONE) {
					if (xhr.status == 200) {
						conf.callback(xhr.responseText);
					}
				}
			}
			var param = {
				source : $("#source option:selected").val(),
				target : $("#target option:selected").val(),
				text : document.querySelector('#text').value
			}
			console.log(param);
			xhr.send(JSON.stringify(param));
		}
	</script>
</body>
</html>

