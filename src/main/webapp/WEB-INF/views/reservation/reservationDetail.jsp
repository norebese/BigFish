<%@page import="com.kh.bigFish.store.model.vo.Store"%>
<%@page import="com.kh.bigFish.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
	Member loginUser = (Member)session.getAttribute("loginUser");
	Store st = (Store)session.getAttribute("st");
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIG FISH</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=93eacc44e9f87bdc7f981a6488721356&libraries=services"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<link rel="stylesheet" href="<%=contextPath%>/resources/css/reservationDetail.css">
	<link rel="stylesheet" href="<%=contextPath%>/resources/css/insertReservationOne.css">
	<script src="<%=contextPath%>/resources/js/insertReservationOne.js"></script>
	<script src="<%=contextPath%>/resources/js/reservationDetail.js"></script>
	<!-- resAPI-->
	<script src="<%=contextPath%>/resources/js/service/res-api.js"></script>
</head>
<body onload="buildCalendar(), init('${st.storeAddress}','${st.storeName}','${st.storeNo}')">

<jsp:include page="../common/header.jsp"/>
	<div style="margin: 150px 100px 10px 100px; padding: 0; border-bottom: 1px solid; min-width: 100vh;">
		<c:if test="${st.storeKind eq 'seaShip' or st.storeKind eq 'seaSeat'}">
    		<p class="page-title">바다 낚시</p>
		</c:if>
        <c:if test="${st.storeKind eq 'FreshCafe' or st.storeKind eq 'FreshSeat'}">
    		<p class="page-title">민물 낚시</p>
		</c:if>
    </div>

    <div class="photo-info">
        <div class="photo-area">
        	<div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false">
			  <div class="carousel-inner">
			  <c:forEach var="photo" items="${storePhoto}" varStatus="loopStatus">
				    <div class="carousel-item${loopStatus.first ? ' active' : ''}">
				      <img src="<%=contextPath%>/resources/uploadFiles/${photo.changeName }" class="d-block w-100">
				    </div>
			    </c:forEach>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
        </div>
        
        <div class="info-area">
            <p class="bkind">
            	<c:if test="${st.storeKind eq 'seaShip'}">
    				선상 낚시
				</c:if>
				<c:if test="${st.storeKind eq 'seaSeat'}">
    				바다 좌대
				</c:if>
				<c:if test="${st.storeKind eq 'FreshSeat'}">
    				좌대
				</c:if>
				<c:if test="${st.storeKind eq 'FreshCafe'}">
    				낚시 카페
				</c:if>
            </p>
            <p class="bname">
                ${st.storeName }
            </p>
            <p class="baddress">
                ${st.storeAddress }
            </p>
            <div id="like-logo" onclick="updateLike('<%=loginUser%>')">
	            <c:choose>
	            <c:when test="${Slike.storeGoodStatus eq 'Y'}">
	            	<img src="<%=contextPath%>/resources/images/heart-filled.png">
	            </c:when>
	            <c:otherwise>
	            	<img src="<%=contextPath%>/resources/images/heart-notfill.png">
	            </c:otherwise>
	            </c:choose>
            </div>
        </div>
    </div>

    <div class="detail-reply">
        <div class="tab-area">
            <ul class="half">
                <li class="detail-tab" style="background-color: rgb(41, 128, 185);">낚시터 정보</li>
                <li style="display: table-cell; width: 90px;"></li>
                <li class="reply-tab">댓글</li>
            </ul>
        </div>
        <div class="map-plus on">
            <div class="map-area">
                <div id="map" class="kakao-map">

                </div>
                <div class="address-area">
                    <p class="title-address">위치 정보</p>
                    <p class="detail-address">${st.storeAddress}</p>
                </div>
            </div>
            

            <div class="price-area">
                <p class="price-title">예약시간 및 요금안내</p>
                <div style="margin-bottom: 50px;">
                    
			       <div class="cal-area">
			        <p>날짜 선택</p>
				        <div class="table-area">
				            <table class="Calendar">
				                <thead>
				                    <tr>
				                        <td id="prev-btn" style="cursor:pointer;"></td>
				                        <td colspan="5">
				                            <span id="calYear"></span>년
				                            <span id="calMonth"></span>월
				                        </td>
				                        <td id="next-btn" onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
				                    </tr>
				                    <tr>
				                        <td>일</td>
				                        <td>월</td>
				                        <td>화</td>
				                        <td>수</td>
				                        <td>목</td>
				                        <td>금</td>
				                        <td>토</td>
				                    </tr>
				                </thead>
				                <tbody>
				                </tbody>
				            </table>
				            <div class="choice-area"> 
				                <div class="time-area">
				                    <span>시작시간</span>
				                </div>
				                <div class="start-time">
				                    <select id="timeSelect" class="form-select" style="width: 200px;">
				                    <option disabled selected value="">시간을 선택해 주세요</option>
				                        <option>24:00</option>
				                        <option>23:00</option>
				                        <option>22:00</option>
				                        <option>21:00</option>
				                        <option>20:00</option>
				                        <option>19:00</option>
				                        <option>18:00</option>
				                        <option>17:00</option>
				                        <option>16:00</option>
				                        <option>15:00</option>
				                        <option>14:00</option>
				                        <option>13:00</option>
				                        <option>12:00</option>
				                        <option>11:00</option>
				                        <option>10:00</option>
				                        <option>09:00</option>
				                        <option>08:00</option>
				                        <option>07:00</option>
				                        <option>06:00</option>
				                        <option>05:00</option>
				                        <option>04:00</option>
				                        <option>03:00</option>
				                        <option>02:00</option>
				                        <option>01:00</option>
				                    </select>
				                </div>
				               	<div class="option-list-area">
				                	<ul class="option-list">
				                		<div id="showTicket-area">
					                		
				                		</div>
				                	</ul>
				                </div>
				               
				            </div>
				        </div>
			        
			    	</div>
                    
                </div>
                
            </div>
			<c:set var="fishKindsSize" value="${fn:length(fishImageMap)}" />

            <div class="fishkind-area">
                <span class="price-title">주요 어종</span>
                <span style="color: green;"><c:out value="${fishKindsSize}" />종</span>

                <div style="display: flex; margin-left: 10px;">
	                <c:forEach var="fishInfo" items="${fishImageMap}"> 
	                    <div class="fish-img">
	                        <img src="${fishInfo.value}" alt="">
	                        <p class="fishname">${fishInfo.key}</p>
	                    </div>
	                 </c:forEach>
                </div>
            </div>
            <div class="information">
                <p class="info-title">업장 정보</p>
                <div class="detail-info">
                    <p>주중 영업 : ${st.storeWeekday }</p>
                    <p>주말 영업:  ${st.storeWeekend }</p>
                    <c:if test="${st.storeGroup eq 'Y'}">
    					<p>단체가능여부: 가능</p>
					</c:if>
					<c:if test="${st.storeGroup eq 'N'}">
    					<p>단체가능여부: 불가능</p>
					</c:if>
                    <p>좌석수: ${st.maxMember }석</p>
                </div>
            </div>
            <div class="detail-information">
                <p class="info-title">상세 정보
                <c:if test="${st.rmemNo eq loginUser.memNo}">
                <a onclick="changeToTextarea()">
                	<button id="updateBtn" class="btn btn-primary">수정하기</button>
                	<button id="saveBtn" onclick="updateDetailInfo('${st.storeNo}')" class="btn btn-primary" style="display: none;">저장하기</button>
                </a>
                </c:if>
                </p>
                <div class="detail-info">
                    <p id="rDetail"><c:out value='${st.reservationDetail}'/></p>
                    <textarea class="form-control" id="updateRDetail" cols="55" rows="2" style="resize:none; width:100%; height: 80px; display: none;"></textarea>
                </div>
            </div>
        </div>

        <div class="reply-area">
            <div class="reply-line">
                <h6 id="replyNum" style="text-align: left; margin-bottom: 10px;">댓글 (${replyCount})</h6>
            </div>
            
            <div id="showReplyArea">
	            <c:if test="${empty replyList}">
				    <div class="no-reply">
				        댓글이 존재하지 않습니다.
				    </div>
				</c:if>
            	<c:forEach var="rl" items="${replyList}" varStatus="loopStatus">
		            <div class="" style="border-bottom: solid 2px rgb(204,204,204); ">
		                <div class="row">
		                    <div class="col-sm" style="display: flex; align-items: center;">
		                        <i class="replyImg">
		                        	<img src="<%=contextPath%>/${rl.memProfileImg}">
		                        </i>
		                        <span >${rl.replyWriter}</span>
		                    </div>
		                    <div class="col-md-8" style="display: flex; align-items: center;"><c:out value='${rl.replyContent}'/></div>
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
					       <c:when test="${empty replyPi or replyPi.maxPage < 1}">
					          <li id="nextBtn" class="page-item" onclick="pageReply('next')" style="display: none;">
						            <a class="page-link" href="#" aria-label="Next">
						              <span aria-hidden="true">&raquo;</span>
						            </a>
					          </li>
				          </c:when>
				          <c:when test="${replyPi.maxPage > 1}">
				          		<li id="nextBtn" class="page-item" onclick="pageReply('next')">
						            <a class="page-link" href="#" aria-label="Next">
						              <span aria-hidden="true">&raquo;</span>
						            </a>
					          </li>
				          </c:when>
			          </c:choose>
			        </ul>
			      </nav>
            </div>

            <div>
                
                <th colspan="2">
                    <div style="display: flex; align-items: center;">
                        <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%; height: 80px;"></textarea>
                        <button class="btn btn-primary" onclick="addReply();" <%= (loginUser == null) ? "disabled style='background:gray; height: 80px; width:120px; margin-left: 10px;'" : "" %> style="height: 80px; width:120px; margin-left: 10px;">댓글등록</button>
                    </div>
                </th>
            </div>
        </div>
    </div>

	
	<!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">인원수 설정</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	      <div class="modal-body">
	        <label for="quantity">인원수:</label>
		    <div class="input-group">
		        <button type="button" class="btn btn-outline-secondary" id="decreaseBtn">-</button>
		        <input type="text" class="resnum-area" id="quantity" value="1">
		        <button type="button" class="btn btn-outline-secondary" id="increaseBtn">+</button>
		    </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
    <div class="btn-fixed">
    	<div class="btn-inner">
    		<button class="fixed-btn" onclick="saveSelectedDate()" <%= (loginUser == null || loginUser.getBusinessStatus().equals("Y")) ? "disabled style='background: gray'" : "" %>>예약하기</button>
    	</div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
    <div class="pad"></div>
    
    <script>
    let memNum = <%= (loginUser != null) ? loginUser.getMemNo() : 0%>;
	</script>
</body>
</html>