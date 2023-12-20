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
<link rel="stylesheet" href="<%=contextPath%>/resources/css/fishInfo.css?ver=1">
</head>
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
				
				<br>
				
				<!-- Tab panes -->
				<div class="tab-content">
				  <div class="tab-pane container active" id="home">
				  	<c:forEach var="f" items="${list}">
						<div class="name-section">
					  		<img src="resources/images/bungFish.jpg" style="width: 250px; height: 250px;" />
				  			<div class="tag-section">
				  				<p class="fish-name">${f.fishName}</p>
				  				<a class="fish-tag" href="">자세히보기...</a>
				  			</div>
					  	</div>
					</c:forEach>
				  </div>
				
				  <div class="tab-pane container fade" id="menu1">
					바다물고기....
				  </div>
				  
				 </div>
				   
				</div>
			
			<div class="fishInfo-create-btn">
				<button class="btn btn-primary" onclick="location.href='fishInEnroll.fi'">작성하기</button>	
			</div>
			<br><br><br><br><br>
			
		 <div id="pagingArea" class="pagingArea">
	     	<ul class="pagination">
	                
	               	<c:choose>
	               		<c:when test="${ pi.currentPage eq 1 }">
	                   		<li class="page-item disabled"><a class="page-link">이전</a></li>
	                   	</c:when>
	                   	<c:otherwise>
	                   		<li class="page-item"><a class="page-link" href="fishInfo.fi?cpage=${ pi.currentPage - 1 }">Previous</a></li>
	                   	</c:otherwise>
					</c:choose>
	
					<c:forEach var="p" begin="${pi.startPage}" end="${ pi.endPage }" >
	                  		<li class="page-item"><a class="page-link" href="fishInfo.fi?cpage=${ p }">${ p }</a></li>  
	                   </c:forEach>
	                   
	                   <c:choose>
	               		<c:when test="${ pi.currentPage eq pi.maxPage }">
	                   		<li class="page-item disabled"><a class="page-link">다음</a></li>
	                   	</c:when>
	                   	<c:otherwise>
	                   		<li class="page-item"><a class="page-link" href="fishInfo.fi?cpage=${ pi.currentPage + 1 }">Next</a></li>
	                   	</c:otherwise>
					</c:choose>
	                
			</ul>
		</div>
		
		
		<script>
			const init = function(){
					const sea = document.getElementById("menu1");
					sea.onclick = function(){
						$.ajax({
							url:"fishInfo.fi",	
							data: {
								location: document.getElementById('location').value
							},
							success: function(){
								console.log(data);
								drawSea(data);
							},
							error: function(){
								console.log("fishInfo.fi ajax 실패")
							}
						})
					}
			}
			
			const drawSea = function(data){
				const itemArr = data.response.body.items;
				let str = "";
				for(let i in itemArr){
					let item = itemArr[i];
					
					str += '<tr>'
						+  '<td>' + item.mfKorName + '</td>'
						+  '</tr>'
				}
				
				document.querySelector("talbe > tbody").innerHTML = str;
			}
		</script>
	
	<br><br><br><br><br><br>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>