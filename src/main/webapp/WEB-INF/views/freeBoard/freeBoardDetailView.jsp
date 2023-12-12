<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%String contextPath = request.getContextPath();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- 부트스트랩 css 사용 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	
	<!-- CSS-->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/freeBoardDetailView.css">


</head>
<body>
	<jsp:include page="../common/header.jsp" />
	 <br><br><br><br><br>
	<div class="header-box">
        <div class="left_box"></div>
        <div class="center_box">
            <div style="color: white;">
            <h2>자유게시판</h2>
            <br>
                <tr>
                    <td>자유롭게 소통을 해보세용~!</td>
                </tr>
            </div>
            <div class="study-image" style="color: white;">              
                <img style="width: 150px;" src="resources/images/1701241590820.png">
            </div>
        </div>
        <div class="right_box"></div>
    </div>

	<div class="content" align="center">
		<br> <br>
		<div class="innerOuter" style="padding: 5% 10%; width: 80%;">
			<h2 align="left"
				style="border-bottom: solid 2px rgb(204, 204, 204); padding-bottom: 15px;">자유게시판</h2>
			<br>



			<table id="contentArea" algin="center" class="table"
				style="border-bottom: solid 2px rgb(204, 204, 204); padding-bottom: 15px;">

				<div style="text-align: left">
					<h5 style="font-size: 26px;">${b.freeTitle}</h5>
				</div>
				<div class="container"
					style="margin-top: 10px; border-bottom: solid 2px rgb(204, 204, 204); padding-bottom: 0px;">
					<div class="row" style="display: flex; align-items: center;">
						<div class="col" style="flex-grow: 1;">
							<div
								style="text-align: left; display: flex; align-items: center;">
								<i class="bi bi-person-circle"
									style="font-size: 40px; margin-right: 10px;"></i>
								<h6
									style="margin: 0; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${b.freeWriter}</h6>
							</div>
						</div>

						<div class="col" style="flex-grow: 1;">
							<div
								style="display: flex; align-items: center; justify-content: flex-end;">
								<p style="margin: 0; margin-right: 10px; white-space: nowrap;">작성일</p>
								<p style="margin: 0; margin-right: 10px; white-space: nowrap;">좋아요:50</p>
								<p style="margin: 0; margin-right: 10px; white-space: nowrap;">조회수:${b.count}</p>
								<p style="margin: 0; white-space: nowrap;">${b.createDate }</p>
							</div>
						</div>
					</div>
				</div>



				<tr>
					<td colspan="4"><p style="height: 10px;">${b.freeContent}</p></td>
				</tr>
			</table>
			<div class="container"
				style="border-bottom: solid 2px rgb(204, 204, 204); padding-bottom: 15px; padding-left: 0px; padding-right: 0px;">

				<div class="row">
					<div class="col-md-8">
						<h6 align="left" style="margin-bottom: 0px; margin-top: 15px;">좋아요:
							55 댓글: 5</h6>
					</div>
						<c:if test="${loginUser.memNick eq b.freeWriter }">
					<div class="col-6 col-md-4">
						<button type="button" class="btn btn-success"
							onclick="location.href='freeUpdateForm.bo?bno=${b.freeNo}'" style=" background-color: rgb(59, 175, 252);">글수정</button>
						<button type="button" class="btn btn-danger"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="margin-left: 20px;">
							글삭제</button>
					</div>
						</c:if>
				</div>

			
				
			


				<br>

				<div
					style="border-top: solid 2px rgb(204, 204, 204); padding-bottom: 15px;">
					<h6 style="text-align: left; margin-bottom: 10px;">댓글</h6>
					<th colspan="2">
						<div style="display: flex; align-items: center;">
							<textarea class="form-control" id="content" cols="55" rows="2"
								style="resize: none; width: 100%; height: 80px;"></textarea>
							<button class="btn btn-primary" onclick="addReply();"
								style="height: 80px; width: 120px; margin-left: 10px;background-color: rgb(59, 175, 252); ">댓글등록</button>
						</div>
					</th>
				</div>
			</div>
			<!-- 댓글파트 -->
			<div class="container"
				style="border-bottom: solid 2px rgb(204, 204, 204);">
				<div class="row">
					<div class="col-sm" style="display: flex; align-items: center;">
						<i class="bi bi-person" style="font-size: 40px;"></i> <span>임영웅</span>
					</div>
					<div class="col-md-8" style="display: flex; align-items: center;">네
						아마 안될거 같네요.</div>
					<div class="col-sm" style="display: flex; align-items: center;">2023/11/19</div>
				</div>
			</div>
			<div class="container"
				style="border-bottom: solid 2px rgb(204, 204, 204);">
				<div class="row">
					<div class="col-sm" style="display: flex; align-items: center;">
						<i class="bi bi-person" style="font-size: 40px;"></i> <span>임영웅</span>
					</div>
					<div class="col-md-8" style="display: flex; align-items: center;">네
						아마 안될거 같네요.</div>
					<div class="col-sm" style="display: flex; align-items: center;">2023/11/19</div>
				</div>
			</div>

			<div class="container"
				style="border-bottom: solid 2px rgb(204, 204, 204);">
				<div class="row">
					<div class="col-sm" style="display: flex; align-items: center;">
						<i class="bi bi-person" style="font-size: 40px;"></i> <span>임영웅</span>
					</div>
					<div class="col-md-8" style="display: flex; align-items: center;">네
						아마 안될거 같네요.</div>
					<div class="col-sm" style="display: flex; align-items: center;">2023/11/19</div>
				</div>
			</div>

			<!-- Modal -->
			<form method="post" action="delete.fbo" enctype="multipart/form-data">
				<input type="hidden" value="${b.freeNo}" name="bno">
				<div class="modal fade" id="staticBackdrop"
					data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="staticBackdropLabel" >글삭제</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">글을 삭제하실려면 아래 글삭제를 눌러주세요.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
								<button type="submit" class="btn btn-danger">글삭제</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			</div>
			  <jsp:include page="../common/footer.jsp"/>
</body>
</html>