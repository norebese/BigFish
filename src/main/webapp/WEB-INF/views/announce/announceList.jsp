<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIG FISH</title>

<!-- CSS-->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/announceList.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br>
	
	<h1 class="announce-ann" style="color:rgb(59, 175, 252)">공지사항</h1>
	<div class="border-line"></div>
	<br><br>
	<c:forEach var="a" items="${list}">	
		<div class="ann-area" onclick="location.href='annDetail.an?ano=${a.annNo}'" style="cursor:pointer;">
			<ul>
				<li class="ann-title">${a.annTitle}</li>
			</ul>
			<img class="rightarrow" src="resources/images/rightarrow.png">
		</div>
		<p class="ann-date">${a.annCreateDate}</p>
		<div class="ann-title-line"></div>
		<br>
	</c:forEach>
	
	<br>
	
	<c:if test="${  not empty loginUser and loginUser.memAdmin eq 'Y'}">
		<div class="ann-create">
    		<button class="btn btn-primary" onclick="location.href='annEnroll.an'">작성하기</button>
        </div>
        <br>
    </c:if>
    
	<br><br><br>
	
	 <div id="pagingArea" class="pagingArea">
     	<ul class="pagination">
                
               	<c:choose>
               		<c:when test="${ pi.currentPage eq 1 }">
                   		<li class="page-item disabled"><a class="page-link">이전</a></li>
                   	</c:when>
                   	<c:otherwise>
                   		<li class="page-item"><a class="page-link" href="annList.an?cpage=${ pi.currentPage - 1 }">Previous</a></li>
                   	</c:otherwise>
				</c:choose>

				<c:forEach var="p" begin="${pi.startPage}" end="${ pi.endPage }" >
                  		<li class="page-item"><a class="page-link" href="annList.an?cpage=${ p }">${ p }</a></li>  
                   </c:forEach>
                   
                   <c:choose>
               		<c:when test="${ pi.currentPage eq pi.maxPage }">
                   		<li class="page-item disabled"><a class="page-link">다음</a></li>
                   	</c:when>
                   	<c:otherwise>
                   		<li class="page-item"><a class="page-link" href="annList.an?cpage=${ pi.currentPage + 1 }">Next</a></li>
                   	</c:otherwise>
				</c:choose>
                
		</ul>
	</div>
	
		<form class="ann-search-area" id="annSearchForm" action="searchAnn.an" method="get" align="center">
			<div class="select">
				<select id="selectbox" class="form-select pt-1 mt-4" name="condition" style="margin-bottom: 23px;">
	                <option value="annTitle">제목</option>
	                <option value="annContent">내용</option>
	            </select>
	         </div>
	        <div class="text">
	           	<input type="text" class="form-control" name="keyword">
	        </div>
	        <button type="submit" class="searchBtn btn btn-primary">검색</button>
	     </form>
	 <c:if test="${ not empty condition }">
        <script>
        	window.onload = function() {
        		const opt = document.querySelector("#ann-search-area option[value=${condition}]")
        		opt.setAttribute("selected", true);
        	}
        </script>
	</c:if>
	<br><br><br><br>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>