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

<!-- API-->
<script src="<%=contextPath%>/resources/js/service/member-api.js"></script>

<!-- jQuery library (1.11.3)-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- JS-->
<script src="<%=contextPath%>/resources/js/login.js"></script>



</head>
<body>
  <jsp:include page="../common/header.jsp"/>

	  <br><br><br><br><br><br>
    <div class="top-line"></div>
    <br><br><br><br>
    <div align="center">
        <button id="personal-login" style="background-color: #3baffc; border: none;" onclick="changePersonal();" type="button" class="btn btn-primary btn-sm">개인회원</button>
        <button id="company-login"  style="border: none;"onclick="changeCompany();" type="button" class="btn btn-secondary btn-sm">기업회원</button>
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
          <a data-bs-toggle="modal" data-bs-target="#FindId" style="opacity: 0.5; cursor: pointer;">아이디 찾기</a>
          &nbsp;/&nbsp;
          <a data-bs-toggle="modal" data-bs-target="#FindPwd" style="opacity: 0.5; cursor: pointer;">비밀번호 찾기</a>
        </div>
	        <button type="submit" class="btn btn-primary" style="background: #3baffc; border: none; width: 450px; margin-bottom: 10px;" onclick="testFunk()">로그인하기</button>
	    </div>
    </form>
    <div id="personal-naverkakao" class="memberEnroll-btn-container">
    <button onclick="location.href='chooseEnroll.me'" type="button" class="btn btn-secondary" style="width: 450px; ">이메일로 가입하기</button>
      <div class="naverkakao" style="width:450px; height:38px; margin-top: 10px;">
        <a href="<%=apiURL%>"><img style="width: 100%; height: 50px;" src="resources/images/login_naver.png" alt="네이버 로그인 아이콘"></a>
        
      </div><br>
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
          <a data-bs-toggle="modal" data-bs-target="#FindId" style="opacity: 0.5; cursor: pointer;">아이디 찾기</a>
          &nbsp;/&nbsp;
          <a data-bs-toggle="modal" data-bs-target="#FindPwd" style="opacity: 0.5; cursor: pointer;">비밀번호 찾기</a>
        </div>
	        <button type="submit" class="btn btn-primary" style="background: #3baffc; border: none; width: 450px; margin-bottom: 10px;" onclick="testFunk()">로그인하기</button>
	    </div>
    </form>
    <div id="company-naverkakao" style="display: none;" class="memberEnroll-btn-container">
    <button onclick="location.href='chooseEnroll.me'" type="button" class="btn btn-secondary" style="width: 450px;">이메일로 가입하기</button>
    <span class="gray-text">로그인 / 회원가입시 이용약관, 개인정보취급방침에 동의하게 됩니다.</span>
    <br><br><br><br><br><br><br><br><br><br>
    </div>
    
    <div class="top-line"></div>

<!-- The Modal -->
<div class="modal" id="FindId">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">아이디 찾기</h4>
      </div>

      <!-- Modal body -->
      
      <div class="modal-body">
        <div id="findIdArea" style="display: flex; flex-direction: column; margin: 0px auto;">
        <div style="margin: 0px auto; color: #dd2f35; font-size: 12px;">네이버 아이디의 경우 네이버에서 아이디 찾기를 진행해 주시길 바랍니다.</div><br>
        <div style="display: flex; flex-direction: row; justify-content: center; align-items: center;">닉네임 &nbsp;<input name="memNick" id="memNick" style="width: 60%;" class="form-control" type="text" placeholder="닉네임을 입력하세요."></div>
        <br>
        <div style="display: flex; flex-direction: row; justify-content: center; align-items: center;">전화번호 <input name="phone" id="phone" style="width: 60%;" class="form-control" type="text" placeholder="전화번호를 입력하세요."></div>
        </div>
        <div id="findedIdArea" style="display: none; flex-direction: row; justify-content: center; font-size: 35px;">
        아이디 표시
        </div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" onclick="findId();" class="btn btn-primary">아이디 찾기</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>

<!-- The Modal -->
<div class="modal" id="FindPwd">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">비밀번호 찾기</h4>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div id="findPwdArea" style="display: flex; flex-direction: column; margin: 0px auto;">
          <div style="margin: 0px auto; color: #dd2f35; font-size: 12px;">네이버 아이디의 경우 네이버에서 비밀번호 찾기를 진행해 주시길 바랍니다.</div><br>
          <div style="display: flex; flex-direction: row; justify-content: center; align-items: center;">이메일(ID) <input name="email" id="email" style="width: 60%;" class="form-control" type="text" placeholder="닉네임을 입력하세요."></div>
          <br>
          <div style="display: flex; flex-direction: row; justify-content: center; align-items: center;">전화번호 <input name="phone" id="phonePwd" style="width: 60%;" class="form-control" type="text" placeholder="전화번호를 입력하세요."></div>
          </div>
          <div id="findedPwdArea" style="display: none; flex-direction: row; justify-content: center; font-size: 20px;">
            비밀번호 표시
          </div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" onclick="findPwd();" class="btn btn-primary">비밀번호 찾기</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>




    <jsp:include page="../common/footer.jsp"/>

</body>
</html>