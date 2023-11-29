<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIG FISH</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="<%=contextPath%>/resources/css/insertReservationTwo.css">
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<div style="margin: 150px 100px 10px 100px; padding: 0; border-bottom: 1px solid;">
        <p class="page-title">예약정보 확인</p>
    </div>
    <div class="section">
        <div>
            <img src="<%=contextPath%>/resources/images/profile.png" style="height: 30px; width: 30px;">
            <span style="font-weight: bold;">예약자 정보</span>
        </div>
        <div class="name-phone">
            <span>예약자 명</span>
            <span style="margin-left: 200px;">휴대폰 번호</span>
        </div>
        <div class="input-area">
            <input type="text" placeholder="이름을 입력해주세요">
            <input style="margin-left: 85px;" type="text" placeholder="전화번호를 입력해주세요">
            <div style="margin-left: 10px;">
                <button type="button" class="btn btn-primary btn-sm">인증하기</button>
            </div>
        </div>
    </div>
    <div class="section">
        <span style="font-weight: bold;">예약날짜</span>
        <div style="margin-top: 60px; margin-bottom: 60px;">
            <span>202x년 xx월 xx일 ~ xx월 xx일</span>
        </div>
    </div>
    <div class="section">
        <span style="font-weight: bold;">인원수</span>
        <div style="margin-top: 50px;">
            <span>대인: xx명</span>
            <span style="margin-left: 120px;">소인: xx명</span>
        </div>
        <div style="margin-top: 60px; margin-bottom: 60px;">
            <span>총: XX명</span>
        </div>
    </div>
    <div class="section">
        <span style="font-weight: bold;">요청사항</span>
        <div style="margin-left: 5px; margin-top: 5px; margin-bottom: 10px;">
            <textarea name="" id="" cols="120" rows="5" style="resize: none; border-color: rgb(205, 202, 202);" placeholder="내용을 입력하세요"></textarea>
        </div>
    </div>
    <div class="section">
        <span style="font-weight: bold;">주의사항</span>
        <div style="margin-bottom: 10px;">
            <span>예약시 현장결제만 가능하니 주의하고 예약하기를 눌러주세요.</span>
        </div>
    </div>
    <div class="next-btn">
        
        <button type="button" class="btn btn-primary" style="position: absolute; right: 0; margin-top: 5px;">예약하기</button>
    
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>