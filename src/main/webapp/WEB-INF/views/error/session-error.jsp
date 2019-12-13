<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session-error</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
crossorigin="anonymous"></script>
</head>
<body>
로그인이 되어있지 않습니다.
로그인 또는 회원가입을 해주세요.
<button id="loginBtn">로그인</button>
<button id="signupBtn">회원가입</button>

<script>
$('#loginBtn').on('click',function(){
	location.href = '/views/user/login';
})
$('#signupBtn').on('click',function(){
	location.href = '/views/user/signup';
})


</script>
</body>
</html>