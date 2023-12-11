<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.header-box{
		color: rgb(59, 175, 252);
		width: 70%;
		height: 40px;
		margin-left: 15%;
		border-bottom: 2px solid gray;
		
	}
	
	.search-result{
		width: 70%;
		height: 50px;
		margin-left: 15%;
		border-bottom: 2px solid gray;
		position: relative;
	}

	.study-board{
		background-color: rgb(224, 224, 224);
		width: 100%;
		height: 100px;
	}

	.fishing-board{
		background-color: rgb(224, 224, 224);
		width: 100%;
		height: 100px;
	}

	.free-board{
		background-color: rgb(224, 224, 224);
		width: 100%;
		height: 100px;
	}

	.boardList{
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		width: 70%;
		align-items: center;
		margin: 0px auto;
	}

	.all-see{
		display: flex;
		flex: 1; 
		align-self: flex-end; 
		color: rgb(41, 90, 221);
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br>
	<div class="container">
		<form action="search.bo">
		<div class="header-box">
			<h5>통합 검색 결과</h5>
		</div>
		<br>
		<div class="search-result">
			<td>${keyword} 통합검색 결과</td>
		</div>

		<br>

		<div class="boardList">
			<div class="study-board">
				<div class="board-title">
					<h5>학습동영상</h5>
				</div>
				<table class="study_table">
					<thead>
						<tr>
							<td>제목</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="s" items="${list}">
							<tr onclick="location.href='detail.st?sno=${s.studyNo}'">
								<td>${s.studyTitle}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<script>
				window.onload = function() {
					const opt = document.querySelector("#st-search-area option[value=${keyword}]")
		        		opt.setAttribute("selected", true);
				}
			</script>

			<div class="all-see">
				<a href="list.st">더보기 <i class="bi bi-arrow-right"></i></a>
			</div>
			
			<br><br>

			<div class="fishing-board">
				<div class="board-title">
					<h5>조황게시판</h5>
				</div>
				<table class="fishing-table">
					<tr>
						<td>광어 5짜!</td>
					</tr>
					<tr>
						<td>광어 먹방!</td>
					</tr>
				</table>
			</div>
			<div class="all-see">
				<a href="">더보기 <i class="bi bi-arrow-right"></i></a>
			</div>
			
			<br><br>

			<div class="free-board">
				<div class="board-title">
					<h5>자유게시판</h5>
				</div>
				<table class="free_table">
					<tr>
						<td>광어 맛집</td>
					</tr>
					<tr>
						<td>광어 잘잡히는 곳</td>
					</tr>
				</table>
			</div>
			<div class="all-see">
				<a href="">더보기 <i class="bi bi-arrow-right"></i></a>
			</div>
		</div>
	</form>
	</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>