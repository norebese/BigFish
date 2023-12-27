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
<link rel="stylesheet" href="<%=contextPath%>/resources/css/faqList.css">

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br>
	
	<h1 class="faq-fa" style="color:rgb(59, 175, 252)">FAQ</h1>
	<div class="border-line"></div>
	<br><br>
	<c:forEach var="f" items="${list}">	
	<div class="faq-area">
		<div class="collapse-area">
			<ul>
				<li class="faq-btn" style="cursor:pointer;">${f.faqTitle}</li>
			</ul>
			<img class="downarrow" src="resources/images/downarrow.png" style="cursor:pointer;" data-bs-toggle="collapse" data-bs-target="#faq${f.faqNo}">
		</div>
		<p class="faq-date">${f.faqCreateDate}</p>
		<div class="faq-title-line"></div>

		<div id="faq${f.faqNo}" class="collapse">
		
			<div class="faq-content">${f.faqContent}</div>
			
			<br><br>
			
			<c:if test="${ not empty loginUser and loginUser.memAdmin eq 'Y'}">
				<div class="faq-btn-area">
					<button class="btn btn-primary" onclick="location.href='faqEnrollForm.fa?fno=${f.faqNo}'">수정하기</button>		
					<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#myModal">삭제하기</button>		
				</div>
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
						<button type="button" class="btn btn-danger" onclick="location.href='faqDelete.fa?fno=${f.faqNo}'">예</button>
						<button type="button" class="btn btn-primary" data-bs-dismiss="modal">아니오</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<br><br>
	
	<br>
	
	<c:if test="${ not empty loginUser }">
		<div class="faq-create-btn">
			<button class="btn btn-primary" onclick="location.href='faqInsertForm.an'">작성하기</button>
		</div>
	</c:if>
	
	<br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>	
</body>
</html>