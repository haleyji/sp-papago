<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
	<button id="open">연결</button>
	<div id=rDiv style="display:none">
	<input type="text" id="msg"><button id="send">전송</button>
	</div>
	<script>
		window.onload = function(){
			$('button').on('click', function() {
				var url = 'ws://192.168.0.30/wst';
				var ws = new WebSocket(url);//이때 연결이 발생해서 컨트롤러에 ononpen이 발생
				ws.onopen = function(evt) {
					if (evt && evt.isTrusted) {
						document.querySelector('#open').style.display = 'none';
						document.querySelector('#rDiv').style.display = '';
						$('#send').on('click', function() {
							var msg = document.querySelector('#msg').value;
							ws.send(msg);
						})
					}
				}
				ws.onmessage = function(evt){
					alert(evt.data);
				}
			})
		}
	</script>
</body>
</html>