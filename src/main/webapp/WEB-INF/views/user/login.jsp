<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
<body>
<div class="container">
	<lable for="uiId">아이디</lable>
	<input type="text" id="uiId" maxlength="10"><br>
	<lable for="uiPwd">비밀번호</lable>
	<input type="password" id="uiPwd" maxlength="10"><br>
	<button>로그인</button>
</div>
<script>
$(document).ready(function(){
	$('button').on('click',function(){
		var param = {
				uiId:$('#uiId').val(),
				uiPwd:$('#uiPwd').val()
		}
		param = JSON.stringify(param);
		$.ajax({
			url:'/login',
			method:'POST',
			data:param,
			contentType:'application/json',
			success:function(res){
				console.log(res);
				alert(res.msg);
			},
			error:function(res){
				console.log(res);
				alert(res.msg);
				
			}
		})
	})
})
</script>
</body>
</html>