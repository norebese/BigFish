<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
     <!-- CSS-->
     <link rel="stylesheet" href="<%=contextPath%>/resources/css/freeBoardEnrollForm.css">
    
	 <!-- 썸머노트 사용 -->
     <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2 align="left"style="border-bottom: solid 2px rgb(204,204,204); padding-bottom: 15px;">자유게시판 글작성</h2>
            <br>

            <table>
                <tr>
                    <td><input type="text" id="title" class="form-control" style="margin-bottom: 20px;" value="" name="freeBoardTitle" placeholder="제목을 작성해주세요." required></td>
                    <td><input type="hidden" id="title" value="${loginUser.memNick}" name="freeBoardWriter"  placeholder="제목을 작성해주세요." required></td>
                    
                </tr>
                
                <tr>
                    <td> <div id="summernote"  style="resize:none; margin-bottom: 20px; height: 100%;"></div></td>
                </tr>
                
            </table>
			<br>
            <button type="button" class="btn btn-primary" style="width: 100%;">게시글 작성</button>
           
        </div>
    </div>
    <script>
        $('#summernote').summernote({
          placeholder: '내용을 입력하세요',
          tabsize: 2,
          height: 600
        });
      </script>
</body>
</html>