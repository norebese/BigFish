<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
String alertMsg = (String) session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BIG FISH</title>
<!-- 부트스트랩 css 사용 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<!-- CSS-->
<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/freeBoardUpdateForm.css">
<!-- 썸머노트 사용 -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style>
.header-box {
	display: flex;
	flex-direction: row;
}

.left_box {
	background-color: rgb(52, 152, 219);
	width: 25%;
	height: 286px;
}

.center_box {
	display: flex;
	flex-direction: row;
	background-color: rgb(59, 175, 252);
	width: 100%;
	max-width: 1200px;
	height: 286px;
	justify-content: space-evenly;
	align-items: center;
}

.right_box {
	background-color: rgb(52, 152, 219);
	width: 25%;
	height: 286px;
}

.study-image {
	color: white;
	display: flex;
	justify-content: space-around;
	align-items: flex-start;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="header-box">
		<div class="left_box"></div>
		<div class="center_box">
			<div style="color: white;">
				<h2>조황게시판</h2>
				<br>
				<tr>
					<td>어제의 조황, 오늘의 실황, 내일의 기대 등 다양한 얘기를 나누는 공간입니다.</td>
				</tr>
			</div>
			<div class="study-image" style="color: white;">
				<img style="width: 150px;" src="resources/images/1701241591278.png">
			</div>
		</div>
		<div class="right_box"></div>
	</div>

	<div class="content">

		<div class="innerOuter">
			<h2 align="left"
				style="border-bottom: solid 2px rgb(204, 204, 204); padding-bottom: 15px;">조황게시판
				글수정</h2>
			<br>
			<div>
				<form id="enrollForm" method="post" action="fishingUpdateForm.fibo"
					enctype="multipart/form-data">
					<table>

						<div>
							<input type="text" id="title" class="form-control"
								style="margin-bottom: 20px;" value="${b.fishingTitle}"
								name="fishingTitle" required placeholder="제목을 입력해주세요"></input>
							<label for="upfile"></label>
							</th> <div style="height: 100%; margin-bottom: 20px;">
 
</div>
<input type="file" id="upfile" class="form-control-file border"
       name="reUpfile" style="float: left;" onchange="uploadFile(this)"></input><br>
      
							<input type="hidden" name="originName" value="${b.originName }">
							<input type="hidden" name="changeName" value="${b.changeName }">
							<input type="hidden" id="title" value="${loginUser.memNick}"
								name="fishingWriter" placeholder="제목을 작성해주세요." required>
							<input type="hidden" id="title" class="form-control"
								value="${b.fishingNo}" style="margin-bottom: 20px;"
								name="fishingNo" required>
						</div>


						<div
							style="flex: 1; display: flex; margin-right: 20px; margin-top: 20px;">
							<!-- 이미지를 감싸는 div -->
							
							   <img id="yourImageContainer" style="width: 520px;" src="<%=contextPath%>${b.changeName}" alt="Your Image">

<div style="height: 100%; margin-bottom: 20px;">
								<!-- 실제로는 이미지의 경로를 적어주세요. -->
								<img id="yourImageContainer">
							</div>

						</div>
						<div>
							<td id="content"></td>
							<textarea id="summernote" name="fishingContent"
								style="resize: none; margin-bottom: 20px; height: 100%;">${b.fishingContent}</textarea>
						</div>
					</table>
					<br>
					<button type="submit" class="btn btn-primary" style="width: 100%;">게시글
						등록</button>
				</form>
			</div>
		</div>
	</div>
	<script>
		// onImageUpload callback

		$(document).ready(
				
				function() {

					let toolbar = [
							// 글꼴 설정
							[ 'fontname', [ 'fontname' ] ],
							// 글자 크기 설정
							[ 'fontsize', [ 'fontsize' ] ],
							// 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
							[
									'style',
									[ 'bold', 'italic', 'underline',
											'strikethrough', 'clear' ] ],
							// 글자색
							[ 'color', [ 'forecolor', 'color' ] ],
							// 표만들기
							[ 'table', [ 'table' ] ],
							// 글머리 기호, 번호매기기, 문단정렬
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							// 줄간격
							[ 'height', [ 'height' ] ],
							// 그림첨부, 링크만들기, 동영상첨부
							[ 'insert', [ 'picture', 'link', 'video' ] ],
							// 코드보기, 확대해서보기, 도움말
							[ 'view', [ 'codeview', 'fullscreen', 'help' ] ] ];

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
						console.log("바로여기" + file)
						data = new FormData();
						data.append("upfile", file);
						$.ajax({
							data : data,
							type : "POST",
							url : "fishinguploadSummernoteImageFile",
							contentType : false,
							enctype : 'multipart/form-data',
							processData : false,
							success : function(data) {

								console.log($("#summernote"))
								$("#summernote").summernote("insertImage",
										"/bigFish" + data);

							}
						});
					}
				});
		
		function uploadFile(input) {
            if (input.files && input.files[0]) {
                let reader = new FileReader();
                reader.onload = function(e) {
                  document.getElementById('yourImageContainer').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
              } else {
                document.getElementById("yourImageContainer").src = "";
              }
	    }
		
		function uploadFile(input) {
			  if (input.files && input.files[0]) {
			    let reader = new FileReader();
			    reader.onload = function(e) {
			      document.getElementById('yourImageContainer').src = e.target.result;
			    };
			    reader.readAsDataURL(input.files[0]);
			  } else if ("${b.changeName}" !== "") {
			    document.getElementById('yourImageContainer').src = "<%=contextPath%>/${b.changeName}";
			  } else {
			    document.getElementById("yourImageContainer").src = "";
			  }
			}
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>

</html>