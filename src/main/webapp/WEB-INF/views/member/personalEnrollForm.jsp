<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.google.gson.JsonObject"%>

<%
	String contextPath = request.getContextPath();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIG FISH</title>

<!-- CSS-->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/personalEnrollForm.css">

<!-- JS-->
<script src="<%=contextPath%>/resources/js/personalEnrollForm.js"></script>

<!-- API-->
<script src="<%=contextPath%>/resources/js/service/member-api.js"></script>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 주소 검색 API (다음카카오)-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	  
	  
	<br><br><br><br><br><br>
	<div class="top-line">
		<h1 class="head-text" style="color: rgb(59, 175, 252);">일반 회원 가입</h1>
		<input type="hidden" value="${memberInfo}" id="memberInfo">
	</div>
	<br><br>

	<div>
		<form class="input-form" action="insertNaverMember.me" method="post">
			<div style="width: 40%; margin: 0px auto; font-size: 12px;">※ 중복 확인 버튼을 모두 눌러주세요.</div>
			<table style="width:40%; margin: 0px auto;">
				<tr>
					<td><input required id="emailId" name="memId" placeholder="이메일을 입력하세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
					<td><button type="button" onclick="checkEmailId()" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">중복 확인</button></td>
				</tr>
				
				<tr>
					<td id="checkEmailIdSpace" style="height: 30px;"></td>
				</tr>
			

			</table>
			
			<table style="width:40%; margin: 0px auto;">
				<tr style="width: 100%;">
					<td><input required id="memNick" name="memNick" placeholder="닉네임을 입력해주세요. (닉네임은 변경 가능합니다.)" style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
					<td><button type="button" id="checkNick-btn" onclick="checkNick()" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">닉네임 중복 확인</button></td>
				</tr>
				<tr>
					<td id="checkNickSpace" style="height: 30px;"></td>
				</tr>
			</table>
			<input required id="phone" name="phone" placeholder="휴대폰 번호를 입력해주세요. (-미포함)" style="width: 40%; margin: 0px auto;" class="form-control" type="text"><br>
			<table style="width: 40%; margin: 0px auto;">
				<tr style="width: 100%;">
					<td><input name="postNo" id="postcode" placeholder="우편번호" readonly style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
					<td><button type="button" onclick="sample6_execDaumPostcode()" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">주소 검색</button></td>
				</tr>
				<tr>
					<td colspan="2"><input readonly id="address" name="address" placeholder="주소 검색 버튼으로 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
				</tr>
				<tr>
					<td colspan="2"><input required id="addressDetail" name="addressDetail" placeholder="상세 주소를 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"><br></td>
				</tr>
				<tr>
					<td colspan="2"><button id="enroll-btn" disabled type="submit" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">회원가입</button></td>
				</tr>
			</table>
			
		</form>
	</div>

	<br><br>
	<script>
		window.onload = function() {
		let tmp = JSON.parse(`${memberInfo}`);
		
		let str = tmp.response.mobile.replaceAll("-","");

		document.querySelector("#emailId").value = tmp.response.email;
		document.querySelector("#memNick").value = tmp.response.nickname;
		document.querySelector("#phone").value = str;

		const memberInfo = document.querySelector('#memberInfo');
		console.log(tmp);
	}


	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>