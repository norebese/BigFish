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

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BIG FISH</title>
    <!-- 부트스트랩 css 사용 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
        crossorigin="anonymous">
    <!-- CSS-->
    <link rel="stylesheet" href="<%=contextPath%>/resources/css/freeBoardList.css">
    <!-- JS-->
        
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

        <br><br>
        <div class="innerOuter" style="padding:5% 10%; width: 80%;">
            <h3 align="left" style="font-weight: bolder; color: rgb(59, 175, 252); margin-left: 5px;">학습동영상</h3>

            <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
            <c:if test="${not empty loginUser }">
                <button class="btn" onclick="location.href='enrollForm.st' " style="background-color: rgb(52, 152, 219); color: white; float:right;">글쓰기</button>
                <br><br>
            </c:if>
            <br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>등록일</th>
                        <th>조회수</th>
                        <th>좋아요</th>
                    </tr>
                </thead>
                <tbody>
                    <tr onclick="">
                        <td>5</td>
                        <td>낚시왕의 자비로운 동영상</td>
                        <td>2023-01-01</td>
                        <td>100</td>
                        <td>55</td>
                    </tr>
                    <tr onclick="">
                        <td>4</td>
                        <td>낚시왕의 자비로운 동영상</td>
                        <td>2023-01-01</td>
                        <td>100</td>
                        <td>55</td>
                    </tr>
                    <tr onclick="">
                        <td>3</td>
                        <td>낚시왕의 자비로운 동영상</td>
                        <td>2023-01-01</td>
                        <td>100</td>
                        <td>55</td>
                    </tr>
                    <tr onclick="">
                        <td>2</td>
                        <td>낚시왕의 자비로운 동영상</td>
                        <td>2023-01-01</td>
                        <td>100</td>
                        <td>55</td>
                    </tr>
                    <tr onclick="">
                        <td>1</td>
                        <td>낚시왕의 자비로운 동영상</td>
                        <td>2023-01-01</td>
                        <td>100</td>
                        <td>55</td>
                    </tr>

                </tbody>
            </table>

            <br>

            <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>


            <form id="searchForm" action="" method="get" align="center">
                <div class="select" style="margin: none;">
                    <select id="selectbox" name="selectbox" onchange="" class="form-select pt-1 mt-4">
                        <option value="A">제목</option>
                        <option value="B">내용</option>

                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword" style="margin-top: 24px;">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary"
                    style="margin-top: 28px;">검색</button>
            </form>



        </div>
        <jsp:include page="../common/footer.jsp" />
</body>

</html>