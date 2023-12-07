<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link

	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"

	rel="stylesheet"

	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"

	crossorigin="anonymous">

<link rel="stylesheet"

	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

	<!-- CSS-->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/announceEnroll.css">

</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br><br>
	
	<h1 class="announce-ann" style="color:rgb(59, 175, 252)">공지사항</h1>
	<div class="border-line"></div>
	
	<br><br>
	
		<form class="ann-form" action="annUpdate.an">
			<input type="text" class="ann-title" value="${a.annTitle}" name="annTitle" />
			<input type="hidden" name="annNo" value="${a.annNo }"/>
			<input  type="hidden" value="${loginUser.memId}" name="annWriter" />
			
			<br><br><br>
			
			<textarea id="summernote" class="ann-content" name="annContent" placeholder="내용을 입력해주세요.">${a.annContent}</textarea>
			
			<br><br>
			
			<button class="ann-button" onclick="location.href='annList.an'">목록으로</button>
			<button type="submit" class="ann-button">수정하기</button>
		</form>

	<script>

 // onImageUpload callback

$(document).ready(function() {


 let toolbar = [

 // 글꼴 설정
 ['fontname', ['fontname']],
 // 글자 크기 설정
 ['fontsize', ['fontsize']],
 // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
 // 글자색
['color', ['forecolor','color']],
// 표만들기
['table', ['table']],
// 글머리 기호, 번호매기기, 문단정렬
 ['para', ['ul', 'ol', 'paragraph']],
// 줄간격
 ['height', ['height']],
// 그림첨부, 링크만들기, 동영상첨부
 ['insert',['picture','link','video']],
 // 코드보기, 확대해서보기, 도움말
['view', ['codeview','fullscreen', 'help']]
 ];


let setting = {

height : 600,
minHeight : null,
maxHeight : null,
focus : true,
lang : 'ko-KR',
toolbar : toolbar,

callbacks : { //여기 부분이 이미지를 첨부하는 부분
	
onImageUpload : function(files) {

 for (let i = files.length - 1; i >= 0; i--) {

 uploadSummernoteImageFile(files[i]);

 					}
			 	}
			}
		 };

$('#summernote').summernote(setting);

function uploadSummernoteImageFile(file) {
 data = new FormData();
data.append("upfile", file);
$.ajax({
data : data,
type : "POST",
url : "uploadImageFile",
contentType : false,
enctype : 'multipart/form-data',
processData : false,
success : function(data) {
$("#summernote").summernote("insertImage","/bigFish" + data);
}
});
}
});
</script>	

	<br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>