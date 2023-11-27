<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BIG FISH</title>
    <!-- 부트스트랩 css 사용 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <!-- CSS-->
    <link rel="stylesheet" href="<%=contextPath%>/resources/css/freeBoardList.css">
    <!-- JS-->
    
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <div class="content" align="center">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%; width: 80%;" >
            <h2 align="left" style="margin-left: 50px;">자유게시판</h2>
            <br>
            <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
           		<c:if test="${not empty loginUser }">
            	<a class="btn btn-secondary" style="float:right;" href="enrollForm.bo">글쓰기</a>
	            <br>
            	</c:if>
            <br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>조회수</th>
                        <th>좋아요</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                	
                	<tr onclick="">
               			<td>6</td>
               			<td>경기도 광주시 매산리 저수지 낚시</td>
               			<td>먹구왕</td>
               			<td>100</td>
               			<td>55</td>
               			<td>2023-01-01</td>
               		</tr>
                       <tr onclick="">
                        <td>5</td>
                        <td>경기도 광주시 매산리 저수지 낚시</td>
                        <td>먹구왕</td>
                        <td>100</td>
                        <td>55</td>
                        <td>2023-01-01</td>
                    </tr>
                    <tr onclick="">
                        <td>4</td>
                        <td>경기도 광주시 매산리 저수지 낚시</td>
                        <td>먹구왕</td>
                        <td>100</td>
                        <td>55</td>
                        <td>2023-01-01</td>
                    </tr>
                    <tr onclick="">
                        <td>3</td>
                        <td>경기도 광주시 매산리 저수지 낚시</td>
                        <td>먹구왕</td>
                        <td>100</td>
                        <td>55</td>
                        <td>2023-01-01</td>
                    </tr>
                    <tr onclick="">
                        <td>2</td>
                        <td>경기도 광주시 매산리 저수지 낚시</td>
                        <td>먹구왕</td>
                        <td>100</td>
                        <td>55</td>
                        <td>2023-01-01</td>
                    </tr>
                    <tr onclick="">
                        <td>1</td>
                        <td>경기도 광주시 매산리 저수지 낚시</td>
                        <td>먹구왕</td>
                        <td>100</td>
                        <td>55</td>
                        <td>2023-01-01</td>
                    </tr>
               	
                </tbody>
            </table>
            
            <br>
    
    <nav aria-label="Page navigation example"  class="d-flex justify-content-center">
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
            <select id="selectbox" name="selectbox" onchange=""
                class="form-select pt-1 mt-4"  >
                <option value="A">글쓴이</option>
                <option value="B">내용</option>
     
             </select>  
        </div>
        <div class="text">
            <input type="text" class="form-control" name="keyword" style="margin-top: 24px;">
        </div>
        <button type="submit" class="searchBtn btn btn-secondary" style="margin-top: 28px;">검색</button>
    </form>


  
</div>

</body>
</html>