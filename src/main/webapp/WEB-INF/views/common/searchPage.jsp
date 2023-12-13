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
<title>BIG FISH</title>
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
		color: rgb(41, 90, 221);
		justify-content: flex-end;
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
			<div id="study-board" class="study-board">
				<div class="board-title">
					<h5>학습동영상</h5>
				</div>
				<table class="study_table">
					<c:forEach var="s" items="${list}">
					<tr>		
						<td>
							<a onclick="location.href='detail.st?sno=${s.studyNo}'" style="cursor: pointer;">${s.studyTitle}</a>
						</td>
					</tr>	
					</c:forEach>
				</table>
				<br>
				<div class="all-see">
					<a href="list.st">더보기</a>
				</div>
			</div>
	
			<br><br>

			<div id="fishing-board" class="fishing-board">
				<div class="board-title">
					<h5>조황게시판</h5>
				</div>
				<table class="fishing-table">
					<c:forEach var="b" items="${list1}">
					<tr>		
						<td>
							<a onclick="location.href='detail.fibo?bno=${b.fishingNo}'" style="cursor: pointer;">${b.fishingTitle}</a>
						</td>
					</tr>	
					</c:forEach>
				</table>
				<br>
				<div class="all-see">
					<a href="list.fibo">더보기</a>
				</div>
			</div>
			
			<br><br>

			<div id="free-board" class="free-board">
				<div class="board-title">
					<h5>자유게시판</h5>
				</div>
				<table class="free_table">
					<c:forEach var="b" items="${list2}">
					<tr>		
						<td>
							<a onclick="location.href='detail.fbo?bno=${b.freeNo}'" style="cursor: pointer;">${b.freeTitle}</a>
						</td>
					</tr>	
					</c:forEach>
				</table>
				<br>
				<div class="all-see">
					<a href="list.fbo">더보기</a>
				</div>
			</div>
		</div>
	</form>
	</div>

	<script>
		window.onload = function() {
		const studyboard = document.querySelector("#study-board");
		const fishingboard = document.querySelector("#fishing-board");
		const freeboard = document.querySelector("#free-board");
			console.log(${empty list})
			console.log(${empty list1})
			console.log(${empty list2})
		if (${empty list} || ${list.size()} === 0) {
			studyboard.style.display = "none";
		}
		
		if (${empty list1} || ${list1.size()} === 0) {
			fishingboard.style.display = "none";
		}
		
		if (${empty list2} || ${list2.size()} === 0) {
			freeboard.style.display = "none";
		}
	}
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>