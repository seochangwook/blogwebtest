<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- jQuery, bootstrap CDN -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script> <!-- msie 문제 해결 -->
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<!-- Zebra-Dialog CDN -->
	<script src="resources/js/dialog/zebra_dialog.src.js"></script>
	<link rel="stylesheet" href="resources/css/dialog/zebra_dialog.css" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>admin site</p>
	<li><a href="#" class="nav_btn" id="btn_logout" style="color: #0366d6"><span class="glyphicon glyphicon-log-in"></span>&nbsp로그아웃</a></li>
</body>
<script>
$(function(){
	$('#btn_logout').click(function(){
	    //ajax call//
	    $.ajax({
	       url: "http://localhost:8080/controller/logoutsecurityajax",
	       type: 'POST',
	       dataType: 'text',
	       success: function(retVal){
	          var is_check = retVal;
	       
	          if(is_check == 'true'){    	  
	        	var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>로그아웃 성공</p>',{
					title: 'Blog Test Dialog',
					type: 'confirmation',
					print: false,
					width: 760,
					buttons: ['닫기'],
					onClose: function(caption){
						if(caption == '닫기'){
							var url = "http://localhost:8080/controller/";
					        $(location).attr("href", url);
						}
					}
				});
	          }
	          
	          else if(is_check == 'false'){
	        	  var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>로그아웃 실패</p>',{
						title: 'Blog Test Dialog',
						type: 'confirmation',
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