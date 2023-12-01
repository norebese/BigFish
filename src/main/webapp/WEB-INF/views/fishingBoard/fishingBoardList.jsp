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


</head>
<body>
    <jsp:include page="../common/header.jsp"/>
   
 
    <div class="content" align="center">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%; width: 80%;" >
            <h2 align="left" style="border-bottom: solid 2px rgb(204,204,204); padding-bottom: 15px; " >조황게시판</h2>


            <div style="display: flex; flex-wrap: wrap; border-bottom: solid 2px rgb(204,204,204); padding-bottom: 15px;">
                <div style="flex: 0 0 33%; text-align: center; margin-bottom: 40px;">
                    <img src="<%=contextPath%>/resources/images/fishing.jpg" alt="Your Image" style="width: 80%; height: 80%; object-fit: cover; ">
                    <h6 style="font-weight: 800;">제목</h6>
                    <!-- 이 밑에 p태그는 나중에 기능개발할때 구체적으로 작성하면 좋겠습니다. -->
                    <p>글쓴이 좋아요:9</p>
                    <p>조회수:21 2023/11/28</p>
                </div>
                <div style="flex: 0 0 33%; text-align: center; margin-bottom: 40px;">
                    <img src="<%=contextPath%>/resources/images/fishing.jpg" alt="Your Image" style="width: 80%; height: 80%; object-fit: cover; ">
                    <h6 style="font-weight: 800;">제목</h6>
                    <p>글쓴이 좋아요:9</p>
                    <p>조회수:21 2023/11/28</p>
                </div>
                <div style="flex: 0 0 33%; text-align: center; margin-bottom: 40px;">
                    <img src="<%=contextPath%>/resources/images/fishing.jpg" alt="Your Image" style="width: 80%; height: 80%; object-fit: cover; ">
                    <h6 style="font-weight: 800;">제목</h6>
                    <p style="display: left;">글쓴이 좋아요:9</p>
                    <p>조회수:21 2023/11/28</p>
                </div>
                <div style="flex: 0 0 33%; text-align: center; margin-bottom: 40px;">
                    <img src="<%=contextPath%>/resources/images/fishing.jpg" alt="Your Image" style="width: 80%; height: 80%; object-fit: cover; ">
                    <h6 style="font-weight: 800;">제목</h6>
                    <p>글쓴이 좋아요:9</p>
                    <p>조회수:21 2023/11/28</p>
                </div>
                <div style="flex: 0 0 33%; text-align: center; margin-bottom: 40px;">
                    <img src="<%=contextPath%>/resources/images/fishing.jpg" alt="Your Image" style="width: 80%; height: 80%; object-fit: cover; ">
                    <h6 style="font-weight: 800;">제목</h6>
                    <p>글쓴이 좋아요:9</p>
                    <p>조회수:21 2023/11/28</p>
                </div>
                <div style="flex: 0 0 33%; text-align: center; margin-bottom: 40px;">
                    <img src="<%=contextPath%>/resources/images/fishing.jpg" alt="Your Image" style="width: 80%; height: 80%; object-fit: cover; ">
                    <h6 style="font-weight: 800;">제목</h6>
                    <p>글쓴이 좋아요:9</p>
                    <p>조회수:21 2023/11/28</p>
                </div>
                <div style="flex: 0 0 33%; text-align: center; margin-bottom: 40px;">
                    <img src="<%=contextPath%>/resources/images/fishing.jpg" alt="Your Image" style="width: 80%; height: 80%; object-fit: cover; ">
                    <h6 style="font-weight: 800;">제목</h6>
                    <p>글쓴이 좋아요:9</p>
                    <p>조회수:21 2023/11/28</p>
                </div>
                <div style="flex: 0 0 33%; text-align: center; margin-bottom: 40px;">
                    <img src="<%=contextPath%>/resources/images/fishing.jpg" alt="Your Image" style="width: 80%; height: 80%; object-fit: cover; ">
                    <h6 style="font-weight: 800;">제목</h6>
                    <p>글쓴이 좋아요:9</p>
                    <p>조회수:21 2023/11/28</p>
                </div>

            </div>
  
    <nav aria-label="Page navigation example"  class="d-flex justify-content-center" style="margin-top: 20px;">
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

      


      <form id="searchForm" action="" method="get" style="display: flex; align-items: center; justify-content: center;">
        <div class="select" style="margin: none; margin-right: 10px;">
            <select id="selectbox" name="selectbox" onchange="" class="form-select pt-1 mt-4">
                <option value="A">제목</option>
                <option value="B">작성자</option>
            </select>
        </div>
        <div class="text" style="margin-right: 10px;">
            <input type="text" class="form-control" name="keyword" style="margin-top: 24px;">
        </div>
        <button type="submit" class="searchBtn btn btn-secondary" style="margin-top: 24px;">검색</button>
    </form>

    </div>




    
</body>
</html>