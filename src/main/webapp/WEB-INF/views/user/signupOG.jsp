<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User-Signup</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
<body>
	<h2 align="center">User-Signup</h2>

	<div class="container">
		<table class="table table-bordered" border="1">
			<thread class="thread">
			<tr>
				<th>이름</th>
				<td><input type="text" id="uiName"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="uiId"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="uiPwd"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" id="uiPwdCheck"></td>
			</tr>
			<tr>
				<th colspan="2"><button>가입</button></th>
			</tr>
			</thread>
		</table>
	</div>
<script>

		
$('button').on('click',function(){
	var uiName = document.querySelector('#uiName');
	if(uiName.value.trim().length<2){
		alert('이름은 2글자 이상입니다');
		uiName.value='';
		uiName.focus();
		return false;
	}
	var uiId = document.querySelector('#uiId');
	if(uiId.value.trim().length<5){
		alert('아이디는 5글자 이상입니다');
		uiId.value='';
		uiId.focus();
		return false;
	}
	var uiPwd = document.querySelector('#uiPwd');
	if(uiPwd.value.trim().length<5){
		alert('비밀번호는 5글자 이상입니다');
		uiPwd.value='';
		uiPwd.focus();
		return false;
	}
	var uiPwdCheck = document.querySelector('#uiPwdCheck');
	if(uiPwdCheck.value.trim()!= uiPwd.value.trim()){
		alert('비밀번호가 일치하지 않습니다');
		uiPwdCheck.value='';
		uiPwdCheck.focus();
		return false;
	}
	
	ajax({
		contentType: 'application/json; charset=utf-8',
		url:'/signup',
		method:'POST',
		dataType: 'json',
		data: JSON.stringify({
			uiName: $('#uiName').val(),
			uiId: $('#uiId').val(),
			uiPwd : $('#uiPwd').val()
			}),
		success:function(res){
			alert(res.msg);
			if(res.result=='true'){
				location.href='/';
			}
		},
		error:function(res){
			alert(res.msg);
		}
	});
})
</script>

</body>
</html>