<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BIG FISH</title>
    <!-- 부트스트랩 css 사용 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    
<!-- CSS-->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/studyUpdateForm.css">
<!-- JS-->
<script src="<%=contextPath%>/resources/js/studyEnrollForm.js"></script>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"> 

</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <br><br><br><br><br>

    <div class="header-box">
        <div class="left_box"></div>
        <div class="center_box">
            <div style="color: white;">
            <h2>학습동영상</h2>
            <br>
                <tr>
                    <td>낚시에 대한 새로운 지식을 배워보세요!</td>
                </tr>
            </div>
            <div class="study-image" style="color: white;">              
                <img style="width: 150px;" src="resources/images/study.png">
            </div>
        </div>
        <div class="right_box"></div>
    </div>

      <div class="content" align="center">
        <form id="enrollForm" action="insert.st" >
        <div class="innerOuter" style="padding:5% 10%; width: 80%;">
            <h3 align="left" style="font-weight: bolder; color: rgb(59, 175, 252);">학습동영상 등록</h3>
            <br>

            <table>
                <tr>
                    <td>
                        <input type="text" id="title" class="form-control" style="margin-bottom: 20px;" name="studyTitle" required placeholder="제목을 입력해주세요.">
                    </td>
                </tr> 
                <tr>
                    <td>
                        <input type="text" id="link" class="form-control" style="margin-bottom: 20px;" name="studyLink" required placeholder="동영상 주소 입력.">
                    </td>
                </tr>            
                <tr>
                    <td>
                        <textarea id="content" class="form-control" rows="19" style="resize:none; margin-bottom: 20px;" name="studyContent" required placeholder="내용을 입력해주세요."></textarea>
                    </td>
                </tr>
            </table>
            <button type="submit" class="btn btn-primary" onclick="location.href='list.st'" style="border: none; width: 100%; background-color: rgb(59, 175, 252);">게시글 등록</button>
      </div>
    </form>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>