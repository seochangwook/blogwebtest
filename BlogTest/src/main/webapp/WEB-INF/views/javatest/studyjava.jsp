<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<title>Insert title here</title>
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="resources/css/studyjavapage.css">
</head>
<body>
	<h1>Java Study</h1>
	<div id="study1">
		<h3>* 객체(Object)</h3>
		<li>객체지향 (캡슐화, 상속, 다형성)</li>
		<li>Object</li>
		<li>Heap Memory</li>
		<li>필드, 메소드</li>
		<li>생성자</li>
		<li>Getter/Setter</li>
	</div>
	<br>
	<div id="study2">
		<h3>* 상속(Inheritance), 인터페이스(Interface)</h3>
		<li>super/this</li>
		<li>extends, implements</li>
		<li>abstract Method</li>
		<li>Object Class</li>
		<li>다중상속</li>
		<li>메소드 오버로딩, 오버라이딩</li>
	</div>
	<br>
	<div id="study3">
		<h3>* 다형성(Polymorphism)</h3>
		<li>Parent/Child</li>
	</div>
	<br>
	<div id="study4">
		<h3>* Map, List 자료구조</h3>
		<li>Map은 자료구조 중 HaspMap구조에 따른다.</li>
		<li>List는 자료구조 중 LinkedList 구조에 따른다.</li>
		<li>기타 자바 자료구조 클래스 소개</li>
		<li>JSON 소개</li>
	</div>
	<br>
	<div id="study5">
		<h3>* HTTP RESTFul API</h3>
		<li>RESTFul API</li>
		<br>
		<div id="study5_1">
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. REST(Representational State Transfer)의 구성</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- <strong style="color:Red;">자원(Resource) : URI</strong></p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- <strong style="color:Red;">행위(Verb) : HTTP Method</strong></p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- <strong style="color:Red;">표현(Representations)</strong></p>
		</div>
		<br>
		<div id="study5_2">
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. REST API 디자인</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- <strong style="color:Red;">(1) URI는 정보의 자원을 표현해야 한다.</strong></p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* GET /member/delete/1 (x) : 잘못된 방식이다. 이유는 URI는 자원을 표현하는데 중점을 두어야 한다. delete와 같은 행위표현은 적절치 않다.</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- <strong style="color:Red;">(2) 자원에 대한 행위는 HTTP Method(GET,POST,PUT,DELETE)로 표현한다.</strong></p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* DELETE /member/1 (o) : 올바른 설계이다. URI는 자원에 집중하였고, 행위는 DELETE로 Method를 이용하였다.</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* POST /member/2 (o) : 올바른 설계이다. URI는 자원에 집중하였고, 행위는 POST로 Method를 이용하였다.</p>
		</div>
		<br>
		<div id="study5_3">
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. HTTP Method</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- POST,GET,PUT,DELETE 4가지의 메소드를 가지고 CRUD를 구현 가능하다.</p>
			<div id="httpmethodlist" style="padding-left: 35px;">
				<table border="1">
					<thead>
						<tr>
							<th style="text-align: center;">METHOD</th>
							<th style="text-align: center;">역할</th>
						</tr>
					</thead>
					<tbody>
				         <tr>
				            <td style="text-align: center;">POST</td>
				            <td style="text-align: center;">POST를 통해 해당 URI를 요청하면 리소스를 생성합니다.</td>
				         </tr>
				         <tr>
				         	<td style="text-align: center;">GET</td>
				         	<td style="text-align: center;">GET를 통해 리소스를 조회한다. 리소스를 조회하고 해당 도큐먼트의 자세한 정보를 가져온다.</td>
				         </tr>
				         <tr>
				         	<td style="text-align: center;">PUT</td>
				         	<td style="text-align: center;">PUT를 통해 해당 리소스를 수정</td>
				         </tr>
				         <tr>
				         	<td style="text-align: center;">DELETE</td>
				         	<td style="text-align: center;">DELETE를 통해 리소스를 삭제</td>
				         </tr>
				    </tbody>
				</table>
			</div>
		</div>
		<br>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;==> <strong style="color:Red;">URI</strong>는 <strong style="color:Red;">자원을 표현하는데 집중</strong>하고 <strong style="color:Red;">행위</strong>에 대한 정의는 <strong style="color:Red;">HTTP Method를 사용</strong>하여 구성하는 것이 REST한 API를 설계하는 핵심원리</p>
		<br>
		<div id="study5_4">
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. URI설계 시 주의점</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(1) 슬래시 구분자는 계층관계를 나타내는데 사용된다.</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(2) URI마지막 문자로 슬래시를 포함하지 않는다.</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(3) 하이픈은 URI의 가독성을 높이는데 사용</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(4) 밑줄은 URI에서 사용하지 않는다.</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(5) URI경로에는 소문자가 적합하다.</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(6) 파일확장자는 URI에 포함시키지 않는다.</p>
		</div>
		<br>
		<div id="study5_5">
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5. HTTP 응답 상태 코드</p>
			<div id="httpstatecode" style="padding-left: 35px;">
				<table border="1">
					<thead>
						<tr>
							<th style="text-align: center;">상태코드</th>
							<th style="text-align: center;">설명</th>
						</tr>
					</thead>
					<tbody>
				         <tr>
				            <td style="text-align: center;">200</td>
				            <td style="text-align: center;">클라이언트의 요청을 정상적으로 수행함</td>
				         </tr>
				         <tr>
				         	<td style="text-align: center;">400</td>
				         	<td style="text-align: center;">클라이언트의 요청이 부적절할때 사용하는 응답코드</td>
				         </tr>
				         <tr>
				         	<td style="text-align: center;">401</td>
				         	<td style="text-align: center;">클라이언트가 인증되지 않은 상태에서 보호된 리소스를 요청했을때 사용하는 응답코드</td>
				         </tr>
				         <tr>
				         	<td style="text-align: center;">403</td>
				         	<td style="text-align: center;">유저 인증상태와 관계없이 응답하고 싶지 않은 리소스를 클라이언트가 요청했을 경우 사용하는 응답코드</td>
				         </tr>
				         <tr>
				         	<td style="text-align: center;">405</td>
				         	<td style="text-align: center;">클라이언트가 요청한 리소스에서는 사용 불가능한 메소드를 이용했을 경우 사용하는 응답코드</td>
				         </tr>
				         <tr>
				         	<td style="text-align: center;">500</td>
				         	<td style="text-align: center;">서버에 문제가 있을 경우 사용하는 응답코드</td>
				         </tr>
				    </tbody>
				</table>
			</div>
		</div>
	</div>
	<br>
	<div id="study6">
		<h3>* Servlet</h3>
		<li>servlet</li>
		<br>
		<div id="study5_6">
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. Servlet의 개념</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Servlet은 <strong style="color:Red;">톰캣 위에서 동작하는 자바 프로그램.</strong> 톰캣과 같은 WAS가 자바 파일을 컴파일하여 class로 만들고 메모리에 올려 Servlet객체를 만들게 되고 이 Servlet객체는 doPost, doGet을 통해 요청에 응답</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- WAS를 통해 컴파일된 후 메모리에 적재되어 <strong style="color:Red;">클라이언트의 HTTP Get, Post등의 요청을 처리하는 자바 프로그램</strong></p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (WAS란? 웹 애플리케이션 서버(Web Application Server)는 인터넷 상에서 HTTP를 통해 사용자 컴퓨터나 장치에 애플리케이션을 수행해 주는 미들웨어이다.)</strong></p>
		</div>
		<br>
		<div id="study5_7">
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. Servlet 생애주기</p>
			<img style="padding-left: 35px;" src="./resources/images/servletimage.png" width="500" height="300">
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Service단에서 HTML코드를 만들어 다시 응답을 하기가 복잡하다 ==> HTML코드에 자바문법 적용이 가능한 JSP '%' 이용</p>
		</div>
		<br>
		<div id="study5_8">
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. DD(배포서술자), web.xml</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Servlet, Error Page, Listener, Filter, 보안설정 등 Web Application의 설정파일</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- URL과 실제 서블릿의 매핑정보를 포함</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 하나의 웹 애플리케이션에 하나만 존재</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 일반적으로 Web Document Root 디렉터리에 WEB-INF폴더 아래 web.xml파일로 존재</p>
			<img style="padding-left: 35px;" src="./resources/images/webxml.png" width="600" height="200">
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- (1) Servlet : servlet-name과 servlet-class를 연결</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- (2) servlet-name : DD안에서 사용될 이름</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- (3) servlet-class : 자바 클래스 이름</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- (4) url-pattern : 클라이언트가 요청하게 될 주소</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- (5) servlet-mapping : servlet-name과 url-pattern을 연결한다.</p>
		</div>
	</div>
	<br>
</body>
</html>