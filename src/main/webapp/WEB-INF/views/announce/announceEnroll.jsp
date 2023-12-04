<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
		
	<br>
	
		<form class="ann-form" action="annUpdate.an">
			<input type="text" class="ann-title" value="${a.annTitle}" name="annTitle" />
			<input type="hidden" name="annNo" value="${a.annNo }"/>
			<input type="hidden" value="${loginUser.memId}" name="annWriter" />
			<br><br><br>
			<textarea class="ann-content" name="annContent" placeholder="내용을 입력해주세요.">${a.annContent}</textarea>
			
			<button class="ann-button" onclick="location.href='annList.an'">목록으로</button>
			<button type="submit" class="ann-button">수정하기</button>
		</form>

	

	<br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>