<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BIG FISH</title>
<!-- 부트스트랩 css 사용 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="<%=contextPath%>/resources/js/service/store-api.js"></script>
	
<!-- CSS-->
<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/freeBoardUpdateForm.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/main.css">
<script src="<%=contextPath%>/resources/js/main.js"></script>
</head>

<body>
	<jsp:include page="common/header.jsp" />
	<br>

	
	<div class="header-box">
		<div class="left_box"></div>
		<div class="centerbox">
			<div style="color: white;">
				<h2>BIGFISH</h2>
				<br>
				<c:choose>
					<c:when test="${not empty loginUser }">
						${loginUser.memNick}님 환영합니다.	
					</c:when>
					<c:otherwise>
						로그인 후 이용 바랍니다.
					</c:otherwise>
				</c:choose>
				<br>
				<td>BIGFISH에서 많은 서비스를 이용해보세요!</td>
			</div>
			<div class="study-image" style="color: white;">
				<img style="width: 150px;" src="resources/images/mainfish.png">
			</div>
		</div>
		<div class="right_box"></div>
	</div>

	</div>
	<div class="container">
		<div class="recentStore">
			<ul>
				<li>최근 본 가게</li>
				<li>
					<div class="recent_list">
						
					</div>
				</li>
			</ul>
		</div>

		<div class="main">
			<div class="container-fluid h-100">
				<div class="row h-50">
					<a href="seaReservation" class="col h-100"
						style="text-decoration: none; color: black;"> <img
						src="<%=contextPath%>/resources/images/1701241622228.png"
						alt="Your Image">
						<p style="font-size: large; font-weight: 700;">바다 낚시</p>
					</a> <a href="fishReservation" class="col h-100"
						style="text-decoration: none; color: black;"> <img
						src="<%=contextPath%>/resources/images/1701241622051.png"
						alt="Your Image">
						<p style="font-size: large; font-weight: 700;">민물 낚시</p>
					</a> <a href="list.sh" class="col h-100"
						style="text-decoration: none; color: black;"> <img
						src="<%=contextPath%>/resources/images/1701241622193.png"
						alt="Your Image">
						<p style="font-size: large; font-weight: 700;">낚시 용품</p>
					</a> <a href="fishInfo.fi" class="col h-100"
						style="text-decoration: none; color: black;"> <img
						src="<%=contextPath%>/resources/images/1701241621969.png"
						alt="Your Image">
						<p style="font-size: large; font-weight: 700;">어종</p>
					</a>
				</div>
				<div class="row h-50">

					<a href="list.fbo" class="col h-100"
						style="text-decoration: none; color: black;"> <img
						src="<%=contextPath%>/resources/images/1701241621814.png"
						alt="Your Image">
						<p style="font-size: large; font-weight: 700;">자유게시판</p>
					</a> <a href="list.fibo" class="col h-100"
						style="text-decoration: none; color: black;"> <img
						src="<%=contextPath%>/resources/images/1701241622143.png"
						alt="Your Image">
						<p style="font-size: large; font-weight: 700;">조황게시판</p>
					</a> <a href="list.st" class="col h-100"
						style="text-decoration: none; color: black;"> <img
						src="<%=contextPath%>/resources/images/1701241621923.png"
						alt="Your Image">
						<p style="font-size: large; font-weight: 700;">학습동영상</p>
					</a> <a href="gofisingTeacher" class="col h-100"
						style="text-decoration: none; color: black;"> <img
						src="<%=contextPath%>/resources/images/fishingTeacher.png"
						alt="Your Image">
						<p style="font-size: large; font-weight: 700;">낚시 빅선생</p>
					</a>
					
				</div>
			</div>
		</div>

		<div class="banner">
			<img src="<%=contextPath%>/resources/images/banner1.png"
				alt="Your Image">
		</div>
	</div>
	<br>
	<br>

	<div class="container">
		<div class="banner"></div>
		<div class="sub">
			<div
				style="flex: 1; align-self: flex-start; color: rgb(41, 90, 221);">
				<h4>학습 동영상</h4>
			</div>
			<div class="container text-center1" style="flex: 4; overflow: hidden;">
				<div class="d-flex justify-content-between">
					<div class="row" id="studyList">
						
					</div>
				</div>
			</div>
			<div style="flex: 1; align-self: flex-end; color: rgb(41, 90, 221);">
				<a href="list.st">학습 동영상 모두보기 <i class="bi bi-arrow-right"></i></a>
			</div>
		</div>
		<div class="banner"></div>
	</div>
	<br>
	<div class="container">
		<div class="banner"></div>
		<div class="sub">
			<div
				style="flex: 1; align-self: flex-start; color: rgb(41, 90, 221);">
				<h4>조황게시판</h4>
			</div>
			<div class="container text-center1" style="flex: 4; overflow: hidden;">
				<div class="d-flex justify-content-between">
					<div class="row" id="fishBoardList" >
						
					</div>
				</div>
			</div>
			<div style="flex: 1; align-self: flex-end; color: rgb(41, 90, 221);">
				<a href="list.fibo">조황게시판 모두보기 <i class="bi bi-arrow-right"></i></a>
			</div>
		</div>

		<div class="banner"></div>
	</div>

	<br>
	<div class="container">

		<div class="banner"></div>

		<div class="sub">
			<div
				style="flex: 1; align-self: flex-start; color: rgb(41, 90, 221);">
				<h4>자유게시판</h4>
			</div>
			<div class="container text-center" style="flex: 4; overflow: hidden;">
					<div class="d-flex justify-content-between">
					<div class="row" id="freeBoardList" >
						
					</div>
				</div>
			</div>
			<div style="flex: 1; align-self: flex-end; color: rgb(41, 90, 221);">

				<a href="list.fbo">자유게시판 모두보기 <i class="bi bi-arrow-right"></i></a>
			</div>
		</div>

		<div class="banner"></div>
		
		<script>
		$(function(){
			topBoardList();
			
		})
		
		function topBoardList(){
			$.ajax({
				url: "mainList.fibo",
				success: function(data){
					console.log(data)
					 drawBoardRow(data)
				},
				error: function(){
					console.log("ajax 실패")
				}
			})
		}
		
		function drawBoardRow(data) {
			console.log(data)
		    for (let rowData of data) {
		        // 각각의 게시물을 추가하는 부분입니다.
		        document.getElementById("fishBoardList").innerHTML +=
		        	'<a href="detail.fibo?bno='+rowData.fishingNo+'" class="col-4" style="text-decoration: none; color: black;">'+
						'<div style="height: 80%;">'+
							'<img src="<%=contextPath%>'+ rowData.changeName + 
								'"alt="Your Image" style="width: 239px; height: 175.8px; object-fit: contain; cursor: pointer;">' +
						'</div>'+
						<!-- p태그 부분: 높이의 20% -->
						'<div style="height: 20%;">'+
							'<p>'+rowData.fishingTitle+'</p>'+
						'</div>'+
					'</a>'		
		    }
		}

		$(function(){
			studyBoardList();
			freeBoardList();
		})

		function studyBoardList(){
			$.ajax({
				url: "mainList.st",
				success: function(data){
					console.log(data)
					drawStudyRow(data)
				},
				error: function(){
					console.log("ajax 실패")
				}
			})
		}	
		
		function freeBoardList(){
			$.ajax({
				url: "mainList.fbo",
				success: function(freedata){
					console.log(freedata)
					 drawFreeBoardRow(freedata)

				},
				error: function(){
					console.log("ajax 실패")
				}
			})
		}


		function drawStudyRow(data) {
			console.log(data)
			for (let rowData of data) {
				// 각각의 게시물을 추가하는 부분입니다.
				document.getElementById("studyList").innerHTML +=
					'<a href="detail.st?sno='+rowData.studyNo+'" class="col-4" style="text-decoration: none; color: black; margin-left: -6%">'+
							 rowData.studyLink + 
						'</div>'+
						<!-- p태그 부분: 높이의 20% -->
						'<div style="height: 20%;">'+
							'<p style="margin-left:38%">'+rowData.studyTitle+'</p>'+
						'</div>'+
					'</a>'		
					console.log(data)
			}
		}
		
		function drawFreeBoardRow(freedata) {
			
		    for (let rowData of freedata) {
		        // 각각의 게시물을 추가하는 부분입니다.
		        document.getElementById("freeBoardList").innerHTML +=
		        	'<a href="detail.fbo?bno='+rowData.freeNo+'" class="col-4" style="text-decoration: none; color: black;">'+
						'<div style="height: 80%;">'+
							'<img src="'+ rowData.freeContent + 
								'"alt="Your Image" style="width: 239px; height: 175.8px; object-fit: contain; cursor: pointer;">' +
						'</div>'+
						<!-- p태그 부분: 높이의 20% -->
						'<div style="height: 20%;">'+
							'<p>'+rowData.freeTitle+'</p>'+
						'</div>'+
					'</a>'
						
		    }

		}
	</script>


	</div>
	<jsp:include page="common/footer.jsp" />
</body>
</html>
