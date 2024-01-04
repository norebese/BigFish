<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIG FISH</title>

<!-- CSS-->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/personalMyPage.css">

<style>
.resDetail-title{
	display: flex;
    justify-content: center;
    align-items: center;
}
.resDetail-container{
	display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}
.border-line{
	border-bottom: 2px solid rgb(204, 204, 204);
    width: 55%;
    margin: 20px auto;	
}
.border-line-bottom{
	border-bottom: 2px solid rgb(204, 204, 204);
    width: 55%;
    margin: 20px auto;	
}
.btn-area{
	display: flex;
    justify-content: center;
    width: 40%;
    margin-left: 570px;
    
}
.btn-area > button{
	width: 200px;
	height:50px;
	background-color:rgb(224, 224, 224);
	border:none;
	border-radius: 4px solid;
	color:black;
}
.res-info{
	margin: 10px 450px;
}
.res-info-bottom{
	margin: 10px 360px;
	font-weight:bold;
}
.res-cash{
	
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
		<br><br><br><br><br>

	  <div class="top-line">
	  	<h1 class="resDetail-title" style="color:rgb(59, 175, 252)">예약 정보</h1>
	  </div>
	  <br><br>

	  <div>
	  	<div class="res-info">
		  	<span style="font-weight:bold; font-size:15px; color:rgb(190, 190, 190);">No. ${rev.revNo}</span> <br>
		  	<span style="font-size:17px; font-weight:bold;">${store.storeName}</span>
	  	</div>
	  	<div class="border-line"></div>
	  	<div class="res-info">
		  	일정: ${rev.revStart} ~ ${rev.revEnd} <br>
		  	서비스명: ${tic.ticketName}
		</div>
		<br><br>
		<div class="btn-area">
			<button class="btn btn-secondary" onclick="location.href='resDetailPage?storeNumber=${store.storeNo}'">다시 예약</button> 
		</div>
	  </div>
	  <br>


	  	<div class="res-info-bottom">
	  		<span style="font-weight:bold; font-size:25px;">결제내역</span>
	  	</div>
	  	<div class="border-line-bottom"></div>
	  	<div class="res-info-bottom">
	  		<div style="display:flex; flex-direction: column;">
				<c:forEach var="i" begin="1" end="${rev.revPeople}">
		  			<div style="display:flex; justify-content:space-between">
		  				<span>${tic.ticketName}</span>
		  				<span><fmt:formatNumber value="${tic.ticketPrice}"/>원</span>
		  			</div>
					<br>
				</c:forEach>
	  		</div>
			
	  	</div>
	  	<div class="border-line-bottom"></div>
	  	<div class="res-info-bottom">
	  		<div style="display:flex; flex-direction: column;">
	  			<div style="display:flex; justify-content:space-between">
	  				<span>합계</span>
	  				<span><fmt:formatNumber value="${tic.ticketPrice * rev.revPeople}"/>원</span>
	  			</div>
	  		</div>
	  	</div>

	  	<br><br>

	  	<div class="res-info-bottom">
	  		<span style="font-weight:bold; font-size:25px;">판매자 연락처</span>
	  	</div>
	  	<div class="border-line-bottom"></div>
	  		<div class="res-info-bottom">
	  			<div style="display:flex; flex-direction: row;">
	  				<div style="width:70px">판매자</div>
	  				<div style="width:300px"><span>${store.storeName}</span></div>
	  			</div>
	  			<div style="display:flex; flex-direction: row;">
	  				<div style="width:70px">주소</div>
	  				<div style="width:600px"><span>${store.storeAddress}, ${store.storeAddressDetail}</span></div>
	  			</div>
	  			<div style="display:flex; flex-direction: row;">
	  				<div style="width:70px">연락처</div>
	  				<div style="width:300px"><span>${store.storePhone}</span></div>
	  			</div>
	  		</div>

	  		<br>

	  		<div class="res-info-bottom">
	  		<span style="font-weight:bold; font-size:25px;">예약자 정보</span>
	  	</div>
	  	<div class="border-line-bottom"></div>
	  		<div class="res-info-bottom">
	  			<div style="display:flex; flex-direction: row;">
	  				<div style="width:60px">예약자</div>
	  				<div style="width:300px"><span>${rev.revName}</span></div>
	  			</div>
	  			<div style="display:flex; flex-direction: row;">
	  				<div style="width:60px">연락처</div>
	  				<div style="width:300px"><span>${rev.revPhone}</span></div>
	  			</div>
	  		</div>

		<br><br>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>