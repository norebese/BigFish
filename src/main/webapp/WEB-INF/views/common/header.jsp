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

<!-- JS-->
<script src="<%=contextPath%>/resources/js/header.js"></script>

<!-- CSS-->

<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/header.css?ver=1">


<link rel="stylesheet" href="<%=contextPath%>/resources/css/header.css?ver=1">

<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery library -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



<!-- 폰트 Noto Sans KR-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">


<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>



	<!-- summernote 한국어 팩 -->
<!-- language pack -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"
	integrity="sha256-y2bkXLA0VKwUx5hwbBKnaboRThcu7YOFyuYarJbCnoQ=" crossorigin="anonymous"></script>	

<style>
.offcanvas-header{
	background-color: rgb(59, 175, 252);;
	color: white;
}
.offcanvas-body{
	display: flex;
    flex-direction: column;
}
.btn-close{
	color: white;
}
li::marker {
  	color: rgb(41, 128, 185);
}
</style>

</head>
<body>
	<%if(alertMsg != null){ %>
	<script>
			alert("<%=alertMsg%>");
		</script>
	<%session.removeAttribute("alertMsg"); %>
	<%} %>

	<div class="header-area" style="background: white; z-index: 999;">
		<div class="header-logo">
			<img onclick="location.href='<%=contextPath %>'"
				style="cursor: pointer; height: 80px; width: 100px;"
				src="resources/images/BIGBIGFISH.png" alt="메인로고">

		</div>
		<div class="header-menu">
			<div class="search-area">
				<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력해 주세요"> 
				<a class="search-btn" onclick="mainSearch();">
					<img style="height: auto; width: 15px; margin-top: 7px; cursor: pointer;" src="resources/images/search_icon.png" alt="검색버튼">
				</a>
			</div>

			<a class="menu-link" href="annList.an">공지사항</a> <a class="menu-link"
				href="faqList.fa">FAQ</a>
			<c:choose>
				<c:when test="${empty loginUser}">
					<a class="menu-link" href="loginForm.me">로그인</a>
				</c:when>
				<c:otherwise>
					<img onclick="memberMenu();" alt="회원아이콘"
						style="width: 30px; height: 30px; margin-left: 30px; margin-top: 15px; cursor: pointer;"
						src="resources/images/member_icon.png">
					<span style="position: absolute; right: -10px; bottom: -5px;">${loginUser.memNick }</span>
				</c:otherwise>
			</c:choose>
			<div class="memberMenu" style="display: none;">
				<c:choose>
					<c:when test="${loginUser.businessStatus eq 'N' }">
						<a href="personalMyPage.me"
							style="margin-bottom: 3px; text-decoration: none; color: black;">마이페이지</a>
					</c:when>
					<c:otherwise>
						<a href="companyMyPage.me"
							style="margin-bottom: 3px; text-decoration: none; color: black;">마이페이지</a>
					</c:otherwise>
				</c:choose>
				<a href="logout.me" style="text-decoration: none; color: black;">로그아웃</a>
			</div>
		</div>
		
		<div class="menu-btn">		
				<!-- Offcanvas Sidebar -->
			<div class="offcanvas offcanvas-end" style="width: 255px;" id="demo">
			  <div class="offcanvas-header">
			    <h3 class="offcanvas-title">더보기 메뉴</h3>
			    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
			  </div>
			  <br><br>
			  <div class="offcanvas-body">
			
			  		<a type="button" href="" class="btn" style="background-color: rgb(59, 175, 252); color:white;">바다 낚시</a>
			  		<br>
			  		<a type="button" href="" class="btn" style="background-color: rgb(59, 175, 252); color:white;">민물 낚시</a>
			  		<br>
			  		<a type="button" href="" class="btn" style="background-color: rgb(59, 175, 252); color:white;">낚시 용품</a>
			  		<br>
			  		<a type="button" href="" class="btn" style="background-color: rgb(59, 175, 252); color:white;">어종</a>
			  		<br>
			  		<a type="button" href="" class="btn" style="background-color: rgb(59, 175, 252); color:white;">자유 게시판</a>
			  		<br>
			  		<a type="button" href="" class="btn" style="background-color: rgb(59, 175, 252); color:white;">조황 게시판</a>
			  		<br>
			  		<a type="button" href="" class="btn" style="background-color: rgb(59, 175, 252); color:white;">예약</a>
			  		<br>
			  		<a type="button" href="" class="btn" style="background-color: rgb(59, 175, 252); color:white;">학습 동영상</a>
			  	
			  </div>
			</div>
			
			<!-- Button to open the offcanvas sidebar -->
			<button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#demo">
			 <img style="height: 30px; width: 30px;"
				src="resources/images/menubar.png">
</button>
		</div>
	</div>

</body>
</html>