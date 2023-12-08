<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
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
	href="<%=contextPath%>/resources/css/freeBoardEnrollForm.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="content">
		<br>
		<br>
		<div class="innerOuter">
			<h2 align="left"
				style="border-bottom: solid 2px rgb(204, 204, 204); padding-bottom: 15px;">자유게시판
				글수정</h2>
			<br>

			<table>
				<tr>
					<td><input type="text" id="title" class="form-control"
						style="margin-bottom: 20px;" value="" name="boardTitle" required></td>
				</tr>

				<tr>
					<td id="content"><div id="summernote"
							style="resize: none; margin-bottom: 20px; height: 100%;"></div></td>
				</tr>

			</table>
			<br>
			<button type="button" class="btn btn-primary" style="width: 100%;">게시글
				수정</button>

		</div>
	</div>
	<script>
	   
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
        	  console.log("바로여기"+file)
            data = new FormData();
            data.append("upfile", file);
            $.ajax({
                data : data,
                type : "POST",
                url : "uploadSummernoteImageFile",
                contentType : false,
                enctype : 'multipart/form-data', 
                processData : false,
                success : function(data) {
                	
                     console.log($("#summernote"))
                   $("#summernote").summernote("insertImage","/bigFish" + data); 
               
                }
            });
        }
    });

      </script>
</body>
</html>