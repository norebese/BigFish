<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Big Fish</title>
<link

	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"

	rel="stylesheet"

	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"

	crossorigin="anonymous">

<link rel="stylesheet"

	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- language pack -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"
	integrity="sha256-y2bkXLA0VKwUx5hwbBKnaboRThcu7YOFyuYarJbCnoQ=" crossorigin="anonymous"></script>	
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
	
	<br><br>
	
	<form class="ann-form" action="annInsert.an" >
			<input type="text" class="ann-title" name="annTitle" placeholder="제목을 입력해주세요.">
			<input type="hidden" value="${loginUser.memId}" name="annWriter" />
			<br><br><br>
			<textarea id="summernote"  class="ann-content" name="annContent" placeholder="내용을 입력해주세요. "></textarea>
			<br><br>
			<button class="btn btn-primary ann-button">게시글 등록</button>
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
                    console.log(files);
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