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
<link rel="stylesheet" href="<%=contextPath%>/resources/css/fishInfoSea.css?ver=1">
<style>
.fish-type-btn{
	width: 90%;
    display: flex;
    justify-content: center;
    align-items: center;
}
.fish-type-btn > button {
	border: none;
    background-color: white;
    width: 150px;
    font-size: 30px;
    font-weight: bolder;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br><br>
	
		<h1 class="fishInfo-title">어종 백과사전</h1>
		<div class="border-line"></div>
		
		
		<br>	
		<div class="fish-type-btn">
			<button onclick="location.href='fishInfo.fi'">민물</button>
			<button onclick="location.href='fishInfoSea.fi'">바다</button>
		</div>
		
		<div class="border-line"></div>
			<div class="fishInfo-area">				
			<br>
				<div class="fresh-fish-area">
					<div class="tab-content">
					  <div class="tab-pane container active" id="home">
						<c:forEach var="f" items="${list}">  
					        <div class="name-section">
						   		<img src="<%=contextPath%>${f.fishTitleImage}" style="width: 150px; height:150px;" />
					            <div class="tag-section">
					                <p class="fish-name">${f.fishName}</p>
					                <a class="fish-tag" href="fishInfoDetail.fi?fno=${f.fishNo}">자세히보기...</a>
					            </div>
					        </div>
						</c:forEach>
					  </div>
					</div>
				 </div>
			</div>
							
		<c:if test="${  not empty loginUser and loginUser.memAdmin eq 'Y'}">
			<div class="fishInfo-create-btn">
				<button class="btn btn-primary" onclick="location.href='fishInEnroll.fi'">작성하기</button>	
			</div>
		</c:if>
			<br>
			
		 <div id="pagingArea" class="pagingArea">
     		<ul class="pagination">
                
               	<c:choose>
               		<c:when test="${ pi.currentPage eq 1 }">
                   		<li class="page-item disabled"><a class="page-link">이전</a></li>
                   	</c:when>
                   	<c:otherwise>
                   		<li class="page-item"><a class="page-link" href="fishInfoSea.fi?cpage=${ pi.currentPage - 1 }">이전</a></li>
                   	</c:otherwise>
				</c:choose>

				<c:forEach var="p" begin="${pi.startPage}" end="${ pi.endPage }" >
                  		<li class="page-item"><a class="page-link" href="fishInfoSea.fi?cpage=${ p }">${ p }</a></li>  
                   </c:forEach>
                   
                   <c:choose>
               		<c:when test="${ pi.currentPage eq pi.maxPage }">
                   		<li class="page-item disabled"><a class="page-link">다음</a></li>
                   	</c:when>
                   	<c:otherwise>
                   		<li class="page-item"><a class="page-link" href="fishInfoSea.fi?cpage=${ pi.currentPage + 1 }">다음</a></li>
                   	</c:otherwise>
				</c:choose>
                
			</ul>
		</div>
		
	
	<br><br><br><br><br><br>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>