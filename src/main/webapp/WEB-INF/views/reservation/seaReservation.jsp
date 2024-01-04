<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIG FISH</title>
<link rel="stylesheet" href="<%=contextPath%>/resources/css/seaReservation.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- storeAPI-->
<script src="<%=contextPath%>/resources/js/service/store-api.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<div style="margin: 150px 0 0 0; padding: 0; background-color: white;">
        <p class="page-title">바다 낚시 지도</p>
    </div>
    <div class="main-section">
	    <div id="seaMapArea" class="main-area">
	        <!-- class에 'on' 이 들어가면 활성화 -->
	        <div class="map-area1 on">
	            <img id="main-img" src="<%=contextPath%>/resources/images/level01_1.png" alt="">
	            <div class="btn-area">
	                <span class="txt w01">서해중부</span>
	                <span class="txt w02">서해남부</span>
	                <span class="txt w03">남해서부</span>
	                <span class="txt w04">제주도</span>
	                <span class="txt w05">남해동부</span>
	                <span class="txt w06">동해남부</span>
	                <span class="txt w07">동해중부</span>
	                <div class="non-click"></div>
	
	                <div class="img-flid1">
	                    <button id="hoverImage1" class="imgtab-btn" title="서해중부"></button>
	                </div>
	                <div class="img-flid2">
	                    <button id="hoverImage2" class="imgtab-btn" title="서해남부"></button>
	                    <div class="img-flid3">
	                        <button id="hoverImage3" class="imgtab-btn" title="남해서부"></button>
	                        <button id="hoverImage4" class="imgtab-btn" title="제주도"></button>
	                    </div>
	                </div>
	                
	                <div class="img-flid4">
	                    <button id="hoverImage5" class="imgtab-btn" title="남해동부"></button>
	                    <button id="hoverImage6" class="imgtab-btn" title="동해남부"></button>
	                </div>
	                <div class="img-flid5">
	                    <button id="hoverImage7" class="imgtab-btn" title="동해중부"></button>
	                </div>
	
	            </div>
	        </div>
	        
	        <div class="map-area2">
	            <img id="" src="<%=contextPath%>/resources/images/level02_2.png" alt="서해중부 지도">
	            <button class="prev-btn" title="이전으로 가기"></button>
	            <div class="btn-area2">
	                <p class="sub-txt">서해중부</p>
	                <button class="icon-txt-btn1" onclick="seaAreaFilter('강화군', '중구', '서구', '김포시', '', '', '12A20101')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span id="test">인천,경기 북부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn2" onclick="seaAreaFilter('남동구', '남구', '안산시', '시흥시', '화성시', '평택시', '12A20102')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>인천,경기 남부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn3" onclick="seaAreaFilter('당진시', '서산시', '태안군', '', '', '', '12A20103')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>충남 북부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn4" onclick="seaAreaFilter('보령시', '서천군', '','','','', '12A20104')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>충남 남부 앞바다</span>
	                </button>
	            </div>
	        </div>
	        <div class="map-area3">
	            <img id="" src="<%=contextPath%>/resources/images/level02_3.png" alt="서해남부 지도">
	            <button class="prev-btn" title="이전으로 가기"></button>
	            <div class="btn-area3">
	                <p class="sub-txt">서해남부</p>
	                <button class="icon-txt-btn5" onclick="seaAreaFilter('군산시' ,'부안군','전주시','','','', '22A30101')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>전북 북부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn6" onclick="seaAreaFilter('고창군','나주시','','','','', '22A30102')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>전북 남부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn7" onclick="seaAreaFilter('영광군','속화초','','','','', '22A30103')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>전남 북부 서해 앞바다</span>
	                </button>
	                <button class="icon-txt-btn8" onclick="seaAreaFilter('신안군', '함평군', '무안군', '목포시','전주시','', '22A30104')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>전남 중부 서해 앞바다</span>
	                </button>
	                <button class="icon-txt-btn9" onclick="seaAreaFilter('해남군', '진도군','정읍시','','','', '22A30105')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>전남 남부 서해 앞바다</span>
	                </button>
	            </div>
	        </div>
	        <div class="map-area4">
	            <img src="<%=contextPath%>/resources/images/level02_4.png" alt="남해서부 지도">
	            <button class="prev-btn" title="이전으로 가기"></button>
	            <div class="btn-area4">
	                <p class="sub-txt">남해서부</p>
	                <button class="icon-txt-btn10" onclick="seaAreaFilter('해남군', '강진군', '완도군','','','', '12B10101')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>전남 서부 <br> 남해 앞바다</span>
	                </button>
	                <button class="icon-txt-btn11" onclick="seaAreaFilter('장흥군', '보성군', '고흥군','','','', '12B10102')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>전남 동부 남해 앞바다</span>
	                </button>
	            </div>
	        </div>
	        <div class="map-area5">
	            <img src="<%=contextPath%>/resources/images/level02_5.png" alt="제주도 지도">
	            <button class="prev-btn" title="이전으로 가기"></button>
	            <div class="btn-area5">
	                <p class="sub-txt">제주도</p>
	                <button class="icon-txt-btn12" onclick="seaAreaFilter('제주','','','','','', '12B10302')">
	                    <img class="jeju" src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>제주도 북부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn13" onclick="seaAreaFilter('제주','','','','','', '12B10301')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>제주도 동부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn14" onclick="seaAreaFilter('서귀포시','','','','','', '12B10304')">
	                    <img class="jeju" src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>제주도 서부 <br> 앞바다</span>
	                </button>
	                <button class="icon-txt-btn15" onclick="seaAreaFilter('서귀포시','','','','','', '12B10303')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>제주도 남부 앞바다</span>
	                </button>
	            </div>
	        </div>
	        <div class="map-area6">
	            <img src="<%=contextPath%>/resources/images/level02_6.png" alt="남해동부 지도">
	            <button class="prev-btn" title="이전으로 가기"></button>
	            <div class="btn-area6">
	                <p class="sub-txt">남해동부</p>
	                <button class="icon-txt-btn16" onclick="seaAreaFilter('부산', '창원시', '기장군','','','', '12B20103')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>부산 앞바다</span>
	                </button>

	                <button class="icon-txt-btn18" onclick="seaAreaFilter('고성군', '통영시', '거제시','','','', '12B20104')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>거제시 동부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn19" onclick="seaAreaFilter('여수시', '광양시', '남해군', '사천시','','', '12B20101')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>경남 서부 남해 앞바다</span>
	                </button>
	            </div>
	        </div>
	        <div class="map-area7">
	            <img src="<%=contextPath%>/resources/images/level02_7.png" alt="동해남부 지도">
	            <button class="prev-btn" title="이전으로 가기"></button>
	            <div class="btn-area7">
	                <p class="sub-txt">동해남부</p>
	                <button class="icon-txt-btn20" onclick="seaAreaFilter('울진군','','','','','', '12C10103')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>경북 북부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn21" onclick="seaAreaFilter('포항시', '영덕군','','','','', '12C10102')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>경북 남부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn22" onclick="seaAreaFilter('울산','','','','','', '12C10101')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>울산 앞바다</span>
	                </button>
	            </div>
	        </div>
	        <div class="map-area8">
	            <img src="<%=contextPath%>/resources/images/level02_8.png" alt="동해중부 지도">
	            <button class="prev-btn" title="이전으로 가기"></button>
	            <div class="btn-area8">
	                <p class="sub-txt">동해중부</p>
	                <button class="icon-txt-btn23" onclick="seaAreaFilter('속초시', '고성군','','','','', '12C20103')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>강원 북부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn24" onclick="seaAreaFilter('강릉시', '양양군','','','','', '12C20102')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>강원 중부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn25" onclick="seaAreaFilter('삼척시', '동해시','','','','', '12C20101')">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span>강원 남부 앞바다</span>
	                </button>
	            </div>
	        </div>
	    </div>
	    <div style="width: 60%;">
	    	<div class="apiArea">
		    	<div id="seaName"></div>
		    	<div>지도에서 지역을 선택하시면 날씨전망 및 어종을 확인할 수 있습니다.</div>
	           <div class="weather-area">
					<div class="weather-table">
						<div><span class="word-date">오늘 </span> 
							<span id="dayOne"><br><br> </span>
						</div>
						<div class="table-inner">
							<div class="spinner-border" role="status">
							  <span class="visually-hidden">Loading...</span>
							</div>
						</div>
					</div>
					<div class="weather-table">
						<div><span class="word-date">내일 </span>
							<span id="dayTwo"><br><br></span>
						</div>
						<div class="table-inner2">
							<div class="spinner-border" role="status">
							  <span class="visually-hidden">Loading...</span>
							</div>
						</div>
					</div>
					<div class="weather-table">
						<div><span class="word-date">모레 </span>
							<span id="dayThree"><br><br></span>
						</div>
						<div class="table-inner3">
							<div class="spinner-border" role="status">
							  <span class="visually-hidden">Loading...</span>
							</div>
						</div>
					</div>
	           </div>
           </div>
           <div class="fishinfo-area">
           		<p class="fish-info-banner">어종 정보</p>
           		<div class="fishinfo">
		           <div class="fishKindAmount">
			           	<ul id="fish-group" class="list-group" style="width: 100%;">
			           		<li>
			           		<br><br>지도에서 지역을 선택하시면 해당 지역<br> 사업장에서 취급하는 어종을 확인할 수<br> 있습니다.
			           		</li>
						</ul>
		           </div>
	              	<div class="fishPhoto">
	              		<div id="fishImg-area"></div>
	              	</div>
           		</div>
           </div>
           
       	</div>
    </div>
    <div class="list-section">
        
        <div class="category-area">
            
            <div class="category-title">
                <p>카테고리 목록</p>
                 <div class="filter-area">
		              <select id="sortStore" class="form-select" aria-label="Default select example" style="width: 200px;">
		                <option selected value="3">전체</option>
		                <option value="1">바다 배</option>
		                <option value="2">바다 좌대</option>
		              </select>
		        </div>
            </div>
            <div id="showList-area">
            	<c:forEach var="ssl" items="${seaStoreList}" varStatus="loopStatus">
	            <a class="list-box-area" href="resDetailPage?storeNumber=${ssl.storeNo}">
	                <div class="list-img-box">
	                    <div class="img-box">
	                        <img src="<%=contextPath%>/resources/uploadFiles/${ssl.thumbnailImg}">
	                    </div>
	                    <div class="list-txt-box">
	                        <p class="list-name">
	                            	${ssl.storeName}
	                        </p>
	                        <p class="fish-info">
	                            <span class="reply">
	                                <img style="height: 12px;" src="<%=contextPath%>/resources/images/reply.png" alt="">
	                                ${ssl.replyCount}
	                            </span>
	                            <span class="like">
	                                <img style="height: 12px;" src="<%=contextPath%>/resources/images/like.png" alt="">
	                                ${ssl.likeCount}
	                            </span>
	                        </p>
	                        <p class="address">
	                            <span>${ssl.storeAddress}</span>
	                        </p>
	                        <div class="price-area">
	                            <p>
	                                <fmt:formatNumber value="${ssl.minPrice}"/>
	                                <span>원</span>
	                            </p>
	                        </div>
	                    </div>
	                </div>
	            </a>
	          </c:forEach>
            </div>
            <div id="btn-area">
            	<c:if test="${pi.maxPage > 1}">
	            	<div id="moreBtn">
		        		<button id="more" onclick="addSeaPage()">더 보기 +
			        		<span>${pi.currentPage}</span>
			        		<span style="color: rgba(96,96,96,.5)">/ ${pi.maxPage}</span>
		        		</button>
		        	</div>
			    </c:if>
            </div>
        </div>
       
        <div class="goTop" onclick="moveTop()">
        	<a class="topBtn">
        		<img class="topBtnImg" src="<%=contextPath%>/resources/images/go-top.png">
        	</a>
        </div>
    </div>
    <script src="<%=contextPath%>/resources/js/seaReservation.js"></script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>