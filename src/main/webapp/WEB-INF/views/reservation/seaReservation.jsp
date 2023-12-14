<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<div style="margin: 150px 0 0 0; padding: 0; background-color: white;">
        <p class="page-title">바다 낚시 지도</p>
    </div>
    <div class="main-section">
	    <div class="main-area">
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
	        
	        <script type="text/javascript">
	        let sPage;
	        let city1 = ''; let city2 = ''; let city3 = ''; let city4 = ''; let city5 = ''; let city6 = '';
	        	function seaAreaFilter(param1, param2, param3, param4, param5, param6){
	        		sPage = 1;
	        		$.ajax({
	                    type: "GET",
	                    url: "ajaxSeaAreaFilter", 
	                    data: { param1: param1,
	                    	param2: param2,
	                    	param3: param3,
	                    	param4: param4,
	                    	param5: param5,
	                    	param6: param6
	                    },
	                    dataType: 'json',
	                    success: function(data) {
	                    	if (data.list.length === 0) {
	                    		if(document.getElementById("more") != null){
	                    			document.getElementById("more").style.display = "none";
	                    		}
	                        	emptyResult();
	                        	document.getElementById("moreA").style.display = "none";
	                        } else{
	                        	updateSeaList(data.list);
	                        	let moreButton3 = $(`<button id="moreA" onclick="ajaxSeaAreaMore()">더 보기 +`
	        							+`<span>`+data.piS.currentPage+`</span>`
	        							+`<span style="color: rgba(96,96,96,.5)">/ `+data.piS.maxPage+`</span>`
	        							+`</button>`);
	                            $('#btn-area').html(moreButton3);
	                            if(data.piS.currentPage === data.piS.maxPage){
	                        		document.getElementById("moreA").style.display = "none";
	                        	}
	                        }
	                    	city1 = data.cityNames[0];
	                    	city2 = data.cityNames[1];
	                    	city3 = data.cityNames[2];
	                    	city4 = data.cityNames[3];
	                    	city5 = data.cityNames[4];
	                    	city6 = data.cityNames[5];
	                    },
	                    error: function() {
	                    	console.log("ajax 통신 실패");
	                    }
	                });
	        	}
	        	
	        	function ajaxSeaAreaMore(){
	        		sPage++;
	        		$.ajax({
	                    type: "GET",
	                    url: "ajaxSeaAreaMore", 
	                    data: { param1: city1,
	                    	param2: city2,
	                    	param3: city3,
	                    	param4: city4,
	                    	param5: city5,
	                    	param6: city6,
	                    	sPage: sPage
	                    },
	                    dataType: 'json',
	                    success: function(data) {
	                    	nextListFiltered(data.list);
	                    	let moreButton2 = $('<button id="moreA" onclick="ajaxSeaAreaMore()">더 보기</button>');
	                		$('#btn-area').html(moreButton2);
	                    	if(data.piS.currentPage === data.piS.maxPage){
	                    		document.getElementById("moreA").style.display = "none";
	                    	}
	                    },
	                    error: function() {
	                    	console.log("ajax 통신 실패");
	                    }
	                });
	        	}
	        </script>
	        
	        <div class="map-area2">
	            <img id="" src="<%=contextPath%>/resources/images/level02_2.png" alt="서해중부 지도">
	            <button class="prev-btn" title="이전으로 가기"></button>
	            <div class="btn-area2">
	                <p class="sub-txt">서해중부</p>
	                <button class="icon-txt-btn1">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span id="test" onclick="seaAreaFilter('강화군', '중구', '서구', '김포시')">인천,경기 북부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn2">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('남동구', '남구', '안산시', '시흥시', '화성시', '평택시')">인천,경기 남부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn3">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('당진시', '서산시', '태안군')">충남 북부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn4">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('보령시', '서천군')">충남 남부 앞바다</span>
	                </button>
	            </div>
	        </div>
	        <div class="map-area3">
	            <img id="" src="<%=contextPath%>/resources/images/level02_3.png" alt="서해남부 지도">
	            <button class="prev-btn" title="이전으로 가기"></button>
	            <div class="btn-area3">
	                <p class="sub-txt">서해남부</p>
	                <button class="icon-txt-btn5">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('군산시' ,'부안군')">전북 북부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn6">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('고창군')">전북 남부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn7">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('영광군')">전남 북부 서해 앞바다</span>
	                </button>
	                <button class="icon-txt-btn8">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('신안군', '함평군', '무안군', '목포시')">전남 중부 서해 앞바다</span>
	                </button>
	                <button class="icon-txt-btn9">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('해남군', '진도군')">전남 남부 서해 앞바다</span>
	                </button>
	            </div>
	        </div>
	        <div class="map-area4">
	            <img src="<%=contextPath%>/resources/images/level02_4.png" alt="남해서부 지도">
	            <button class="prev-btn" title="이전으로 가기"></button>
	            <div class="btn-area4">
	                <p class="sub-txt">남해서부</p>
	                <button class="icon-txt-btn10">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('해남군', '강진군', '완도군')">전남 서부 <br> 남해 앞바다</span>
	                </button>
	                <button class="icon-txt-btn11">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('장흥군', '보성군', '고흥군')">전남 동부 남해 앞바다</span>
	                </button>
	            </div>
	        </div>
	        <div class="map-area5">
	            <img src="<%=contextPath%>/resources/images/level02_5.png" alt="제주도 지도">
	            <button class="prev-btn" title="이전으로 가기"></button>
	            <div class="btn-area5">
	                <p class="sub-txt">제주도</p>
	                <button class="icon-txt-btn12">
	                    <img class="jeju" src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('제주')">제주도 북부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn13">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('제주')">제주도 동부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn14">
	                    <img class="jeju" src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('서귀포시')">제주도 서부 <br> 앞바다</span>
	                </button>
	                <button class="icon-txt-btn15">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('서귀포시')">제주도 남부 앞바다</span>
	                </button>
	            </div>
	        </div>
	        <div class="map-area6">
	            <img src="<%=contextPath%>/resources/images/level02_6.png" alt="남해동부 지도">
	            <button class="prev-btn" title="이전으로 가기"></button>
	            <div class="btn-area6">
	                <p class="sub-txt">남해동부</p>
	                <button class="icon-txt-btn16">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('부산', '창원시', '기장군')">부산 앞바다</span>
	                </button>
	                <button class="icon-txt-btn17">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span id="test">경남 중부 남해 앞바다</span>
	                </button>
	                <button class="icon-txt-btn18">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('고성군', '통영시', '거제시')">거제시 동부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn19">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('여수시', '광양시', '남해군', '사천시')">경남 서부 남해 앞바다</span>
	                </button>
	            </div>
	        </div>
	        <div class="map-area7">
	            <img src="<%=contextPath%>/resources/images/level02_7.png" alt="동해남부 지도">
	            <button class="prev-btn" title="이전으로 가기"></button>
	            <div class="btn-area7">
	                <p class="sub-txt">동해남부</p>
	                <button class="icon-txt-btn20">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('울진군')">경북 북부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn21">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('포항시', '영덕군')">경북 남부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn22">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('울산')">울산 앞바다</span>
	                </button>
	            </div>
	        </div>
	        <div class="map-area8">
	            <img src="<%=contextPath%>/resources/images/level02_8.png" alt="동해중부 지도">
	            <button class="prev-btn" title="이전으로 가기"></button>
	            <div class="btn-area8">
	                <p class="sub-txt">동해중부</p>
	                <button class="icon-txt-btn23">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('속초시', '고성군')">강원 북부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn24">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('강릉시', '양양군')">강원 중부 앞바다</span>
	                </button>
	                <button class="icon-txt-btn25">
	                    <img src="<%=contextPath%>/resources/images/icon-txt-btn.png" alt="">
	                    <span onclick="seaAreaFilter('삼척시', '동해시')">강원 남부 앞바다</span>
	                </button>
	            </div>
	        </div>
	    </div>
	    <div>
           <div class="weather-area">
               aa
           </div>
           <div class="fishinfo">
               bbb
           </div>
       	</div>
    </div>
    <div class="list-section">
        
        <div class="category-area">
            
            <div class="category-title">
                <p>카테고리 제목</p>
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
	                        <img src="<%=contextPath%>/resources/images/shop-example.jpg" alt="">
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
	                                ${ssl.minPrice}
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
            
            <script type="text/javascript">
		    let cpage = 1;
		    function addSeaPage(){
		    	cpage += ${pi.currentPage};
		   		$.ajax({
		               type: "GET",
		               url: "seaReservationAddPage",
		               data: {
		            	   cpage: cpage
						},
		               dataType: 'json',
		               success: function(data) {
		            	nextList(data.seaStoreList);
	            		let moreButton3 = $(`<button id="moreA" onclick="addSeaPage()">더 보기 +`
	            							+`<span>`+data.pi.currentPage+`</span>`
	            							+`<span style="color: rgba(96,96,96,.5)">/ `+data.pi.maxPage+`</span>`
	            							+`</button>`);
	            		$('#btn-area').html(moreButton3);
	            		if(data.pi.currentPage === data.pi.maxPage){
                    		document.getElementById("moreA").style.display = "none";
                    	}
		               },
		               error: function() {
		               	console.log("ajax 통신 실패");
		               }
		           });
		   	}
		    let sfPage;
		    function storeKindFilter(selectedOption){
		    	sfPage = 1; 
		   		$.ajax({
		               type: "GET",
		               url: "ajaxStoreKindFilter",
		               data: {param1: city1,
	                    	param2: city2,
	                    	param3: city3,
	                    	param4: city4,
	                    	param5: city5,
	                    	param6: city6,
		            	   	selectedOption: selectedOption,
		            	   	sfPage: sfPage
						},
		               dataType: 'json',
		               success: function(data) {
		            	updateSeaList(data.list);
		            	let moreButton3 = $(`<button id="moreA" onclick="storeKindFilterMore(`+ selectedOption + `)">더 보기 +`
    							+`<span>`+data.piS.currentPage+`</span>`
    							+`<span style="color: rgba(96,96,96,.5)">/ `+data.piS.maxPage+`</span>`
    							+`</button>`);
                		$('#btn-area').html(moreButton3);
                    	if(data.piS.currentPage === data.piS.maxPage){
                    		document.getElementById("moreA").style.display = "none";
                    	}
		               },
		               error: function() {
		               	console.log("ajax 통신 실패");
		               }
		           });
		   	}
		    
		    function storeKindFilterMore(selectedOption){
		    	sfPage++; 
		   		$.ajax({
		               type: "GET",
		               url: "ajaxStoreKindFilter",
		               data: {param1: city1,
	                    	param2: city2,
	                    	param3: city3,
	                    	param4: city4,
	                    	param5: city5,
	                    	param6: city6,
		            	   	selectedOption: selectedOption,
		            	   	sfPage: sfPage
						},
		               dataType: 'json',
		               success: function(data) {
		            	nextListFiltered(data.list);
		            	let moreButton3 = $(`<button id="moreA" onclick="storeKindFilterMore(`+ selectedOption + `)">더 보기 +`
    							+`<span>`+data.piS.currentPage+`</span>`
    							+`<span style="color: rgba(96,96,96,.5)">/ `+data.piS.maxPage+`</span>`
    							+`</button>`);
                		$('#btn-area').html(moreButton3);
                    	if(data.piS.currentPage === data.piS.maxPage){
                    		document.getElementById("moreA").style.display = "none";
                    	}
		               },
		               error: function() {
		               	console.log("ajax 통신 실패");
		               }
		           });
		   	}
		    </script>
            
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