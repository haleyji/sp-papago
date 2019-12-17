<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebSocket</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<textarea id="chat" cols="50" rows="20"></textarea><br>
<input type="text" id="inputTxt"><button id="send">전송</button>
<body>
<script>
$(document).ready(function(){
	var url = 'ws://192.168.0.30/ws/chatting';
	var ws = new WebSocket(url);
	var chatting = '';
	ws.onmessage = function(evt){
		for(one of evt.data){
			chatting += one
		}
		$('#chat').val(chatting);
	}
	$('#send').on('click',function(){
		var txt = $('#inputTxt').val();
		ws.send(txt);
	})
})
</script>
</body>
</html>