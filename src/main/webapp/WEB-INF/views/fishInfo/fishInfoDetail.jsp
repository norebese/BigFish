<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=contextPath%>/resources/css/fishInfoDetail.css?ver=1">
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br><br>
		
		<h1 class="fishInfo-title">어종 백과사전</h1>
		<div class="border-line"></div>
		
		<div class="fishInfo-area">
			<p class="fish-name">${f.fishName}</p>
			<div class="border-line"></div>	
			
			<br>
			
			<div class="fish-content">${f.fishContent}</div>
			
			<br><br><br>
			
			<button class="btn btn-primary" onclick="location.href='fishInfo.fi'">목록으로</button>
		</div>

	<br><br><br><br><br><br>
<jsp:include page="../common/footer.jsp"/>	
</body>
</html>