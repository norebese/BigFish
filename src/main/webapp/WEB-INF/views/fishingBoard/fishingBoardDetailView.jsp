<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
String alertMsg = (String) session.getAttribute("alertMsg");
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

<style>
.header-box {
	display: flex;
	flex-direction: row;
}

.left_box {
	background-color: rgb(52, 152, 219);
	width: 25%;
	height: 286px;
}

.center_box {
	display: flex;
	flex-direction: row;
	background-color: rgb(59, 175, 252);
	width: 100%;
	max-width: 1200px;
	height: 286px;
	justify-content: space-evenly;
	align-items: center;
}

.right_box {
	background-color: rgb(52, 152, 219);
	width: 25%;
	height: 286px;
}

.study-image {
	color: white;
	display: flex;
	justify-content: space-around;
	align-items: flex-start;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="header-box">
		<div class="left_box"></div>
		<div class="center_box">
			<div style="color: white;">
				<h2>조황게시판</h2>
				<br>
				<tr>
					<td>당신의 대물을 자랑하시오!</td>
				</tr>
			</div>
			<div class="study-image" style="color: white;">
				<img style="width: 150px;" src="resources/images/1701241591278.png">
			</div>
		</div>
		<div class="right_box"></div>
	</div>


	<div class="content" align="center">

		<div class="innerOuter" style="padding: 5% 10%; width: 80%;">
			<h2 align="left"
				style="border-bottom: solid 2px rgb(204, 204, 204); padding-bottom: 15px;">조황게시판</h2>
			<br>


			<form method="post" action="delete.fibo"
				enctype="multipart/form-data">
				<table id="contentArea" algin="center" class="table"
					style="border-bottom: solid 2px rgb(204, 204, 204); padding-bottom: 15px;">

					<div style="text-align: left">
						<h5 style="font-size: 26px;"><c:out value='${b.fishingTitle}'/></h5>
						<input type="hidden" value="${b.fishingNo}" name="bno">
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
										style="margin: 0; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${b.fishingWriter}</h6>
								</div>
							</div>

							<div class="col" style="flex-grow: 1;">
								<div
									style="display: flex; align-items: center; justify-content: flex-end;">

									<p style="margin: 0; margin-right: 10px; white-space: nowrap;">조회수:${b.fishingCount}</p>
									<p style="margin: 0; white-space: nowrap;">작성일:${b.fishingCreateDate}</p>
								</div>
							</div>
						</div>
					</div>
					<div
						style="flex: 1; display: flex; margin-top: 20px; justify-content: flex-start;">
						<!-- 이미지를 감싸는 div -->
						<div
							style="width: 100%; height: 400px; margin-bottom: 20px; overflow: hidden; display: flex; justify-content: flex-start;">
							<!-- 실제로는 이미지의 경로를 적어주세요. -->
							<img src="<%=contextPath%>/${b.changeName}" alt="Your Image"
								style="height: 352px;">
						</div>
					</div>


					<tr>
						<td colspan="4">${b.fishingContent}
							</p>
						</td>
					</tr>
				</table>
				<div class="container"
					style="border-bottom: solid 2px rgb(204, 204, 204); padding-bottom: 15px; padding-left: 0px; padding-right: 0px;">

					<div class="row">
						<div class="col-md-8">
							<h6 align="left" style="margin-bottom: 0px; margin-top: 15px;">
								
								<div id="like-logo" onclick="updateLike()"
									style="display: inline-block; margin-right: 15px;">
									<c:choose>
										<c:when test="${Flike.storeGoodStatus eq 'Y'}">
											<img style="height: 19px;"
												src="<%=contextPath%>/resources/images/heart-filled.png">
										</c:when>
										<c:otherwise>
											<img style="height: 19px;"
												src="<%=contextPath%>/resources/images/heart-notfill.png">
										</c:otherwise>
									</c:choose>
								</div>
								<span style="margin-right: 15px;">55</span>
								<span style="margin-right: 15px;">댓글 5</span>
							</h6>
						</div>

						<c:if test="${loginUser.memNick eq b.fishingWriter}">
							<div class="col-6 col-md-4">
								<button type="button" class="btn btn-success"
									style="background-color: rgb(59, 175, 252);"
									onclick="location.href='fishingUpdateForm.bo?bno=${b.fishingNo}'">글수정
								</button>
								<button type="button" class="btn btn-danger"
									data-bs-toggle="modal" data-bs-target="#staticBackdrop">
									글삭제</button>
							</div>
						</c:if>
					</div>
</form>
					<br>

					<div
						style="border-top: solid 2px rgb(204, 204, 204); padding-bottom: 15px;">
						<h6 style="text-align: left; margin-bottom: 10px;">댓글</h6>
						<th colspan="2">
							<div style="display: flex; align-items: center;">
								<textarea class="form-control" id="content" cols="55" rows="2"
									style="resize: none; width: 100%; height: 80px;"></textarea>
								<button type="button" class="btn btn-primary" 
									style="height: 80px; width: 120px; margin-left: 10px; background-color: rgb(59, 175, 252);" onclick="addReply();">댓글등록</button>
							</div>
						</th>
					</div>
				</div>
				<div id="replyAreaa">
				<!-- 댓글파트 -->
				
</div>
				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop"
					data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="staticBackdropLabel">글삭제</h1>
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
			
		</div>
		<jsp:include page="../common/footer.jsp" />
		
		<script>
		$(function(){
		    // 댓글 조회하는 함수 호출
		    selectReplyList();
		});

		function selectReplyList(){
		    $.ajax({
		        url: "rlist.fi",
		        data: {
		            bno: ${b.fishingNo}
		        },
		        success: function(list){
		            let str = "";
		            for (reply of list){
		                str += (
		                    "<div class='row'>" +
		                        "<div class='col-sm' style='display: flex; align-items: center;'>" +
		                            "<i class='bi bi-person' style='font-size: 40px;'></i>" + "<span>" + reply.replyWriter + "</span>" +
		                        "</div>" +
		                        "<div class='col-md-8' style='display: flex; align-items: center;'>" + reply.replyContent + "</div>" +
		                        "<div class='col-sm' style='display: flex; align-items: center;'>" + reply.replyCreateDate + "</div>" +
		                    "</div>"
		                );
		            }

		            //$("#replyArea tbody").html();
		            document.querySelector("#replyAreaa").innerHTML = str;
		            document.querySelector("#rcount").innerHTML = list.length;
		        },
		        error: function(){
		            console.log("ajax통신 실패");
		        }
		    });
		}

	        //댓글 추가
	     function addReply(){
	            $.ajax({
	                url: "rinsert.fi",
	                data: {
	                    rfreeNo: '${b.fishingNo}',
	                    replyWriter: '${loginUser.memNick}',
	                    replyContent: $("#content").val()
	                 
	                },
	                success: function(res){
	                        //성공시 다시 그려주기
	                    if (res === "success") {
	                        selectReplyList();
	                        $("#content").val("");
	                    }
	                },
	                error: function(){
	                    console.log("ajax통신 실패")
	                }
	            })
	        }
		</script>
</body>
</html>