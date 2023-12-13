<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%String contextPath = request.getContextPath();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	
	String alertMsg = (String)session.getAttribute("alertMsg");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BIG FISH</title>
<!-- 부트스트랩 css 사용 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

	<!-- CSS-->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/freeBoardList.css">
<!-- JS-->
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
</head>
<body>
	<jsp:include page="../common/header.jsp" />
		 <br><br><br><br><br>
		<div class="header-box">
        <div class="left_box"></div>
        <div class="center_box">
            <div style="color: white;">
            <h2>자유게시판</h2>
            <br>
                <tr>
                    <td>자유롭게 소통을 해보세용~!</td>
                </tr>
            </div>
            <div class="study-image" style="color: white;">              
                <img style="width: 150px;" src="resources/images/1701241590820.png">
            </div>
        </div>
        <div class="right_box"></div>
    </div>
    
	<div class="content" align="center">
		<br> <br>
		<div class="innerOuter" style="padding: 5% 10%; width: 80%;">
			<h2 align="left" style="margin-left: 50px;">자유게시판</h2>
			<br>
			<!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
			<c:if test="${not empty loginUser }">
				<a class="btn btn-primary" style="float: right; background-color: rgb(59, 175, 252);"
					href="freeEnrollForm.bo">글쓰기</a>
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

					<c:forEach var="b" items="${list}">
						<tr onclick="location.href='detail.fbo?bno=${b.freeNo}'">
							<td>${b.freeNo}</td>
							<td>${b.freeTitle}</td>
							<td>${b.freeWriter}</td>
							<td>${b.count}</td>
							<td>55</td>
							<td>${b.createDate}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

			<br>

			<nav aria-label="Page navigation example"
				class="d-flex justify-content-center">
				<ul class="pagination">
					<c:choose>
                		<c:when test="${pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link"><span aria-hidden="true">&laquo;</span>
					</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.fbo?cpage=${pi.currentPage - 1 }"><span aria-hidden="true">&laquo;</span>
					</a></li>
                    	</c:otherwise>
                    </c:choose>
					
					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                   <li class="page-item"><a class="page-link" href="list.fbo?cpage=${p }">${p }</a></li>
                    </c:forEach>
					
					 <c:choose>
                		<c:when test="${pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link"><span aria-hidden="true">&raquo;</span>
					</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.fbo?cpage=${pi.currentPage + 1 }"> <span aria-hidden="true">&raquo;</span>
					</a></li>
                    	</c:otherwise>
                    </c:choose>
				</ul>
			</nav>


			<form id="searchForm" action="" method="get" align="center">
				<div class="select" style="margin: none;">
					<select id="selectbox" name="selectbox" onchange=""
						class="form-select pt-1 mt-4">
						<option value="A">글쓴이</option>
						<option value="B">내용</option>

					</select>
				</div>
				<div class="text">
					<input type="text" class="form-control" name="keyword"
						style="margin-top: 24px;">
				</div>
				<button type="submit" class="btn btn-primary"
					style="margin-top: 28px;background-color: rgb(59, 175, 252);">검색</button>
			</form>



		</div>
		<script>
		
		</script>
		  <jsp:include page="../common/footer.jsp"/>
</body>
</html>