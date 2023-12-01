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
	
	<div class="ann-form" >
		<h1 class="announce-ann" style="color:rgb(59, 175, 252)">공지사항</h1>
		<div class="border-line"></div>
	
		
	<br>
	
	
		<form>
		
			<input type="text" class="ann-title" name="ann-title" placeholder="제목을 입력해주세요.">
			<br><br><br>
			<textarea class="ann-content" name="ann-content" placeholder="내용을 입력해주세요.">안녕하세요 관리자 입니다. 다름이아니라...	... 안내사항 입니다.</textarea>
		
		</form>
		<br><br>
	
		<button class="ann-button" onClick="annList()">목록으로</button>
		<button class="ann-button" onClick="annUpdate()">수정하기</button>
	</div>
	
	<script>
	function annList(){
		location.href="annList.an";
	}s
	</script>
	<br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>