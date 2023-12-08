<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>

.header-box{
		margin-top: 70px;
        display: flex;
        flex-direction: row;
    }
    
    .left_box{
        background-color: rgb(52, 152, 219);  
        width: 25%; 
        height: 286px;
    }
    
    .centerbox{
        display: flex;
        flex-direction: row;
        background-color: rgb(59, 175, 252); 
        width: 100%; 
        max-width: 1200px;
        height: 286px;
        justify-content: space-evenly;
        align-items: center;
        
    }
    
    .right_box{
        background-color: rgb(52, 152, 219); 
        width: 25%; 
        height: 286px;
    }
.container {
	display: flex;
  justify-content: space-between;
  width: 100%;
  box-sizing: border-box; /* 추가: border와 padding이 width에 포함되도록 설정 */

  /* 중앙 정렬을 위한 부분을 flex로 대체 */
  align-items: center;
}

.main {
	box-sizing: border-box;
	background-color: #eee;
	color: #000000;
	text-align: center;
	width: 792px;
	max-width: 792px;
	height: 380px;
	flex-shrink: 0; /* 이 부분을 추가하여 축소되지 않도록 설정 */
	margin: auto; /* 가운데 정렬을 위해 추가 */
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 20px;
}

.sub {
	box-sizing: border-box;
	background-color: #ffffff;
	color: #000000;
	text-align: center;
	width: 792px;
	max-width: 792px;
	height: 300px;
	flex-shrink: 0; /* 이 부분을 추가하여 축소되지 않도록 설정 */
	margin: auto; /* 가운데 정렬을 위해 추가 */
	display: flex;
	align-items: center;
	justify-content: center;
	display: flex;
	flex-direction: column;
}

.banner {
	width: 200px;
}

.banner {
	box-sizing: border-box;
	background-color: #ffffff;
	color: #fff;
	text-align: center;
	display: flex;
	align-items: center; /* 세로 방향 가운데 정렬을 추가합니다. */
	justify-content: center; /* 가로 방향 가운데 정렬을 추가합니다. */
}

.banner img {
	display: block;
	max-width: 100%;
	max-height: 100%;
}

.main img {
	display: block;
	max-width: 50%;
	max-height: 60%;
	margin: auto; /* 이미지를 가운데 정렬하기 위해 추가 */
	margin-top: 30px;
}
.center_box{
        display: flex;
        flex-direction: row;
        background-color: rgb(59, 175, 252); 
        width: 100%; 
        max-width: 1200px;
        height: 286px;
        justify-content: space-evenly;
        align-items: center;
        
    }

.sub>div {
	flex: 1;
}

@media screen and (max-width: 1200px) {
	.banner:nth-child(1), .banner:nth-child(3) {
		width: 0;
		display: none;
	}
	.main {
		width: 100%;
	}
}
</style>
<title>BIG FISH</title>
<!-- 부트스트랩 css 사용 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<!-- CSS-->
<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/freeBoardUpdateForm.css">
</head>

<body>
    <jsp:include page="common/header.jsp"/>
<br>


<div class="header-box">
	<div class="left_box"></div>
	<div class="centerbox">
		<div style="color: white;">
		<h2>학습동영상</h2>
		<br>
			<tr>
				<td>낚시에 대한 새로운 지식을 배워보세요!</td>
			</tr>
		</div>
		<div class="study-image" style="color: white;">              
			<img style="width: 150px;" src="resources/images/study.png">
		</div>
	</div>
	<div class="right_box"></div>
</div>
	
</div>
	<div class="container">
		<div class="banner">
			<img src="<%=contextPath%>/resources/images/banner.png"
				alt="Your Image">
		</div>

		<div class="main">
			<div class="container-fluid h-100">
				<div class="row h-50">
					<div class="col h-100">
						<img src="<%=contextPath%>/resources/images/1701241622228.png"
							alt="Your Image">
						<p style="font-size: large; font-weight: 700;">바다 낚시</p>
					</div>
					<div class="col h-100">
						<img src="<%=contextPath%>/resources/images/1701241622051.png"
							alt="Your Image">
						<p style="font-size: large; font-weight: 700;">민물 낚시</p>
					</div>
					<div class="col h-100">
						<img src="<%=contextPath%>/resources/images/1701241622193.png"
							alt="Your Image">
						<p style="font-size: large; font-weight: 700;">낚시 용품</p>
					</div>
					<div class="col h-100">
						<img src="<%=contextPath%>/resources/images/1701241621969.png"
							alt="Your Image">
						<p style="font-size: large; font-weight: 700;">어종</p>
					</div>
				</div>
				<div class="row h-50">
					<a href="list.fbo" class="col h-100">
						<img src="<%=contextPath%>/resources/images/1701241621814.png"
							alt="Your Image">
						<p style="font-size: large; font-weight: 700;">자유게시판</p>
					</a>
					<a href="list.fibo" class="col h-100">
						<img src="<%=contextPath%>/resources/images/1701241622143.png"
							alt="Your Image">
						<p style="font-size: large; font-weight: 700;">조황게시판</p>
					</a>
					<div class="col h-100">
						<img src="<%=contextPath%>/resources/images/1701241621845.png"
							alt="Your Image">
						<p style="font-size: large; font-weight: 700;">예약</p>
					</div>
					<div class="col h-100" style="cursor: pointer;">
						<img onclick="location.href='list.st'" src="<%=contextPath%>/resources/images/1701241621923.png"
							alt="Your Image" >
						<p style="font-size: large; font-weight: 700;">학습동영상</p>
					</div>
				</div>
			</div>
		</div>

		<div class="banner">
			<img src="<%=contextPath%>/resources/images/banner1.png"
				alt="Your Image">
		</div>
	</div>
	<br><br>

	<div class="container">
		<div class="banner"></div>
		<div class="sub">
			<div style="flex: 1; align-self: flex-start; color: rgb(41, 90, 221);">
				<h4>학습 동영상</h4>
			</div>
			<div class="container text-center" >
				<div>
					<a href="detail.st?sno=100"><img src="<%=contextPath%>/resources/images/fishingTip.png" style="margin-right: 20px; max-width: calc(33.33% - 20px);"></a> 
					<a href="detail.st?sno=101"><img src="<%=contextPath%>/resources/images/fishingPrepare.png" style="margin-right: 20px; max-width: calc(33.33% - 20px);"></a>
					<a href="detail.st?sno=108"><img src="<%=contextPath%>/resources/images/fishingJJi.png" style="max-width: calc(33.33% - 20px);"></a>
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
			<div style="flex: 1; align-self: flex-start; color: rgb(41, 90, 221);">
				<h4>자유게시판</h4>
			</div>
			<div class="container text-center" style="flex: 4; overflow: hidden;">
				<div class="d-flex justify-content-between">
					<img src="<%=contextPath%>/resources/images/fishing.jpg" alt="Your Image" style="margin-right: 20px; max-width: calc(33.33% - 20px);">
					<img src="<%=contextPath%>/resources/images/fishing.jpg" alt="Your Image" style="margin-right: 20px; max-width: calc(33.33% - 20px);">
					<img src="<%=contextPath%>/resources/images/fishing.jpg" alt="Your Image" style="max-width: calc(33.33% - 20px);">
				</div>
			</div>
			<div style="flex: 1; align-self: flex-end; color: rgb(41, 90, 221);">
				<a href="">자유게시판 모두보기 <i class="bi bi-arrow-right"></i></a>
			</div>
		</div>

		<div class="banner"></div>


	</div>

	<br>
	<div class="container">

		<div class="banner"></div>

		<div class="sub">
			<div style="flex: 1; align-self: flex-start; color: rgb(41, 90, 221);">
				<h4>민물 실시간 조황</h4>
			</div>
			<div class="container text-center" style="flex: 4; overflow: hidden;">
				<div class="d-flex justify-content-between">
					<img src="<%=contextPath%>/resources/images/fishing.jpg" alt="Your Image" style="margin-right: 20px; max-width: calc(33.33% - 20px);">
					<img src="<%=contextPath%>/resources/images/fishing.jpg" alt="Your Image" style="margin-right: 20px; max-width: calc(33.33% - 20px);">
					<img src="<%=contextPath%>/resources/images/fishing.jpg" alt="Your Image" style="max-width: calc(33.33% - 20px);">
				</div>
			</div>
			<div style="flex: 1; align-self: flex-end; color: rgb(41, 90, 221);">
				<a href="">민물 실시간 조황 모두보기 <i class="bi bi-arrow-right"></i></a>
			</div>
		</div>

		<div class="banner"></div>


	</div>
<jsp:include page="common/footer.jsp"/>
</body>
</html>
