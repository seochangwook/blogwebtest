<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- jQuery, bootstrap CDN -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script> <!-- msie 문제 해결 -->
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
	<!-- Zebra-Dialog CDN -->
	<script src="resources/js/dialog/zebra_dialog.src.js"></script>
	<link rel="stylesheet" href="resources/css/dialog/zebra_dialog.css" type="text/css"/>
	<title>Insert title here</title>
</head>
<body>
<P>name: ${name}. </P>
<div>
<p><button id='getsessionbtn' type='button'>세션값 불러오기</button></p>
<p><button id='logoutbtn' type='button'>로그아웃</button></p>
</div>
<div class="wrap-loading display-none" hidden="hidden">
    <div><img src="resources/images/ajax-loader.gif" /></div>
</div> 
</body>
<script>
$(function(){
	$('#getsessionbtn').click(function(){    
		//alert('get session click');
		
		var trans_objeect = 
		{
	    	'name' : 'seo'
	    }
		
		var trans_json = JSON.stringify(trans_objeect); //json으로 반환//
		
		$.ajax({
			url: "http://localhost:8080/controller/getsessionajax",
			type: 'POST',
			dataType: 'json',
			data: trans_json,
			contentType: 'application/json',
			mimeType: 'application/json',
			beforeSend:function(){
	           	$('.wrap-loading').removeClass('display-none');
	        },
	        complete:function(){
	        	$('.wrap-loading').addClass('display-none');
	        },
			success: function(retVal){
				if(retVal.sessionval != null){
					//제거 성공에 대한 다이얼로그//
					var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>session value: '+ retVal.sessionval+'</p>',{
						title: 'Blog Test Dialog',
						type: 'confirmation',
						print: false,
						width: 760,
						buttons: ['닫기'],
						onClose: function(caption){
							if(caption == '닫기'){
								//alert('yes click');
							}
						}
					});
				}
				
				else if(retVal.sessionval == null){
					var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>session expire</p>',{
						title: 'Blog Test Dialog',
						type: 'error',
						print: false,
						width: 760,
						buttons: ['닫기'],
						onClose: function(caption){
							if(caption == '닫기'){
								//다시 기존 페이지로 돌아간다.//
								var url = "http://localhost:8080/controller/";
			                    $(location).attr("href", url);
							}
						}
					});	
				}
			},
			error: function(retVal, status, er){
				alert("error: "+retVal+" status: "+status+" er:"+er);
			}
		});
	});
	$('#logoutbtn').click(function(){
		$.ajax({
			url: "http://localhost:8080/controller/logoutajax",
			type: 'POST',
			beforeSend:function(){
	           	$('.wrap-loading').removeClass('display-none');
	        },
	        complete:function(){
	        	$('.wrap-loading').addClass('display-none');
	        },
			success: function(retVal){
				var isCheck = retVal.check;
				
				if(isCheck == 'true'){
					var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>session remove success</p>',{
						title: 'Blog Test Dialog',
						type: 'confirmation',
						print: false,
						width: 760,
						buttons: ['닫기'],
						onClose: function(caption){
							if(caption == '닫기'){
								//다시 기존 페이지로 돌아간다.//
								var url = "http://localhost:8080/controller/";
			                    $(location).attr("href", url);
							}
						}
					});	
				}
				
				else if(isCheck == 'false'){
					var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>session remove fail</p>',{
						title: 'Blog Test Dialog',
						type: 'error',
						print: false,
						width: 760,
						buttons: ['닫기'],
						onClose: function(caption){
							if(caption == '닫기'){
							}
						}
					});	
				}
			},
			error: function(retVal, status, er){
				alert("error: "+retVal+" status: "+status+" er:"+er);
			}
		});
	});
});
</script>
</html>