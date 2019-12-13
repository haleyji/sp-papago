<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session-error</title>
</head>
<body>
로그인이 되어있지 않습니다.
로그인 해주세요.
<button>로그인</button>
<script>
document.querySelector('button').onclick = function(){
	location.href = '/views/user/login';
}
</script>
</body>
</html>