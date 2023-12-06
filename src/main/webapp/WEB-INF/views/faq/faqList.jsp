<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
</head>
<style>
.faq-fa{
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
.faq-area{
	display: flex;
    align-items: flex-start;
    flex-direction: column;
    justify-content: center;
    margin: 10px;
    margin-left: 70px;
}
.faq-create{
	background-color: rgb(59, 175, 252);
	color: white;
	border-radius: 3px;
    border: none;
    width: 85px;
    height: 35px;
    position: absolute;
    margin-left: 1350px;
    margin-bottom: 100px;
}
.faq-title-line{
	border-bottom: 2px solid rgb(204, 204, 204);
	width: 90%;
    margin: 10px 10px;	
}
.faq-date{
    margin-left: 7px;
}
li::marker {
  	color: rgb(41, 128, 185);
}
.faq-btn{
	border:none;
	font-size: 25px;
    background-color: white;
    font-weight: bolder;
}
.faq-title{
	 margin-left: 7px;
}
.enroll-btn{
	background-color: rgb(59, 175, 252);
	color: white;
	border-radius: 3px;
    border: none;
	margin-left: 1200px;
}
.delete-btn{
	margin-left: 12900px;
}
</style>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br>
	
	<h1 class="faq-fa" style="color:rgb(59, 175, 252)">FAQ</h1>
	<div class="border-line"></div>
	<br><br>
	<c:forEach var="f" items="${list}">	
		<div class="faq-area">
		
			<button class="faq-btn" data-bs-toggle="collapse" data-bs-target="#faq${f.faqNo}">${f.faqTitle}</button>
			<p class="faq-date">${f.faqCreateDate}</p>
			<div class="faq-title-line"></div>
		
			
				<div id="faq${f.faqNo}" class="collapse">
					<ul>
						<li class="faq-title">${f.faqContent}</li>
					</ul>
					<c:if test="${ not empty loginUser and loginUser.memAdmin eq 'Y'}">
						<button class="btn btn-primary enroll-btn" onclick="location.href='faqEnrollForm.fa?fno=${f.faqNo}'">수정하기</button>		
						<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#myModal">삭제하기</button>		
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
	<div class="border-line"></div>
	
	<br>
	
	<c:if test="${ not empty loginUser }">
	<button class="btn btn-primary faq-create" onclick="location.href='faqInsertForm.an'">작성하기</button>
	</c:if>
	
	<br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>	
</body>
</html>