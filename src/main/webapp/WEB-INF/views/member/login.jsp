<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
        .container {
  width: 450px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 8px;
  display: flex;
  align-items: center;
  height: 50px;
}

.icon {
  margin-right: 10px;
  font-size: 20px;
  color: #555; /* 아이콘 색상 지정 */
}

.input-field {
  flex: 1;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 14px;
  outline: none; /* 포커스 효과 제거 */
}

</style>

</head>
<body>
	<br>
    <div  align="center" >
        <button type="button" class="btn btn-primary btn-sm">기업회원</button>
        <button type="button" class="btn btn-secondary btn-sm">개인회원</button>
    </div>
    <br>
    <form action="login.me">
	    <div class="login" align="center">
	      <div class="container">
	        <div class="icon">Icon</div>
	        <input name="memId" type="text" class="input-field" placeholder="이메일주소" style="border: none;
	        outline: none;">
	      </div>
	      <br>
	
	      <div class="container">
	        <div class="icon">Icon</div>
	        <input name="memPwd" type="text" class="input-field" placeholder="비밀번호" style="border: none;
	        outline: none;">
	      </div>
	
	    </div>
	    <br>
	    <div align="center">
	        <button type="submit" class="btn btn-primary" style="width: 350px; " >로그인하기</button>
	    </div>
    </form>
</body>
</html>