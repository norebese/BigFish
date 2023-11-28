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
<link rel="stylesheet" href="<%=contextPath%>/resources/css/personalEnrollForm.css">

<!-- JS-->
<script src="<%=contextPath%>/resources/js/personalEnrollForm.js"></script>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	  
	  
	<br><br><br><br><br><br>
	<div class="top-line">
		<h1 class="head-text" style="color: rgb(59, 175, 252);">일반 회원 가입</h1>
	</div>
	<br><br>

	<div>
		<form class="input-form" action="">
			
			<table style="width:40%; margin: 0px auto;">
				<tr>
					<td><input required placeholder="이메일을 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
					<td><button style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">중복 확인</button></td>
				</tr>
				<tr><td></td></tr>
				<tr><td style="height: 30px;"></td></tr>
				<tr>
					<td><input id="pwd" required placeholder="비밀번호를 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="password"></td>
					<td><button id="pwdCheck-btn" onclick="checkPwd();" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">비밀번호 확인</button></td>
				</tr>
				<tr id="passwordRule" style="display: none;">
					<td><div class="warning-text" style=" width: 100%; margin: 0px auto; color: red;">&nbsp;비밀번호는 영문, 숫자, 특수문자 조합으로 8~15자여야합니다.</div></td>
				</tr>
			

			</table>
			<br>
			<input id="pwdAgain" onkeyup="samePwd()" required placeholder="비밀번호를 한번 더 입력해주세요." style="width: 40%; margin: 0px auto;" class="form-control" type="password">
			<div id="checkPasswordRule" class="warning-text" style=" display: none; width: 40%; margin: 0px auto; color: red;">&nbsp;비밀번호가 일치하지 않습니다.</div>
			<br>
			<input required placeholder="닉네임을 입력해주세요. (닉네임은 변경 가능합니다.)" style="width: 40%; margin: 0px auto;" class="form-control" type="text"><br>
			<input required placeholder="휴대폰 번호를 입력해주세요." style="width: 40%; margin: 0px auto;" class="form-control" type="text"><br>
			<table style="width: 40%; margin: 0px auto;">
				<tr style="width: 100%;">
					<td><input placeholder="우편번호" readonly style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
					<td><button style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">주소 검색</button></td>
				</tr>
				<tr>
					<td colspan="2"><input readonly placeholder="주소 검색 버튼으로 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
				</tr>
				<tr>
					<td colspan="2"><input required placeholder="상세 주소를 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"><br></td>
				</tr>
				<tr>
					<td colspan="2"><button id="enroll-btn" disabled type="submit" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">회원가입</button></td>
				</tr>
			</table>
			
		</form>
	</div>



	<br><br>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>