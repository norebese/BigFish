<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	href="<%=contextPath%>/resources/css/freeBoardEnrollForm.css">
	<style>

.header-box{
    display: flex;
    flex-direction: row;
    
}

.left_box{
    background-color: rgb(52, 152, 219);  
    width: 25%; 
    height: 286px;
}

.center_box{
    display: flex;
    flex-direction: row;
    background-color: rgb(59, 175, 252); 
    width: 100%; 
    max-width: 1200px;
    height: 286px;
    justify-content: space-evenly;
    align-items: center;
    
}

.right_box{
    background-color: rgb(52, 152, 219); 
    width: 25%; 
    height: 286px;
}

.study-image{
    color: white;
    display: flex;
    justify-content: space-around;
    align-items: flex-start;
}

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
		 <br><br><br><br><br>
		<div class="header-box">
        <div class="left_box"></div>
        <div class="center_box">
            <div style="color: white;">
            <h2>자유게시판</h2>
            <br>
                <tr>
                    <td>환영합니다! 여기는 자유게시판입니다. 다양한 주제로 자유롭게 이야기 나누어 보세요.</td>
                </tr>
            </div>
            <div class="study-image" style="color: white;">              
                <img style="width: 150px;" src="resources/images/1701241590820.png">
            </div>
        </div>
        <div class="right_box"></div>
    </div>
    
	<div class="content">
		<br> <br>
		<div class="innerOuter">
			<h2 align="left"
				style="border-bottom: solid 2px rgb(204, 204, 204); padding-bottom: 15px;">자유게시판
				글작성</h2>
			<br>
                <form action="insert.fbo"  method="post">
				<table>

					<tr>
						<td><input type="text" id="title" class="form-control"
							style="margin-bottom: 20px;" value="" name="freeTitle"
							placeholder="제목을 작성해주세요." required></td>
						<td><input type="hidden" id="title"
							value="${loginUser.memNick}" name="freeWriter"
							placeholder="제목을 작성해주세요." required></td>
							<td><input type="hidden" id="title"
							value=changeName name="file" 
							placeholder="제목을 작성해주세요." required></td>
					</tr>

					<tr>
						<td>
							<textarea id="summernote" name="freeContent" style="resize: none; margin-bottom: 20px; height: 100%;  text-align: left;"></textarea>
						</td>
					</tr>
				</table>
				<br>
				<button type="submit" class="btn btn-primary" style="width: 100%;border: rgb(59, 175, 252);">게시글
					작성</button>
                </form>
			
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
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