<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
.announce-ann{
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
.ann-title{
    margin: 0px 80px;
    font-size: 25px;
   	font-weight: bolder;
   	border: none;
   	display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
}
.ann-date{
	width: 90%;
    margin: 10px 80px;
}
.ann-title-line{
	border-bottom: 2px solid rgb(204, 204, 204);
	width: 90%;
    margin: 10px auto;	
}
.ann-content{
	margin: 0px 80px;
    border: none;
}
.ann-form{
	display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-direction: column;
}
.btn-area{
	width: 40%;
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    margin: 10px auto;
}
.btn-area > button, a {
	width: 130px;
	height: 40px;
}
</style>
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
			<div class="btn-area">
				<a class="btn btn-primary" onClick="annList()">목록으로</a>
				<a class="btn btn-primary" onclick="location.href='annUpdateForm.an?ano=${a.annNo}'">수정하기</a>
				<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#myModal">삭제하기</button>
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
			        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">아니오</button>
			      </div>
			
			    </div>
			  </div>
			</div>
	
	<script>
		function annList(){
			location.href="annList.an";
		}
	</script>
	
	<br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>