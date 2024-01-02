<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIG FISH</title>

<!-- CSS-->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/chooseEnroll.css">

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	  <jsp:include page="../common/header.jsp"/>
	  
	  
	  <br><br><br><br><br><br>
	  <div class="top-line"></div>
	  <br>
	  
	  <div class="main-container">
		<h3>빅 피쉬 회원가입을 환영합니다.</h3>
		<br>
		<div class="choose-container">
			<div class="choose-btn">
				<img onclick="location.href='basicPersonalEnrollForm.me'" style="width: 350px; cursor: pointer;" src="resources/images/fishing.png" alt="개인 회원가입">
				<br>
				<button onclick="location.href='basicPersonalEnrollForm.me'" class="btn btn-primary btn-sm">개인 회원가입</button>
			</div>
			<div class="choose-btn">
				<img onclick="location.href='companyEnrollForm.me'" style="width: 360px; cursor: pointer;" src="resources/images/fishing-boat.png" alt="사업자 회원가입">
				<br>
				<button onclick="location.href='companyEnrollForm.me'" class="btn btn-success btn-sm">사업자 회원가입</button>
			</div>
		</div>
	  </div>
	  
	  <br><br><br><br><br><br>
	  <div class="top-line"></div>
	  <jsp:include page="../common/footer.jsp"/>
</body>
</html>



