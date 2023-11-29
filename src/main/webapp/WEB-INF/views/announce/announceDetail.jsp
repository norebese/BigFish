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
.ann-title{
	width: 90%;
    margin: 10px 80px;
    font-size: 25px;
   	font-weight: bolder;
}
.ann-date{
	width: 90%;
    margin: 10px 80px;
}
.ann-title-line{
	border-bottom: 2px solid rgb(204, 204, 204);
	width: 90%;
    margin: 10px auto;	
}
.ann-textArea{
	width: 90%;
    margin: 10px 80px;
}
.ann-button {
	display: flex;
    width: 300px;
    justify-content: space-between;
    align-items: center;
    margin-left: 600px;
}
.ann-button > button{
	background-color: rgb(59, 175, 252);
	color: white;
	border-radius: 3px;
    border: none;
    width: 85px;
    height: 35px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br><br>
	
	<h1 class="announce-ann" style="color:rgb(59, 175, 252)">공지사항</h1>
	<div class="border-line"></div>
	
	<p class="ann-title">2023 추석 휴무 안내</p>
	<p class="ann-date">2023.11.22</p>
	<div class="ann-title-line"></div>

	<div class="ann-textArea">
		안녕하세요 관리자 입니다.<br>
		다름이아니라...	<br>
		... 안내사항 입니다.
	</div>
	<br><br><br><br>
	<div class="ann-button">
		<button onClick="announceList()">목록으로</button>
		<button>수정하기</button>
		<button>삭제하기</button>
	</div>
	
	<script>
		function announceList(){
			location.href="announceList.an";
		}
	</script>
	
	<br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>