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
<link rel="stylesheet" href="<%=contextPath%>/resources/css/header.css?ver=1">

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 폰트 Noto Sans KR-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">


</head>
<body>
	<%if(alertMsg != null){ %>
		<script>
			alert("<%=alertMsg%>");
		</script>
		<%session.removeAttribute("alertMsg"); %>
	<%} %>

		<div class="header-area" style="background: white;">
	            <div class="header-logo">
	                <img onclick="location.href='<%=contextPath %>'" style="cursor: pointer; height:80px; width: 100px;" src="resources/images/BIGBIGFISH.png" alt="메인로고">
	                	
	            </div>
	            <div class="header-menu">
	                <div class="search-area">
	                    <input type="text" placeholder="검색어를 입력해 주세요">
	                    <a class="search-btn" href="">
	                        <img style="height: auto; width: 15px; margin-top: 7px;" src="resources/images/search_icon.png" alt="검색버튼">
	                    </a>
	            	</div>
	                <a class="menu-link" href="">공지사항</a>
	                <a class="menu-link" href="">FAQ</a>
	                <c:choose>
	                <c:when test="${empty loginUser}">
	                	<a class="menu-link" href="loginForm.me">로그인</a>
	                </c:when>
	                <c:otherwise>
	                	<img onclick="memberMenu();" alt="회원아이콘" style="width:30px; height:30px; margin-left: 30px; margin-top: 15px; cursor: pointer;" src="resources/images/member_icon.png">
	                	<span style="position:absolute; right:-10px; bottom:-5px;">${loginUser.memNick }</span>
	                </c:otherwise>
	                </c:choose>
                    <div class="memberMenu" style="display: none;">
                    	<c:choose>
                    		<c:when test="${loginUser.businessStatus eq 'N' }">
                    			<a href="personalMyPage.me" style="margin-bottom: 3px; text-decoration: none; color: black;">마이페이지</a>
                    		</c:when>
                    		<c:otherwise>
                    			<a href="companyMyPage.me" style="margin-bottom: 3px; text-decoration: none; color: black;">마이페이지</a>
                    		</c:otherwise>
                    	</c:choose>
                        <a href="logout.me" style="text-decoration: none; color: black;">로그아웃</a>
                    </div>
	            </div>
				<div class="menu-btn">
					<img style="height: 30px; width: 30px;" src="resources/images/menubar.png" alt="메뉴바">
				</div>
			</div>

</body>
</html>