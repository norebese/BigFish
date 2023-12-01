<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
    <link rel="stylesheet" href="<%=contextPath%>/resources/css/freeBoardUpdateForm.css">
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
            <h2 align="left" style="border-bottom: solid 2px rgb(204,204,204); padding-bottom: 15px;">조황게시판 글작성</h2>
            <br>
    
            <table>
              
                        <div>
                            <input type="text" id="title" class="form-control" style="margin-bottom: 20px;" value="" name="boardTitle" required>
                        </div>
                      
                        
                        <div style="flex: 1; display: flex; margin-right: 20px;">
                            <!-- 이미지를 감싸는 div -->
                            <div style="width: 200px; height: 280px; margin-bottom: 20px;">
                                <!-- 실제로는 이미지의 경로를 적어주세요. -->
                                <img src="<%=contextPath%>/resources/images/fishing.jpg" alt="Your Image">
                            </div>
                        
                            <!-- 설명을 포함한 div -->
                            <div style="flex: 1; display: flex; flex-direction: column;">
                                <span style="flex: 1;">썸네일 사진을 삽입해주세요.</span>
                            </div>
                        </div>
                        <div>
                           <td id="content"><div id="summernote"  style="resize:none; margin-bottom: 20px; height: 100%;"></div></td>
                        </div>
                
            </table>
			<br>
            <button type="button" class="btn btn-primary" style="width: 100%;">게시글 등록</button>
           
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