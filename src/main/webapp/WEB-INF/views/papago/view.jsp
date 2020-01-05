<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<%@include file="/WEB-INF/views/common/head.jsp" %>
	<title>History</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="/WEB-INF/views/common/history-head.jsp" %>
<style>
#container{
max-height:500px;
overflow:auto;
}
</style>
</head>
<body>
	<div class="limiter">
		<div class="container-table100">
		<h1><span> history</span></h1>
			<div class="wrap-table100">
				<div id="container">
					<div class="table100 ver1">
						<div class="table100-nextcols">
							<table class="tb" data-id="all">
								<tr data-check="all" class="row100 head">
									<th class="cell100 column1" >번호</th>
									<th class="cell100 column1" >입력 언어</th>
									<th class="cell100 column1" >입력 문장</th>
									<th class="cell100 column1" ></th>
									<th class="cell100 column1" >번역 언어</th>
									<th class="cell100 column1" >번역 결과</th>
								</tr>
								<tr class="row100 body">
									<td class="cell100 column1" id="piNum"></td>
									<td class="cell100 column1" id="piSource"></td>
									<td class="cell100 column1" id="piText"></td>
									<td class="cell100 column1" >=></td>
									<td class="cell100 column1" id="piTarget"></td>
									<td class="cell100 column1" id="piResult"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script>
$(document).ready(function(){
	$.ajax({
		url:'/papago/view/${param.piNum}',
		method:'GET',
		success:function(res){
			const list = $('td[id]')
			for(var i=0;i<list.length;i++){
				list[i].innerHTML=res[list[i].getAttribute('id')];
			}
		},error:function(res){
			
		}
	})
})
</script>
<!--===============================================================================================-->
	<script src="/resources/bootstrap/bt-history/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/bootstrap/bt-history/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/bootstrap/bt-history/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/bootstrap/bt-history/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/bootstrap/bt-history/js/main.js"></script>
</body>
</html>