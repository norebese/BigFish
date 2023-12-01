<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Big Fish</title>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
  integrity="sha256-7ZWbZUAi97rkirk4DcEp4GWDPkWpRMcNaEyXGsNXjLg=" crossorigin="anonymous">
  
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>  
  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg=" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"
	integrity="sha256-5slxYrL5Ct3mhMAp/dgnb5JSnTYMtkr4dHby34N10qw=" crossorigin="anonymous"></script>
	
	
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
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br><br>
	
	<h1 class="announce-ann" style="color:rgb(59, 175, 252)">공지사항</h1>
	<div class="border-line"></div>
	
	<br><br>
	<div class="ann-form">
	<form action="annInsert.an">
			<input type="text" class="ann-title" name="annTitle" placeholder="제목을 입력해주세요.">
			<br><br><br>
			<input type="hidden" value="${loginUser.memId}" name="annWriter" />
			<textarea id="summernote"  class="ann-content" name="annContent" placeholder="내용을 입력해주세요. "></textarea>
			<br><br>
			<button class="btn btn-primary ann-button">게시글 등록</button>
		</form>
	</div> 

	<script>
		$('#summernote').summernote({
		  placeholder: '내용을 적어주세요.',
		  tabsize: 5,
		  width: 950,
		  height: 400,
		  maxHeight: 450,
		  lang: 'ko-KR'
		});
		
		$('#summernote').summernote('insertImage', url, function ($image) {
			  $image.css('width', $image.width() / 3);
			  $image.attr('data-filename', 'retriever');
			});
		
	    function uploadSummernoteImageFile(file, el) {
				data = new FormData();
				data.append("file", file);
				$.ajax({
					data : data,
					type : "POST",
					url : "uploadSummernoteImageFile",
					contentType : false,
					enctype : 'multipart/form-data',
					processData : false,
					success : function(data) {
						$(el).summernote('editor.insertImage', data.url);
					}
				});
			}
	    
	</script>
	
	<br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>