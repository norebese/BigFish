<%@page import="com.kh.bigFish.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BIGFISH</title>
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
	href="<%=contextPath%>/resources/css/freeBoardDetailView.css">
<style>
#rerere{
	
	margin-left: 5px;
	 text-align: right;
	 color: #ff0000;
	 cursor: pointer;
}
.replyImg{
    display: flex;
    height: 60px;
    flex-wrap: wrap;
    align-content: center;
}
.replyImg img{
    height: 35px;
    width: 35px;
    margin-right: 10px;
}
 #footer {
        width:100%;
        margin:auto;
        margin-top:50px;
        margin-bottom: 0px;
        background-color: rgb(59, 175, 252);
        text-align: left;
    }
</style>
</head>
<body>
<script>
  const loginUserNick = "${loginUser.memNick}";
</script>
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
				<h2>자유게시판</h2>
				<br>
				<tr>
					<td>환영합니다! 여기는 자유게시판입니다. 다양한 주제로 자유롭게 이야기 나누어 보세요.</td>
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
					<h5 style="font-size: 26px;"><c:out value='${b.freeTitle}'/></h5>
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
								
								<p style="margin: 0; margin-right: 10px; white-space: nowrap;">조회수:${b.count}</p>
								<p style="margin: 0; margin-right: 10px; white-space: nowrap;">작성일:${b.createDate }</p>
								
								<p style="margin: 0; white-space: nowrap;"></p>
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
						<h6 align="left" style="margin-bottom: 0px; margin-top: 15px;">

							<div id="like-logo" onclick="updateLike()"
								style="display: inline-block; margin-right: 15px; cursor: pointer;">
								<c:choose>
									<c:when test="${freeGoodStatus.freeGoodStatus eq 'Y'}">
										<img style="height: 19px;"
											src="<%=contextPath%>/resources/images/heart-filled.png">

									</c:when>
									<c:otherwise>
										<img style="height: 19px;"
											src="<%=contextPath%>/resources/images/heart-notfill.png">
									</c:otherwise>
								</c:choose>
							</div>
							<span id="whgdkdy" style="margin-right: 15px;">${likeNo}</span> <span
								style="border: rgb(59, 175, 252); margin-right: 15px;">댓글 </span>
						</h6>
					</div>
					<c:if test="${loginUser.memNick eq b.freeWriter }">
						<div class="col-6 col-md-4">
							<button type="button" class="btn btn-success"
								onclick="location.href='freeUpdateForm.bo?bno=${b.freeNo}'"
								style="border: rgb(59, 175, 252);background-color: rgb(59, 175, 252);">글수정</button>
							<button type="button" class="btn btn-danger"
								data-bs-toggle="modal" data-bs-target="#staticBackdrop"
								style="margin-left: 20px;">글삭제</button>
						</div>
					</c:if>
				</div>






				<br>

				<!-- 	<div class="reply-area">
            <div class="reply-line">
                <h6 id="replyNum" style="text-align: left; margin-bottom: 10px;">댓글 (${replyCount})</h6>
            </div>
            
            <div id="showReplyArea">
            	<c:forEach var="rl" items="${replyList}" varStatus="loopStatus">
		            <div class="" style="border-bottom: solid 2px rgb(204,204,204); ">
		                <div class="row">
		                    <div class="col-sm" style="display: flex; align-items: center;">
		                        <i class="bi bi-person" style="font-size: 40px;"></i>
		                        <span >${rl.replyWriter}</span>
		                    </div>
		                    <div class="col-md-8" style="display: flex; align-items: center;">${rl.replyContent}</div>
		                    <div class="col-sm" style="display: flex; align-items: center;">${rl.replyCreateDate}
			                    <c:if test="${rl.rmemNo eq loginUser.memNo}">
			                    <span id="dltBtn" onclick="dltReply('${rl.replyNo}')">삭제</span>
			                    </c:if>
		                    </div>
		                </div>
		            </div>
	            </c:forEach>    
            </div>
            
            <div>
		    	<nav aria-label="Page navigation example"  class="d-flex justify-content-center" style="margin-top: 20px;">
			        <ul class="pagination">
           				<li id="prevBtn" class="page-item" onclick="pageReply('prev')" style="display: none;">
			            	<a class="page-link" href="#" aria-label="Previous">
			              		<span aria-hidden="true">&laquo;</span>
			            	</a>
	            		</li>
	            		<ul id="pageNBtn" class="pagination">
					       <c:forEach var="p" begin="${replyPi.startPage}" end="${replyPi.endPage}">
						        <c:set var="activeClass" value="${p == replyPi.currentPage ? 'active' : ''}" />
						        <li class="page-item ${activeClass}">
						            <a class="page-link" href="#" onclick="pageReply(${p})">${p}</a>
						        </li>
						    </c:forEach>
				       </ul>
				       <c:choose>
				       <c:when test="${replyPi.maxPage eq 1 or replyPi.maxPage eq 0}">
				          <li id="nextBtn" class="page-item" onclick="pageReply('next')" style="display: none;">
					            <a class="page-link" href="#" aria-label="Next">
					              <span aria-hidden="true">&raquo;</span>
					            </a>
				          </li>
			          </c:when>
			          <c:otherwise>
			          		<li id="nextBtn" class="page-item" onclick="pageReply('next')">
					            <a class="page-link" href="#" aria-label="Next">
					              <span aria-hidden="true">&raquo;</span>
					            </a>
				          </li>
			          </c:otherwise>
			          </c:choose>
			        </ul>
			      </nav>
            </div>
             -->


				<div
					style="border-top: solid 2px rgb(204, 204, 204); padding-bottom: 15px;">
					<h6 style="text-align: left; margin-bottom: 10px;">댓글</h6>
					<th colspan="2">
						<div style="display: flex; align-items: center;">
							<textarea class="form-control" id="content" cols="55" rows="2"
								style="resize: none; width: 100%; height: 80px;"></textarea>
							<button type="button" class="btn btn-primary" 
        style="border: rgb(59, 175, 252); height: 80px; width: 120px; margin-left: 10px; background-color: rgb(59, 175, 252);" 
        onclick="${loginUser != null ? 'addReply();' : 'return false;'}">
    댓글등록
</button>
						</div>
					</th>
				</div>
			</div>
			<div id="replyAreaa">
				<!-- 댓글파트 -->

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
			</form>
		</div>
		<jsp:include page="../common/footer.jsp" />

		<script>
		 let memNum = <%= (loginUser != null) ? loginUser.getMemNo() : 0%>;
		    function dltReply(rNum){
		    	$.ajax({
			           type: "GET",
			           url: "ajaxDltFreeReply",
			           data: { 
			        	   rNum: rNum,
			        	   freeNo :${b.freeNo}
			           },
			           dataType: 'json',
			           success: function(data) {
			        	 alert('댓글이 삭제되었습니다.');
			        	 updateReplyList(data.replyList, memNum);
			        	 document.getElementById('content').value = '';
			        	 let startPage = (data.replyPi.startPage);
			        	 let endPage = (data.replyPi.endPage);
			        	 let maxPage = (data.replyPi.maxPage);
			        	 let currentPage = (data.replyPi.currentPage);
			        	 updatePageBtn(startPage, endPage, currentPage);
			        	 updateReplyBtn(endPage, maxPage, currentPage);
			        	 document.getElementById('replyNum').innerHTML = '댓글 ('+(data.rNum)+')';
			           },
			           error: function() {
			           	console.log("ajax 통신 실패");
			           }
			       });
		    }
		    
		    let rPage = 1;
		    function pageReply(num){
		    	let scrollTop = $(window).scrollTop();
		    	if(num === 'prev'){
		    		rPage--;
		    		if(rPage<=0){
		    			rPage = 1;
		    		}
		    	}else if(num === 'next'){
		    		rPage++;
		    	}else{
		    		rPage = num;
		    	}
		    	
				$.ajax({
			           type: "GET",
			           url: "ajaxPageReply", 
			           data: { 
			        	   rPage: rPage,
			           },
			           dataType: 'json',
			           success: function(data) {
			        	 updateReplyList(data.replyList, memNum);
			        	 let startPage = (data.replyPi.startPage);
			        	 let endPage = (data.replyPi.endPage);
			        	 let maxPage = (data.replyPi.maxPage);
			        	 let currentPage = (data.replyPi.currentPage);
			        	 updatePageBtn(startPage, endPage, currentPage);
			        	 updateReplyBtn(endPage, maxPage, currentPage);
			        	 
		         		$(window).scrollTop(scrollTop);
			           },
			           error: function() {
			           	console.log("ajax 통신 실패");
			           }
			       });
		    }
		
			  function addReply1(){
			    	let contentValue = document.getElementById('content').value;
					$.ajax({
				           type: "GET",
				           url: "ajaxAddFreeReply",
				           data: { 
				        	 contentValue: contentValue,
				        	 freeNo :${b.freeNo}
				           },
				           dataType: 'json',
				           success: function(data) {
				        	 updateReplyList(data.replyList, memNum);
				        	 document.getElementById('content').value = '';
				        	 let startPage = (data.replyPi.startPage);
				        	 let endPage = (data.replyPi.endPage);
				        	 let maxPage = (data.replyPi.maxPage);
				        	 let currentPage = (data.replyPi.currentPage);
				        	 updatePageBtn(startPage, endPage, currentPage);
				        	 updateReplyBtn(endPage, maxPage, currentPage);
				        	 document.getElementById('replyNum').innerHTML = '댓글 ('+(data.rNum)+')';
				           },
				           error: function() {
				           	console.log("ajax 통신 실패");
				           }
				       });
					   console.log("Session Data:", sessionStorage);
			    }
			  
			  
			  function updateReplyList(date, memNum){
					let divToUpdate = $('#showReplyArea');
					let htmlContent = '';
					
					$.each(date, function (index, reply) {
				                htmlContent += '<div class="" style="border-bottom: solid 2px rgb(204,204,204);">'
					            +'<div class="row"><div class="col-sm" style="display: flex; align-items: center;">'
					            +'<i class="bi bi-person" style="font-size: 40px;"></i><span >'+reply.replyWriter+'</span></div>'
					            +'<div class="col-md-8" style="display: flex; align-items: center;">'+reply.replyContent+'</div>'
					            +'<div class="col-sm" style="display: flex; align-items: center;">'+reply.replyCreateDate;
					            
					            if (reply.rmemNo == memNum) {
							        htmlContent += '<span id="dltBtn" onclick="dltReply(' + reply.replyNo + ')">삭제</span>';
							    }
					            
					            htmlContent += '</div></div></div>';
				            });
					
					divToUpdate.html(htmlContent);
				}

				function updatePageBtn(startPage, endPage, currentPage){
					let liToUpdate = $('#pageNBtn');
					liToUpdate.empty();
					let buttonsHTML = '';

					for (let p = startPage; p <= endPage; p++) {
				        buttonsHTML += '<li class="page-item';
				        if (p === currentPage) {
				            buttonsHTML += ' active';
				        }
				        buttonsHTML += '"><a class="page-link" href="#' + p + '" onclick="pageReply(' + p + ')">' + p + '</a></li>';
				    }
				    
				    liToUpdate.html(buttonsHTML);
				}

				function updateReplyBtn(endPage, maxPage, currentPage){

					if(maxPage == 1){
						document.getElementById("prevBtn").style.display = "none";
						document.getElementById("nextBtn").style.display = "none";
					}else if(currentPage == 1){
						document.getElementById("prevBtn").style.display = "none";
						document.getElementById("nextBtn").style.display = "block";
					}else if(currentPage == maxPage){
						document.getElementById("prevBtn").style.display = "block";
						document.getElementById("nextBtn").style.display = "none";
					}else{
						document.getElementById("prevBtn").style.display = "block";
						document.getElementById("nextBtn").style.display = "block";
					}
					
				}
				
		
				 function updateLike() {
					    let likeImg = document.getElementById('like-logo');
					    let whgdkdy =document.getElementById('whgdkdy');
					    $.ajax({
					        type: "GET",
					        url: "ajaxUpdateFreeLike", 
					        data: { 
					            freeNo: ${b.freeNo}
					        },
					        dataType: 'json',
					        success: function(data) {
					            console.log(data.status); // 이 부분을 통해 상태 값을 확인
					            if (data.status === 'Y') {
					            	  likeImg.innerHTML = '<img style="height: 19px;" src="<%=contextPath%>/resources/images/heart-filled.png">';
					            	  $(whgdkdy).html(data.likeCount);
					            } else {
					                likeImg.innerHTML = '<img style="height: 19px;" src="<%=contextPath%>/resources/images/heart-notfill.png">';
					                $(whgdkdy).html(data.likeCount);

					            }
					            console.log("ajax 통신 성공");
					        },
					        error: function() {
					            console.log("ajax 통신 실패");
					        }
					    });
					}
				 
				 $(function(){
					    // 댓글 조회하는 함수 호출
					    selectReplyList();
					});

					function selectReplyList(){
					    $.ajax({
					        url: "rlist.fr",
					        data: {
					            bno: ${b.freeNo}
					        },
					        success: function(list){
					            let str = "";
					            for (reply of list){
					                str += (
					                		"<div class='row'>" +
					                	    "<div class='col-sm' style='display: flex; align-items: center;'>" +
					                	        "<i class='replyImg'><img src='/bigFish/" + reply.memProfileImg + "'></i>" +
					                	        "<span>" + reply.replyWriter + "</span>" +
					                	    "</div>" +
					                	    "<div class='col-md-8' style='display: flex; align-items: center;'>" +
					                	        reply.replyContent +
					                	    "</div>" +
					                	    "<div class='col-sm' style='display: flex; align-items: center;'>" +
					                	        reply.replyCreateDate +
					                	        (reply.replyWriter === loginUserNick ? "<span id='rerere' onclick='deletefire("+reply.replyNo+")'>삭제</span>" : "") +
					                	    "</div>" +
					                	"</div>"
					                );
					            }

					            //$("#replyArea tbody").html();
					            document.querySelector("#replyAreaa").innerHTML = str;
					          
					        },
					        error: function(){
					            console.log("ajax통신 실패");
					        }
					    });
					}

				        //댓글 추가
				     function addReply(){
				            $.ajax({
				                url: "rinsert.fr",
				                data: {
				                    rfreeNo: '${b.freeNo}',
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
				            });
				        }
				        //댓글삭제
				     function deletefire(replyNo) {
				    	  console.log(replyNo);
					    $.ajax({
					        url: "delete.frr",
					        data: {
					            replyNo: replyNo
					        },
					        success: function(res) {
					        	selectReplyList();
					        },
					        error: function() {
					        	selectReplyList();
					            console.log("ajax 통신 실패");
					        }
					    });
						}
				        
				        
				        
				
	//function kakao() {
    // requestData 객체 생성 및 값 할당
    //var requestData = {
      //  cid: "TC0ONETIME",
        //partner_order_id: "partner_order_id",
    //    partner_user_id: "partner_user_id",
    //    item_name: "fishing",
     //   quantity: 1,
    //    total_amount: 2200,
    //    tax_free_amount: 0,
    //    approval_url: "http://localhost:8987/bigFish",
     //   fail_url: "http://localhost:8987/fail",
     //   cancel_url: "http://localhost:8987/cancel"
   // };
//
  //  $.ajax({
   //     url: "kakao.fr",
   //     type: 'POST', // 데이터를 전송하는 방식을 POST로 설정
   //     contentType: 'application/json', // 전송되는 데이터의 타입을 JSON으로 설정
   //     data: JSON.stringify(requestData), // 데이터를 JSON 문자열로 변환
   //     success: function(data) {
   //         console.log(data);
   //         alert("카카오페이 결제를 완료해주세요");
    //        let box = data.next_redirect_pc_url;
   //         window.open(box);
   //     },
  //      error: function(error) {
  //          alert(error);
  //          console.log("천재");
  //      }
  //  });
//}
			  </script>
	
</body>
</html>