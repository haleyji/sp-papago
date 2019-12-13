<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>papago translate history</title>
<style>
</style>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
<body>

	<div class="button">
		<button data-target="all">전체</button>
		<button data-target="credat">일자별</button>
		<button data-target="user">사용자별</button>
	</div>
	
	<table border="1" data-id="all">
		<tr data-check="all">
			<th data-order="ps_num desc">번호▼</th>
			<th data-order="ps.ui_num desc">사용자 번호▼</th>
			<th data-order="ui_id desc">사용자 아이디▼</th>
			<th data-order="pi_num desc">번역 번호▼</th>
			<th data-order="ps.credat desc">번역 일자▼</th>
		</tr>
		<tbody id="tBodyA">
		</tbody>
	</table>
	
	<table border="1" data-id="credat" style="display:none">
		<tr data-check="credat">
			<th data-order="credat desc">일자▼</th>
			<th data-order="cnt desc">번역횟수▼</th>
		</tr>
		<tBody id="tBodyC">
		</tBody>
	</table>
	
	<table border="1" data-id="user" style="display:none">
		<tr data-check="user">
			<th data-order="ps.ui_num desc">사용자 번호▼</th>
			<th data-order="ui.ui_id desc">사용자 아이디▼</th>
			<th data-order="cnt desc">번역횟수▼</th>
		</tr data-check="user">
		<tBody id="tBodyU">
		</tBody>
	</table>
	<script>

	function aDataLoad(data){
		ajax({
			url:'/papago/stats?'+data,
			method:'GET',
			success:function(ress){
				var html = '';
				for(var res of ress){
					html+='<tr>';
					html+='<td>'+res.psNum+'</td>';
					html+='<td>'+res.uiNum+'</td>';
					html+='<td>'+res.uiId+'</td>';
					html+='<td>'+res.piNum+'</td>';
					html+='<td>'+res.credat+'</td>';
					html+='</tr>';
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
					html+='<tr>';
					html+='<td>'+res.credat+'</td>';
					html+='<td>'+res.cnt+'</td>';
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
					html+='<tr>';
					html+='<td>'+res.uiNum+'</td>';
					html+='<td>'+res.uiId+'</td>';
					html+='<td>'+res.cnt+'</td>';
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
</body>
</html>