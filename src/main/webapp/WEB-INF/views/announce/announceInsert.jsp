<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Big Fish</title>
<style>
.announce-ann{
	color: rgb(59, 175, 252);
    width: 90%;
    margin: 10px auto;
    font-weight: bolder;
}
.border-line{
	border-bottom: 2px solid rgb(204, 204, 204);
    width: 90%;
    margin: 10px auto;		
}
.ann-button {
    width: 850px;
    font-size: 16px;
    font-weight: bolder;
    height: 50px;
    background-color: rgb(59, 175, 252);
    color: white;
    border-radius: 3px;
    border: 4px solid;
    text-align: center;
}
.ann-form{
	display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}
.ann-title{
	width: 850px;
    height: 40px;
}
.ann-content{
	width: 850px;
    height: 550px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br><br>
	
	<h1 class="announce-ann" style="color:rgb(59, 175, 252)">공지사항</h1>
	<div class="border-line"></div>
	
	<br><br>
	<form class="ann-form">
		<input type="text" class="ann-title" name="ann-title" placeholder="제목을 입력해주세요.">
		<br><br><br>
		<textarea class="ann-content" name="ann-content" placeholder="내용을 입력해주세요." ></textarea>
		<br><br>
		<button class="ann-button">게시글 등록</button>
	</form>
	
	<br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>