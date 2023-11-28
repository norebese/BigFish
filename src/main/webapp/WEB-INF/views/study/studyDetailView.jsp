<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.left_box{
    background-color: rgb(52, 152, 219); 
    position: absolute; 
    left: 0.25px; 
    width: 275px; 
    height: 286px;
}

.center_box{
    background-color: rgb(59, 175, 252); 
    left: 275px; 
    width: 650px; 
    height: 286px;
    
}

.right_box{
    background-color: rgb(52, 152, 219); 
    position: absolute;
    left: 1155px; 
    width: 275px; 
    height: 286px;
}

.study_image{
    position: absolute; 
    top: 142.008px; 
    left: 608.2px; 
    width: 317px; 
    height: 204px;
}

</style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <br><br><br><br><br>

    <div class="container-fluid p-5 bg-primary text-white text-center">
        <h2>학습동영상</h2>
        <br>
        <h6>낚시에 대한 새로운 지식을 배워보세요.</h6>

      </div>

    <!-- <div class="left_box"></div>
    <div class="center_box">
        <div 
            type="image" class="study_image" src="resources/images/study.png">
        </div>
    </div>
    <div class="right_box"></div> -->

    <div class="content" align="center">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%; width: 80%;">
            <h3 align="left" style="color: rgb(59, 175, 252); margin-left: 50px;">학습동영상</h3>
            <br>

            <table id="contentArea" class="table table-hover" align="center">
                <tr>
                    <th>너도 할 수 있다 낚시</th>
                    <td style="font-size: 0.8rem;">2023-01-01</td>
                    <td style="font-size: 0.8rem;">조회수: 36</td>
                    <td style="font-size: 0.8rem;">좋아요: 12</td>
                </tr>    
            </table>

            <br>

            <tr>
                <td colspan="4"><p>너도 할 수 있어 낚시!</p></td>
            </tr>

            <tr>    <!--src 링크를 el값으로 받아온다-->
                <iframe width="560" height="315" src="https://www.youtube.com/embed/PVAnXu6lxBU?si=Fx2VF4Y_gG1fS_ZE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            </tr>
            <br><br><br><br>
            
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
                <!-- <c:if test="${loginUser.memId eq s.studyWriter}">  [</c:if>]가 밑에 div 감싸주기 -->
                <div align="right">
                    <a class="btn btn-primary" onclick="postFormSubmit(1)">글 수정</a>
                    <a class="btn btn-danger" onclick="postFormSubmit(2)">글 삭제</a>
                </div>
            </div>
        </div>

        <div style="width: 70%; margin: 0px auto;" >
        <table id="replyArea" class="table" align="center" onload="">
            <thead>
                <c:choose>
                    <c:when test="${ empty loginUser }">
                        <tr>
                            <th colspan="2">
                                <textarea class="form-control" readonly cols="50" rows="2" style="resize: none; width: 100%;">
                                    로그인 후 이용 가능 합니다.
                                </textarea>
                            </th>
                            <th align="right">
                                <button class="btn btn-secondary disavled">등록하기</button>
                            </th>
                        </tr>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <th colspan="2">
                                    <textarea class="form-control" id="content" cols="50" rows="2" style="resize: none; width: 100%;"></textarea>
                                </th>
                                <th style="vertical-align: middle;"><button class="btn btn-secondary" onclick="addReply()">등록하기</button></th>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                        <tr>
                            <td colspan="3">댓글(<span id="rcount">3</span>)</td>
                        </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>낚시초보</th>
                        <td>유익한 영상이네요!</td>
                        <td>2023-02-01</td>
                    </tr>
                    <tr>
                        <th>낚시왕</th>
                        <td>대박!</td>
                        <td>2023-02-05</td>
                    </tr>
                </tbody>
            </table>
        </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>