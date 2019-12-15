<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
	<title>History</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link href="https://fonts.googleapis.com/css?family=Playfair+Display:700|Roboto:400,400i,500" rel="stylesheet">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/bootstrap/bt-history/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/bootstrap/bt-history/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/bootstrap/bt-history/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/bootstrap/bt-history/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/bootstrap/bt-history/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/bootstrap/bt-history/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/bootstrap/bt-history/css/main.css?ver=2">
<!--===============================================================================================-->
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
			<div class="button">
			<button data-target="all" class="primary-btn"><b>전체</b></button>
			<button data-target="credat" class="primary-btn"><b>일자별</b></button>
			<button data-target="user" class="primary-btn"><b>회원별</b></button>
			<button class="primary-btn" id="papago-btn"><b>번역하기</b></button>
			</div>
			
		<div id="container">
				<div class="table100 ver1">
					<div class="table100-nextcols">
					<table class="tb" data-id="all">
						<tr data-check="all" class="row100 head">
							<th class="cell100 column1" data-order="ps_num desc">번호▼</th>
							<th class="cell100 column1" data-order="ps.ui_num desc">사용자 번호▼</th>
							<th class="cell100 column1" data-order="ui_id desc">사용자 아이디▼</th>
							<th class="cell100 column1" data-order="pi_num desc">번역 번호▼</th>
							<th class="cell100 column1" data-order="ps.credat desc">번역 일자▼</th>
						</tr>
						<tbody id="tBodyA">
						</tbody>
					</table>
					</div>
					
					<div class="table100-nextcols">
					<table class="tb" data-id="credat" style="display:none">
						<tr class="row100 head" data-check="credat">
							<th class="cell100 column1" data-order="credat desc">일자▼</th>
							<th class="cell100 column1" data-order="cnt desc">번역횟수▼</th>
						</tr>
						<tBody id="tBodyC">
						</tBody>
					</table>
					</div>
					
					<div class="table100-nextcols">
					<table class="tb" data-id="user" style="display:none">
						<tr class="row100 head" data-check="user">
							<th class="cell100 column1" data-order="ps.ui_num desc">사용자 번호▼</th>
							<th class="cell100 column1" data-order="ui.ui_id desc">사용자 아이디▼</th>
							<th class="cell100 column1" data-order="cnt desc">번역횟수▼</th>
						</tr data-check="user">
						<tBody id="tBodyU">
						</tBody>
					</table>
					</div>
					
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>


<!--===============================================================================================-->	
	<script src="/resources/bootstrap/bt-history/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/bootstrap/bt-history/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/bootstrap/bt-history/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/bootstrap/bt-history/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/bootstrap/bt-history/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})

			$(this).on('ps-x-reach-start', function(){
				$(this).parent().find('.table100-firstcol').removeClass('shadow-table100-firstcol');
			});

			$(this).on('ps-scroll-x', function(){
				$(this).parent().find('.table100-firstcol').addClass('shadow-table100-firstcol');
			});

		});

		
		
		
	</script>
	<script>
	$('#papago-btn').on('click',function(){
		location.href='/views/papago/papago';
	})
	function aDataLoad(data){
		ajax({
			url:'/papago/stats?'+data,
			method:'GET',
			success:function(ress){
				var html = '';
				for(var res of ress){
					html+='<tr class="row100 head" >';
					html+='<td class="cell100 column1">'+res.psNum+'</td>';
					html+='<td class="cell100 column1">'+res.uiNum+'</td>';
					html+='<td class="cell100 column1">'+res.uiId+'</td>';
					html+='<td class="cell100 column1">'+res.piNum+'</td>';
					html+='<td class="cell100 column1">'+res.credat+'</td>';
					html+='</tr class="cell100 column1">';
				}
				$('#tBodyA').html(html);
			},
			error:function(res){
				console.log(res);
			}
		})
	}
	
	function cDataLoad(data){
		ajax({
			url:'/papago/stats/credat?'+data,
			method:'GET',
			success:function(ress){
				var html = '';
				for(var res of ress){
					html+='<tr class="row100 head" >';
					html+='<td class="cell100 column1">'+res.credat+'</td>';
					html+='<td class="cell100 column1">'+res.cnt+'</td>';
					html+='</tr>';
				}
				$('#tBodyC').html(html);
			},
			error:function(res){
				console.log(res);
			}
		})
	}
	
	function uDataLoad(data){
		ajax({
			url:'/papago/stats/user?'+data,
			method:'GET',
			success:function(ress){
				var html = '';
				for(var res of ress){
					html+='<tr class="row100 head" >';
					html+='<td class="cell100 column1">'+res.uiNum+'</td>';
					html+='<td class="cell100 column1">'+res.uiId+'</td>';
					html+='<td class="cell100 column1">'+res.cnt+'</td>';
					html+='</tr>';
				}
				$('#tBodyU').html(html);
			},
			error:function(res){
				console.log(res);
			}
		})
	}
	

$(document).ready(function(){
	$('button[data-target]').on('click',function(){
		$('table[data-id]').css('display','none');
		$('table[data-id='+this.getAttribute('data-target')+']').css('display','');
		if(this.getAttribute('data-target')=='credat'){
			cDataLoad();
		}else if(this.getAttribute('data-target')=='user'){
			uDataLoad();
		}
	})
	$('th[data-order]').on('click',function(){
		var text = this.innerHTML;
		var symbol = text.substring(text.length-1,text.length);
		if(symbol=='▼'){
			this.innerText=text.substring(0,text.length-1) + '▲';
			var order = this.getAttribute('data-order');
			order = order.substring(0,order.indexOf('desc'))+'asc';
			this.setAttribute('data-order',order);
		}else{ 
			this.innerText=text.substring(0,text.length-1) + '▼';
			var order = this.getAttribute('data-order');
			order = order.substring(0,order.indexOf('asc'))+'desc';
			this.setAttribute('data-order', order)
		}
		var param = 'order='+this.getAttribute('data-order');
		
		if(this.parentNode.getAttribute('data-check')=='credat'){
			cDataLoad(param);
		}else if(this.parentNode.getAttribute('data-check')=='user'){
			uDataLoad(param);
		}
		aDataLoad(param);
	})	
		aDataLoad();
})
</script>
<!--===============================================================================================-->
	<script src="/resources/bootstrap/bt-history/js/main.js"></script>

</body>
</html>