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
<title>Insert title here</title>
<link rel="stylesheet" href="<%=contextPath%>/resources/css/fishInfoDetail.css?ver=1">
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br><br>
		
		<h1 class="fishInfo-title">어종 백과사전</h1>
		<div class="border-line"></div>
		
		<div class="fishInfo-area">
			<p class="fish-name">${f.fishName}</p>
			<div class="border-line"></div>	
			
			<br>
			
			<div class="fish-content">${f.fishContent}</div>
			
			<br><br><br>
				<div class="fishInfo-btn-area">
					<button class="btn btn-primary" onclick="location.href='fishInfo.fi'">목록으로</button>
					<c:if test=" ${ loginUser.memAdmin eq 'Y' }">
						<button class="btn btn-primary" onclick="location.href='fishUpdateForm.fi?fno=${f.fishNo}'">수정하기</button>
						<button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#myModal">삭제하기</button>
					</c:if>
				</div>
		</div>
		
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
			        <a class="btn btn-danger" data-bs-dismiss="modal" onclick="location.href='fishInfoDelete.fi?fno=${f.fishNo}'">예</a>
			        <a type="button" class="btn btn-primary" data-bs-dismiss="modal">아니오</a>
			      </div>
			
			    </div>
			  </div>
			</div>

	<br><br><br><br><br><br>
<jsp:include page="../common/footer.jsp"/>	
</body>
</html>