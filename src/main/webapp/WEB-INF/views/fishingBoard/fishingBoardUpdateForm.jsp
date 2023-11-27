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
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2 align="left" style="border-bottom: solid 2px rgb(204,204,204); padding-bottom: 15px;">조황게시판 글수정</h2>
            <br>

            <table>
                <tr>
                    <td>
                        <input type="text" id="title" class="form-control" style="margin-bottom: 20px;" value="" name="boardTitle" required>
                        
                      
                        <div style="padding-top: 20px;">
                            <!-- 실제로는 이미지의 경로를 적어주세요. -->
                            <img src="<%=contextPath%>/resources/images/member_icon.png" alt="Your Image" style="max-width: 100%; height: auto;">
                            <span>썸네일 사진을 삽입해주세요.</span>
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <textarea id="content" class="form-control" rows="19" style="resize:none; margin-bottom: 20px;" name="boardContent" required></textarea>
                    </td>
                </tr>
                
            </table>
            <button type="button" class="btn btn-primary" style="width: 100%;">게시글 등록</button>
           
        </div>
    </div>
</body>
</html>