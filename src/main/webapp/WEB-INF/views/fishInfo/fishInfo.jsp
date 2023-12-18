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
<title>Big Fish</title>
</head>
<style>
.fishInfo-title{
	color: rgb(59, 175, 252);
    width: 90%;
    margin: 10px auto;
    font-weight: bolder;
}
.border-line{
	border-bottom: 2px solid rgb(204, 204, 204);
    width: 90%;
    margin: 10px auto;		
}
.pagingArea{
    display: flex;
    width: 90%;
    justify-content: center;
    align-items: center;
}
.nav-area{
	display: flex;
	width: 90%;
	justify-content: center;
	align-items:center;
	flex-direction: column;
}
</style>
<body>
<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br><br>
	
		<h1 class="fishInfo-title">어종 백과사전</h1>
		<div class="border-line"></div>
		
			<div class="nav-area">
					<!-- Nav tabs -->
				<ul class="nav nav-tabs">
				  <li class="nav-item">
				    <a class="nav-link active" data-bs-toggle="tab" href="#home">민물</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" data-bs-toggle="tab" href="#menu1">바다</a>
				  </li>
				</ul>
			
				<!-- Tab panes -->
				<div class="tab-content">
				  <div class="tab-pane container active" id="home">
				  	민물고기 어쩌구저쩌구 저쩌구 저쩌구 
				  </div>
				  <div class="tab-pane container fade" id="menu1">
				  	바다 물고기 어쩌구저쩌구 저쩌구 저쩌구 
				  </div>
				</div>
			</div>
			
			<br><br><br><br><br>
			
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
	
	
	<br><br><br><br><br><br>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>