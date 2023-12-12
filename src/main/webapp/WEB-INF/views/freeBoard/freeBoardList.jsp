<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<!-- CSS-->
<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/freeBoardList.css">
<!-- JS-->

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="content" align="center">
		<br> <br>
		<div class="innerOuter" style="padding: 5% 10%; width: 80%;">
			<h2 align="left" style="margin-left: 50px;">자유게시판</h2>
			<br>
			<!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
			<c:if test="${not empty loginUser }">
				<a class="btn btn-secondary" style="float: right;"
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
				<button type="submit" class="searchBtn btn btn-secondary"
					style="margin-top: 28px;">검색</button>
			</form>



		</div>
		<script>
		
		</script>
</body>
</html>