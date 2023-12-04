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
<!-- 부트스트랩 css 사용 -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <br><br><br><br><br>
	<div>
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
    	<form action="detail.st">
        <div class="innerOuter" style="padding:5% 10%; width: 80%;">
            <h3 align="left" style="font-weight: bolder; color: rgb(59, 175, 252); margin-left: 5px;">학습동영상</h3>
            <br>

            <table id="contentArea" class="table table-hover" style="border-color: black;" align="center">
                <tr>
                    <th>${s.studyTitle}</th>
                    <td></td>                
                    <td></td>
                </tr>    
                    <td style="font-size: 0.9rem;">${s.studyCreateDate}</td>
                    <td style="font-size: 0.8rem; text-align: right;">${s.studyCount}</td>
                    <td style="font-size: 0.8rem; width: 10%;">${s.studyGoodStatus}</td>  
            </table>

            <br>

            <tr>
                <td colspan="4"><p>${s.studyContent}</p></td>
            </tr>

            <tr>    <!--src 링크를 el값으로 받아온다-->
                <!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/PVAnXu6lxBU?si=Fx2VF4Y_gG1fS_ZE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe> -->
                ${s.studyLink}
            </tr>
            </form>
            </div>
     
            <br><br><br><br>
            
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
                <!-- <c:if test="${loginUser.memId eq s.studyWriter}">  [</c:if>]가 밑에 div 감싸주기 -->
                <div align="right">
                    <!-- <a class="btn btn-primary" onclick="location.href='updateForm.st'">글 수정</a> -->
                    <!-- <a class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteStudy">글 삭제</a> -->
                    <a class="btn btn-primary" onclick="postFormSubmit(1)">글 수정</a>
                    <a class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteStudy">글 삭제</a>
                </div>
                
                <form action="" method="post" id="postForm">
                    <input type="hidden" name="sno" value="${s.studyNo}">
                </form>

                <script>
                    function postFormSubmit(num) {
                        if(num === 1) {
                            $("#postForm").attr('action', 'updateForm.st');
                        } $("#postForm").submit();
                    }
                </script>

        <!-- 댓글 파트 -->
        <div style="width: 70%; margin: 0px auto;" >
        <table id="replyArea" class="table" align="center" onload="">
            <thead>
                <c:choose>
                    <c:when test="${ empty loginUser }">
                        <tr>
                            <th colspan="2">
                                <textarea class="form-control" readonly cols="50" rows="2" placeholder="로그인 후 이용가능합니다." style="text-align: center; resize: none; width: 100%;"></textarea>
                            </th>
                            <th>
                                <th style="vertical-align: middle;"><button class="btn btn-secondary disavled">등록하기</button></th>
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
                </thead>
            </table>
        </div>


    <!-- 댓글파트 -->
    <div class="replyArea" style="width: 70%; margin: 0px auto;">
        <div class="container" style="border-bottom: solid 2px rgb(204,204,204); ">
        <div class="row">
            <div class="col-sm" style="display: flex; align-items: center;">
                <i class="bi bi-person" style="font-size: 40px;"></i>
                <span >${r.replyWriter}</span>
            </div>
            <div class="col-md-8" style="display: flex; align-items: center;">${r.replyContent}</div>
            <div class="col-sm" style="display: flex; align-items: center;">${r.replyCreateDate}</div>
        </div>
        </div>
    </div>
    
    <!-- The Modal -->
    <div class="modal" id="deleteStudy">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">게시글 삭제</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
              	  해당 게시글을 삭제 하시겠습니까?
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer">
            <button class="btn btn-secondary" onclick="location.href='delete.st?sno=${s.studyNo}'" type="submit" style="border: none; background-color: rgb(52, 152, 219); color: white;">네</button>                
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">아니오</button>
            </div>
    
        </div>
        </div>
    </div>
    </div>
  
    

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>