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
<link rel="stylesheet" href="<%=contextPath%>/resources/css/announceDetail.css">

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br><br>
	
	<h1 class="announce-ann" style="color:rgb(59, 175, 252)">공지사항</h1>
	<div class="border-line"></div>
	
	<div class="ann-form">
		<p class="ann-title">${a.annTitle}</p>
		<p class="ann-date">${a.annCreateDate}</p>	
		<div class="ann-title-line"></div>
		
		<div class="ann-content">${a.annContent}</div>
		
		<br><br>
		
		<c:if test="${ not empty loginUser }">
			<div class="ann-btn-area">
				<a class="btn btn-primary" onclick="location.href='annList.an'">목록으로</a>
				<c:if test="${ loginUser.memAdmin eq 'Y' }">
					<a class="btn btn-primary" onclick="location.href='annUpdateForm.an?ano=${a.annNo}'">수정하기</a>
					<a type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#myModal">삭제하기</a>
				</c:if>
			</div>
		</c:if>
	</div>

	<br><br><br><br>
	
				<!-- The Modal -->
			<div class="modal" id="myModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">주의 !</h4>
			        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			      </div>
			
			      <!-- Modal body -->
			      <div class="modal-body">
			    	정말 삭제하시겠습니까?    
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <a class="btn btn-danger" data-bs-dismiss="modal" onclick="location.href='annDelete.an?ano=${a.annNo}'">예</a>
			        <a type="button" class="btn btn-primary" data-bs-dismiss="modal">아니오</a>
			      </div>
			
			    </div>
			  </div>
			</div>
	
	
	<br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>