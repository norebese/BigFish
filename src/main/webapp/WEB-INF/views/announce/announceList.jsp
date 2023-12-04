<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
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
	width: 90%;
    margin: 10px 55px;
    font-size: 25px;
   	font-weight: bolder;
}
.ann-title-line{
	border-bottom: 2px solid rgb(204, 204, 204);
	width: 90%;
    margin: 10px auto;	
}
.ann-date{
	width: 90%;
    margin: 10px 55px;
}
li::marker {
  	color: rgb(41, 128, 185);
}
.ann-create{
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

.pagingArea{
	idth: 90%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 60px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br>
	
	<h1 class="announce-ann" style="color:rgb(59, 175, 252)">공지사항</h1>
	<div class="border-line"></div>
	<br><br>
	<c:forEach var="a" items="${list}">	
		<div onclick="location.href='annDetail.an?ano=${a.annNo}'">
		<ul>
			<li class="ann-title">${a.annTitle}</li>
			<p class="ann-date">${a.annCreateDate}</p>
		</ul>
			<div class="ann-title-line"></div>
	</div>
	</c:forEach>
	
	<br>
	
	<c:if test="${ not empty loginUser }">
    	<button class="ann-create" onclick="annEnroll()">작성하기</button>
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
	
	<script>
		function annEnroll() {
			location.href = "annEnroll.an"
		}
	</script>
	
	<br><br><br><br><br><br>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>