<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.announce-ann{
		color: rgb(59, 175, 252);
    	width: 90%;
    	margin: 10px auto;
	}
	.border-line{
		border-bottom: 2px solid rgb(204, 204, 204);
    	width: 90%;
    	margin: 10px auto;		
	}
	.ann-title{
		width: 90%;
    	margin: 10px 55px;
    	font-size: 25px;
   		font-weight: bolder;
	}
	.ann-title-line{
		border-bottom: 2px solid rgb(204, 204, 204);
		width: 90%;
    	margin: 10px auto;	
	}
	
	.ann-date{
		width: 90%;
    	margin: 10px 55px;
	}
	li::marker {
  		color: rgb(41, 128, 185);
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br><br>
	
	<br><br><br><br>
	
	<h1 class="announce-ann" style="color:rgb(59, 175, 252)">공지사항</h1>
	<div class="border-line"></div>
	<br><br>
	<div onclick="annEnrollForm()">
		<ul>
			<li class="ann-title">2023 추석 휴무 안내</li>
			<p class="ann-date">2023.11.22<p>
			</ul>
			<div class="ann-title-line"></div>
	</div>
	
	<div>
		<ul>
			<li class="ann-title">2023 추석 휴무 안내</li>
			<p class="ann-date">2023.11.22<p>
		</ul>
			<div class="ann-title-line"></div>
	</div>
	
	<div>
		<ul>
			<li class="ann-title">2023 추석 휴무 안내</li>
			<p class="ann-date">2023.11.22<p>
		</ul>
			<div class="ann-title-line"></div>
	</div>
	<div>
		<ul>
			<li class="ann-title">2023 추석 휴무 안내</li>
			<p class="ann-date">2023.11.22<p>
		</ul>
		<div class="ann-title-line"></div>
	</div>
	
	
	<br><br><br><br><br><br>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>