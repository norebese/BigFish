<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%
	String contextPath = request.getContextPath();
	
	// 네이버 로그인 관련
 	String clientId = "nDDTuqLHbp7bBSNPwEfS";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8987/bigFish/naverLogin.me", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIG FISH</title>

<!-- CSS-->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/login.css">

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- 네이버 로그인 API-->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<!-- jQuery library (1.11.3)-->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- JS-->
<script src="<%=contextPath%>/resources/js/login.js"></script>



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
        <a href="<%=apiURL%>"><img src="resources/images/login_naver.png" alt="네이버 로그인 아이콘"></a>
        <a><img src="resources/images/login_kakao.png" alt="카카오 로그인 아이콘"></a>
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
    <button onclick="location.href='chooseEnroll.me'" type="button" class="btn btn-secondary" style="width: 450px; ">이메일로 가입하기</button>
    <span class="gray-text">로그인 / 회원가입시 이용약관, 개인정보취급방침에 동의하게 됩니다.</span>
    <br><br><br><br><br><br><br><br><br><br>
    </div>
    
    <div class="top-line"></div>

    <jsp:include page="../common/footer.jsp"/>

</body>
</html>