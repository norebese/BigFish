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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
.header-box {
	display: flex;
	flex-direction: row;
}

.left_box {
	background-color: rgb(52, 152, 219);
	width: 25%;
	height: 286px;
}

.center_box {
	display: flex;
	flex-direction: row;
	background-color: rgb(59, 175, 252);
	width: 100%;
	max-width: 1200px;
	height: 286px;
	justify-content: space-evenly;
	align-items: center;
}

.right_box {
	background-color: rgb(52, 152, 219);
	width: 25%;
	height: 286px;
}

.study-image {
	color: white;
	display: flex;
	justify-content: space-around;
	align-items: flex-start;
}
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="header-box">
		<div class="left_box"></div>
		<div class="center_box">
			<div style="color: white;">
				<h2>조황게시판</h2>
				<br>
				<tr>
					<td>당신의 대물을 자랑하시오!</td>
				</tr>
			</div>
			<div class="study-image" style="color: white;">
				<img style="width: 150px;" src="resources/images/1701241591278.png">
			</div>
		</div>
		<div class="right_box"></div>
	</div>


	<div class="content" align="center">

		<div class="innerOuter" style="padding: 5% 10%; width: 80%;">
			<h2 align="left"
				style="border-bottom: solid 2px rgb(204, 204, 204); padding-bottom: 15px;">조황게시판</h2>
			<c:if test="${not empty loginUser }">
				<a class="btn btn-secondary"
					style="float: right; border: none; background-color: rgb(59, 175, 252);"
					href="enrollForm.fibo">글쓰기</a>

			</c:if>
			<br>


			<div
				style="display: flex; flex-wrap: wrap; border-bottom: solid 2px rgb(204, 204, 204); padding-bottom: 15px;">

				<c:forEach var="b" items="${list}">
					<div
						style="flex: 0 0 33%; text-align: center; margin-bottom: 40px;"
						onclick="location.href='detail.fibo?bno=${b.fishingNo}'">
						<img src="<%=contextPath%>${b.changeName}" alt="Your Image"
							style="width: 80%; height: 80%; object-fit: contain; cursor: pointer;">
						<h6 style="font-weight: 800;">${b.fishingTitle}</h6>
						<!-- 이 밑에 p태그는 나중에 기능개발할때 구체적으로 작성하면 좋겠습니다. -->
						<p>글쓴이:${b.fishingWriter} 좋아요:9</p>
						<p>조회수:${b.fishingCount} 날짜:${b.fishingCreateDate}</p>
					</div>
				</c:forEach>




			</div>

			<nav aria-label="Page navigation example"
				class="d-flex justify-content-center">
				<ul class="pagination">
					<c:choose>
						<c:when test="${pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link"><span
									aria-hidden="true">&laquo;</span> </a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="list.fibo?cpage=${pi.currentPage - 1 }"><span
									aria-hidden="true">&laquo;</span> </a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<li class="page-item"><a class="page-link"
							href="list.fibo?cpage=${p }">${p }</a></li>
					</c:forEach>

					<c:choose>
						<c:when test="${pi.currentPage eq pi.maxPage }">
							<li class="page-item disabled"><a class="page-link"><span
									aria-hidden="true">&raquo;</span> </a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="list.fibo?cpage=${pi.currentPage + 1 }"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>




			<form id="searchForm" action="fisearchForm.bo" method="get"
				style="display: flex; align-items: center; justify-content: center;">
				<div class="select" style="margin: none; margin-right: 10px;">
					<select id="selectbox" name="condition" onchange=""
						class="form-select pt-1 mt-4">
						<option value="fiTitle">제목</option>
						<option value="fiwriter">작성자</option>
					</select>
					 <input type="hidden" value="${b.originName}" name="originName">
					  <input type="hidden" value="${b.changeName}" name="changeName">
				</div>
				<div class="text" style="margin-right: 10px;">
					<input type="text" class="form-control" name="keyword"
						style="margin-top: 24px;">
				</div>
				<button type="submit" class="searchBtn btn btn-secondary"
					style="margin-top: 24px; border: none; background-color: rgb(59, 175, 252);">검색</button>
			</form>
			<c:if test="${ not empty condition }">
				<script>
        	window.onload = function() {
        		const opt = document.querySelector("#ann-search-area option[value=${condition}]")
        		opt.setAttribute("selected", true);
        	}
        </script>
			</c:if>

		</div>

		<jsp:include page="../common/footer.jsp" />
</body>
</html>