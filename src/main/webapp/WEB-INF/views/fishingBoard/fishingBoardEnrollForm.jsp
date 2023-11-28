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
                            <textarea id="content" class="form-control" rows="19" style="resize:none; margin-bottom: 20px;" name="boardContent" required>
                                붕어 잡는 기대감보다는 맘 편히 제 님과 쉬다 왔네요👍

                                포인트는 정말 이뿌고 최고였습니다!
                                
                                그리고 낚시하면서 초평지를 처음 와 봤는데요!
                                
                                내년 봄에 산란철때 다시 도전해봐야겠습니다.
                                
                                사또좌대 시설도 좋네요😎 제 님이 매우 만족👍
                                
                                다음에 또 올게요!🙏</textarea>
                        </div>
                
            </table>
            <button type="button" class="btn btn-primary" style="width: 100%;">게시글 등록</button>
           
        </div>
    </div>
</body>

</html>