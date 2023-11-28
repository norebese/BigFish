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
<link rel="stylesheet" href="<%=contextPath%>/resources/css/login.css">
<!-- JS-->
<script src="<%=contextPath%>/resources/js/login.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">



</head>
<body>
  <jsp:include page="../common/header.jsp"/>

	  <br><br><br><br><br><br>
    <div class="top-line"></div>
    <br><br><br><br>
    <div align="center">
        <button id="personal-login" onclick="changePersonal();" type="button" class="btn btn-primary btn-sm">개인회원</button>
        <button id="company-login" onclick="changeCompany();" type="button" class="btn btn-secondary btn-sm">기업회원</button>
    </div>
    <br>
    <!-- 개인회원 로그인-->
    <form action="login.me">
	    <div id="personal-input" class="login" align="center">
	      <div class="login-container">
	        <div class="icon" style="width: 50px; height: 50px;">
            <img style="opacity: 0.5; width: 50%; height: 50%; margin-right: 10px; margin-top: 10px;" src="resources/images/email_icon.png" alt="이메일아이콘">
          </div>
	        <input name="memId" type="text" class="input-field" placeholder="이메일주소" style="border: none;
	        outline: none;">
	      </div>
	      <br>
	
	      <div class="login-container">
	        <div class="icon" style="width: 50px; height: 50px;">
            <img style="opacity: 0.5; width: 50%; height: 50%; margin-right: 10px; margin-top: 10px;" src="resources/images/lock_icon.png" alt="비밀번호아이콘">  
          </div>
	        <input name="memPwd" type="password" class="input-field" placeholder="비밀번호" style="border: none;
	        outline: none;">
	      </div>
	
	    </div>
      
	    <div id="personal-button" class="login-btn-container">
        <div class="find-idpw">
          <a style="opacity: 0.5;">아이디 찾기</a>
          &nbsp;/&nbsp;
          <a style="opacity: 0.5;">비밀번호 찾기</a>
        </div>
	        <button type="submit" class="btn btn-primary" style="width: 450px; margin-bottom: 10px;" onclick="testFunk()">로그인하기</button>
	    </div>
    </form>
    <div id="personal-naverkakao" class="memberEnroll-btn-container">
    <button onclick="location.href='chooseEnroll.me'" type="button" class="btn btn-secondary" style="width: 450px; ">이메일로 가입하기</button>
      <div class="naverkakao" style="width:450px; height:38px; margin-top: 10px;">
        <img src="resources/images/login_naver.png" alt="네이버 로그인 아이콘">
        <img src="resources/images/login_kakao.png" alt="카카오 로그인 아이콘">
      </div>
      <span class="gray-text">로그인 / 회원가입시 이용약관, 개인정보취급방침에 동의하게 됩니다.</span>
      <br><br><br><br><br><br><br><br>
    </div>


    <!-- 사업자 회원 로그인 -->
    <form action="login.me">
	    <div id="company-input" style="display: none;" class="login" align="center">
	      <div class="login-container">
	        <div class="icon" style="width: 50px; height: 50px;">
            <img style="opacity: 0.5; width: 50%; height: 50%; margin-right: 10px; margin-top: 10px;" src="resources/images/email_icon.png" alt="이메일아이콘">
          </div>
	        <input name="memId" type="text" class="input-field" placeholder="이메일주소" style="border: none;
	        outline: none;">
	      </div>
	      <br>
	
	      <div class="login-container">
	        <div class="icon" style="width: 50px; height: 50px;">
            <img style="opacity: 0.5; width: 50%; height: 50%; margin-right: 10px; margin-top: 10px;" src="resources/images/lock_icon.png" alt="비밀번호아이콘">  
          </div>
	        <input name="memPwd" type="password" class="input-field" placeholder="비밀번호" style="border: none;
	        outline: none;">
	      </div>
      </div>
	    <div id="company-button" style="display: none;" class="login-btn-container">
        <div class="find-idpw">
          <a style="opacity: 0.5;">아이디 찾기</a>
          &nbsp;/&nbsp;
          <a style="opacity: 0.5;">비밀번호 찾기</a>
        </div>
	        <button type="submit" class="btn btn-primary" style="width: 450px; margin-bottom: 10px;" onclick="testFunk()">로그인하기</button>
	    </div>
    </form>
    <div id="company-naverkakao" style="display: none;" class="memberEnroll-btn-container">
    <button type="button" class="btn btn-secondary" style="width: 450px; ">이메일로 가입하기</button>
    <span class="gray-text">로그인 / 회원가입시 이용약관, 개인정보취급방침에 동의하게 됩니다.</span>
    <br><br><br><br><br><br><br><br><br><br>
    </div>
    
    <div class="top-line"></div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>