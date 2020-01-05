<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<%@include file="/WEB-INF/views/common/login-head.jsp" %> 
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<form class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-32">
						Login
					</span>

					<span class="txt1 p-b-11">
						Id
					</span>
					<div class="wrap-input100 validate-input m-b-36" data-validate = "Username is required">
						<input class="input100" type="text"  id="uiId" >
						<span class="focus-input100"></span>
					</div>
					
					<span class="txt1 p-b-11">
						Password
					</span>
					<div class="wrap-input100 validate-input m-b-12" data-validate = "Password is required">
						<span class="btn-show-pass">
							<i class="fa fa-eye"></i>
						</span>
						<input class="input100" type="password" id="uiPwd">
						<span class="focus-input100"></span>
					</div>
					
					<div class="container-login100-form-btn">
						<button type="button" class="login100-form-btn">
							LOGIN
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	<script>
$(document).ready(function(){
	$('button').on('click',function(){
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
		var param = {
				uiId:$('#uiId').val(),
				uiPwd:$('#uiPwd').val()
		}
		param = JSON.stringify(param);
		$.ajax({
			url:'/login',
			method:'POST',
			data:param,
			beforeSend:function(xhr){
				xhr.setRequestHeader('x-ajax','true');
			},
			contentType:'application/json',
			success:function(res){
				console.log(res);
				alert(res.msg)
				if(res.result=='true'){
					location.href='/';
				}
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