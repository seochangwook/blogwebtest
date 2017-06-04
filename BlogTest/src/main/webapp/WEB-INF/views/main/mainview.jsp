<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<!-- jQuery, bootstrap CDN -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script> <!-- msie 문제 해결 -->
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<!-- GoogleMap CDN -->
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBpUWd4WYQU4s1EcwGnT_ArHY161PVANpM&callback=initMap"></script>
	<!-- Zebra-Dialog CDN -->
	<script src="resources/js/dialog/zebra_dialog.src.js"></script>
	<link rel="stylesheet" href="resources/css/dialog/zebra_dialog.css" type="text/css"/>
	<!-- General CSS -->
	<link rel="stylesheet" href="resources/css/mainview.css" type="text/css"/>
	<title>Home</title>
</head>
<body>
<form name='TransTest' id='tForm' method='post' action='http://localhost:8080/controller/nextpage1'>
<p> 이름입력: <input ="text" name="input_name"></p>
<p><button name='subject' type='submit'>페이지 이동</button></p>
</form>

<form name='TransTest' id='tForm' method='post' action='http://localhost:8080/controller/nextpage2'>
<p> 이름입력: <input ="text" name="input_name"></p>
<p><button name='subject' type='submit'>페이지 이동</button></p>
</form>
<br><br>
<p>GoogleMap</p>
	<div id="mapdiv">
		<div id="map"></div>
	</div>
	<input type="text" class="form-control form-join" id="address">
	<button name='subject' class='btn btn-success' id='btn-mapchange' value='trans'>지도변경</button>
<br><br>
<div id="friendlist">
	<table border="1">
		<!-- HTML에서 프로그래밍 적용 : JSTL -->
		<c:set var='userlist' value='${listuser}'/>
		<c:if test="${fn:length(userlist) > 0}">
			<thead>
				<tr>
					<th>구분</th>
					<th>이름</th>
					<th>나이</th>
					<th>주소</th>
					<th>이미지</th>
					<th>제거</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items='${listuser}' var='user'>
	                <c:set var='i' value='${i+1}'/>
	                <tr>
	                    <td><c:out value='${i}'/></td>
	                    <td><c:out value='${user.userName}'/></td>
	                    <td><c:out value='${user.userAge}'/></td>
	                    <td><c:out value='${user.userAddress}'/></td>
	                    <td><img src="./resources/images/${user.userImage}" width="100" height="100"></td>
	                    <td><button data-pid='${user.userName}'>제거</button></td>
	                </tr>
	        	</c:forEach>
	        </tbody>
        </c:if>
        <c:if test="${fn:length(userlist) == 0}">
        	<p id='info_sub1' style='font-size:14px;color:#586069; margin:0px'><b>등록된 사용자가 없습니다.</b></p>
        </c:if>
	</table>
</div>
<br><br>
<div id="securitydiv">
	<form name='TransTest' id='tForm' method='post' action='http://localhost:8080/controller/admin.do'>
		<button name='subject' class='btn btn-success' id='btn-manager' type='submit'>관리자 페이지로 이동</button>
	</form>
</div>
<div id="mongodbinputdiv">
	<button name='subject' class='btn btn-warring' id='btn-mongoinputtest'>몽고디비 값 입력</button>
	<input type="text" id="inname" placeholder="input name">
	<input type="text" id="inage" placeholder="input age">
</div>
<br>
<div id="mongodblistdiv">
	<button name='subject' class='btn btn-warring' id='btn-mongolisttest'>몽고디비 리스트 출력</button>
	<input type="text" id="searchname" placeholder="search name">
	<input type="text" id="searchage" placeholder="search age">
	<input type="text" id="option" placeholder="all data is 'all' not 'not'">
</div>
<div class="wrap-loading display-none" hidden="hidden">
    <div><img src="resources/images/ajax-loader.gif" /></div>
</div> 
<br><br>
<div id="filetransdiv">
<form>
<label>주제:</label>&nbsp<input type="text" id="subject" placeholder="input subject"><br>
<label>내용:</label>&nbsp<textarea class="form-control" rows="5" id="content" placeholder="input content"></textarea><br>
<label>첨부파일 :</label>&nbsp<input type="file" class="btn btn-default form-join" id="uploadfile" multiple="multiple"/><br>
</form>
<div id="filelist">
</div>
<button type="button" class="btn btn-primary" id="btn-enroll">등록</button>
</div>
</body>
<script>
$(function(){
	$("[data-pid]").on("click", function(){    
		var selUserName = $(this).data("pid");
		
		tablereload(selUserName);
	});
	$('#btn-mapchange').click(function(){
		var adress_text = $('#address').val();
		
		var trans_objeect = 
    	{
        	'address':adress_text
	    }
		var trans_json = JSON.stringify(trans_objeect); //json으로 반환//
		
		$.ajax({
			url: "http://localhost:8080/controller/geocoderajax",
			type: 'POST',
			dataType: 'json',
			data: trans_json,
			contentType: 'application/json',
			mimeType: 'application/json',
			success: function(retVal){
				//alert("success ajax..." + '/' + retVal.latitude + '/' + retVal.longitude);
				
				reloadMap(retVal.latitude,retVal.longitude);
			},
			error: function(retVal, status, er){
				alert("error: "+retVal+" status: "+status+" er:"+er);
			}
		});
	});
	$('#btn-mongoinputtest').click(function(){
		var name = $('#inname').val();
		var age = $('#inage').val();
		
		var trans_objeect = 
    	{
        	'name': name,
        	'age': age
	    }
		var trans_json = JSON.stringify(trans_objeect); //json으로 반환//
		
		$.ajax({
			url: "http://localhost:8080/controller/mongoinputajax",
			type: 'POST',
			dataType: 'json',
			data: trans_json,
			contentType: 'application/json',
			mimeType: 'application/json',
			success: function(retVal){
				alert("success ajax..." + '/' + retVal.val);
			},
			error: function(retVal, status, er){
				alert("error: "+retVal+" status: "+status+" er:"+er);
			}
		});
	});
	$('#btn-mongolisttest').click(function(){
		var searchname = $('#searchname').val();
		var searchage = $('#searchage').val();
		var option = $('#option').val();
		
		var trans_objeect = 
    	{
        	'searchname': searchname,
        	'searchage':searchage,
        	'option':option
	    }
		var trans_json = JSON.stringify(trans_objeect); //json으로 반환//
		
		$.ajax({
			url: "http://localhost:8080/controller/mongolistajax",
			type: 'POST',
			dataType: 'json',
			data: trans_json,
			contentType: 'application/json',
			mimeType: 'application/json',
			success: function(retVal){
				alert("success ajax..." + '/' + retVal.val);
			},
			error: function(retVal, status, er){
				alert("error: "+retVal+" status: "+status+" er:"+er);
			}
		});
	});
	var files = []; //파일이 저장될 배열//
	var filecount = 0;
	$('[data-toggle="tooltip"]').tooltip(); 
	//파일선택 시 발생하는 이벤트 처리(전송할 파일 목록에 등록)//
	$('#uploadfile').change(function(event){
		files[filecount]=event.target.files[0];
		
		var printHTML = "<label>첨부파일("+(filecount+1)+") " + event.target.files[0].name + "</label><br>";
		
		$('#filelist').append(printHTML);
		
		filecount++;
	});
	$('#btn-enroll').click(function(){
		var subjecttext = $('#subject').val();
		var contenttext = $('#content').val();
		var arraycount = files.length;
		
		//파일전송을 위한 FormData설정//
		var formData = new FormData();
		
		formData.append("subject", subjecttext);
		formData.append("content", contenttext);
		
		for(var i=0; i<arraycount; i++){
			formData.append("uploadfile["+i+"]", files[i]);
		}
		
		//ajax call//
		$.ajax({
			type : 'POST',
    		url : 'http://localhost:8080/controller/enrollajax',
    		data : formData,
    		//파일 전송 시 processData, contentType을 null로 설정//
   		 	processData : false,
    		contentType : false,
    		beforeSend:function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete:function(){
                $('.wrap-loading').addClass('display-none');
            },
    		success : function(retVal) {
    			alert('enroll success...');
    			
    			$('#filelist').empty();
    			filecount=0;
    		},
    		error : function(retVal, status, er) {
    			alert("error: "+retVal+" status: "+status+" er:"+er);
    		}
		});	
	});		
});
///////////////////////
function tablereload(selUserName){
	var trans_objeect = 
	{
    	'delUserName':selUserName
    }
	
	var trans_json = JSON.stringify(trans_objeect); //json으로 반환//
	
	$.ajax({
		url: "http://localhost:8080/controller/tablereload",
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
			var isCheck = retVal.check;
			
			var user_array = [];    
	        var printStr = '';	
	        
	        //배열적용(ajax컨트롤러에서 HashMap으로 저장한 값을 불러온다.)//
	        user_array = retVal.list;
	        var row_count = user_array.length;	
	        
	        $('#friendlist').empty(); //수정된 테이블을 다시 로드하기 위해서 기존 테이블 영역을 지운다.//
	        
	        //테이블에 원소가 한개이상있을 경우//
	        if(row_count > 0){
	        	printStr = "<div id='friendlist'>";
	        	printStr += "<table border='1'>";
	        	printStr += "<thead>";
	        	printStr += "<tr>";
	        	printStr += "<th>구분</th>";
	        	printStr += "<th>이름</th>";
	        	printStr += "<th>나이</th>";
	        	printStr += "<th>주소</th>";
	        	printStr += "<th>이미지</th>";
	        	printStr += "<th>제거</th>";
	        	printStr += "</tr>";
	        	printStr += "</thead>"; 
	        	printStr += "<tbody>";
	            
	            //테이블에 들어갈 데이터를 삽입//
	            $.each(user_array, function(index,value) {
	            	printStr += "<tr>";
	            	printStr += "<td>"+(index+1)+"</td>";
	            	printStr += "<td>"+value.userName+"</td>";
	            	printStr += "<td>"+value.userAge+"</td>";
	            	printStr += "<td>"+value.userAddress+"</td>";
	            	printStr += "<td><img src='./resources/images/"+value.userImage+"' width='100' height='100'></td>";
	            	//onclick속성을 이용해서 직접 함수를 호출하고 값으로 현재 button태그에 value값을(pid) 이용한다.//
	            	printStr += "<td><button value='"+value.userName+"' onclick='tablereload(this.value)'>제거</button></td>";
                	printStr += "</tr>";          			  
       	 		});
	            
	            printStr += "</tbody>";
	            printStr += "</table>";
	            printStr += "</div>";
	            
	          	//제거 성공에 대한 다이얼로그//
				var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>['+selUserName+'] 제거 성공</p>',{
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
	        
	        //테이블에 원소가 한개도 없을 경우//
	        else if(row_count == 0){
	        	printStr = "<div id='friendlist'>";
         	  	printStr += "<p id='info_sub1' style='font-size:14px;color:#586069; margin:0px'><b>등록된 사용자가 없습니다.</b></p>";
         	  	printStr += "</div>";
         	  	
         	  	var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>유저 데이터가 존재하지 않습니다.</p>',{
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
	        
	        $('#friendlist').append(printStr); //다시 테이블을 보여주기 위해서 HTML코드 적용//
		},
		error: function(retVal, status, er){
			alert("error: "+retVal+" status: "+status+" er:"+er);
		}
	});
}
/////////////////////////////
//GoogleMap//
function initMap(){
	var latitude = 37.566536;
	var longitude = 126.97797;
	
	var seoul = {lat: latitude, lng: longitude};
	var map = new google.maps.Map(document.getElementById('map'),{
		zoom: 15,
		center: seoul
	});
	//마커설정//
	var marker = new google.maps.Marker({
		position: seoul,
		title: "Hello Marker"
	});
	
	//마커추가//
	marker.setMap(map);
}
function reloadMap(latitude, longitude){
	var searchlocation = {lat: Number(latitude), lng: Number(longitude)};
	var map = new google.maps.Map(document.getElementById('map'),{
		zoom: 15,
		center: searchlocation
	});
	//마커설정//
	var marker = new google.maps.Marker({
		position: searchlocation,
		title: "Hello Marker"
	});
	
	//마커추가//
	marker.setMap(map);
}
</script>
</html>
