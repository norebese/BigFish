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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="<%=contextPath%>/resources/css/fishReservation.css">
    <script src="<%=contextPath%>/resources/js/fishReservation.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<div style="display: flexbox; ">
        <div style="margin: 150px 100px 10px 100px; padding: 0; border-bottom: 1px solid; min-width: 100vh;">
            <p class="page-title">민물 낚시</p>
        </div>
        <script type="text/javascript">
	        let selectedRegion;
	    	let selectedCity;
	    	let dpage;
        	function ajaxStoreList(){
        		//document.getElementById("more").style.display = "none";
        		dpage = 1;
        		$.ajax({
                    type: "GET",
                    url: "ajaxStoreList", 
                    data: { selectedRegion: selectedRegion,
                    		selectedCity: selectedCity,
                    		dpage: dpage
                    },
                    dataType: 'json',
                    success: function(data) {
                    	if (data.list.length === 0) {
                    		if(document.getElementById("moreA") != null){
                        		document.getElementById("moreA").style.display = "none";
                    		}
                            emptyResult();
                        } else {
                        	updateList(data.list);
                        	let moreButton = $('<button id="moreA" onclick="ajaxStoreListMore()">더 보기</button>');
                            $('#moreBtn').html(moreButton);
                            if(data.storeCount < 5){
                        		document.getElementById("moreA").style.display = "none";
                        	}
                        }
                    },
                    error: function() {
                    	console.log("ajax 통신 실패");
                    }
                });
        	}
        	
        	function ajaxStoreListMore(){
        		dpage ++;
        		$.ajax({
                    type: "GET",
                    url: "ajaxStoreList", 
                    data: { selectedRegion: selectedRegion,
                    		selectedCity: selectedCity,
                    		dpage: dpage
                    },
                    dataType: 'json',
                    success: function(data) {
                   		nextList(data.list);
                   		if(data.piA.currentPage === data.piA.maxPage){
                    		document.getElementById("moreA").style.display = "none";
                    	}
                    },
                    error: function() {
                    	console.log("ajax 통신 실패");
                    }
                });
        	}
        </script>
        
        <div class="shop-list">
            <div class="filter-area">
                <div>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="width: 300px; margin-bottom: 30px;">지역별</button>
                </div>
            </div>
            <div id="showList-area">
            <c:forEach var="sl" items="${storeList}">
	            <a class="list-box-area" href="resDetailPage?storeNumber=${sl.storeNo}">
	                <div class="list-img-box">
	                    <div class="img-box">
	                        <img src="<%=contextPath%>/resources/images/shop-example.jpg" alt="">
	                    </div>
	                    <div class="list-txt-box">
	                        <p class="list-name">
	                            	${sl.storeName}
	                        </p>
	                        <p class="fish-info">
	                            <span class="reply">
	                                <img style="height: 12px;" src="<%=contextPath%>/resources/images/reply.png" alt="">
	                                ${sl.replyCount}
	                            </span>
	                            <span class="like">
	                                <img style="height: 12px;" src="<%=contextPath%>/resources/images/like.png" alt="">
	                                ${sl.likeCount}
	                            </span>
	                        </p>
	                        <p class="address">
	                            <span>${sl.storeAddress}</span>
	                        </p>
	                        <div class="price-area">
	                            <p>
	                                ${sl.minPrice}
	                                <span>원</span>
	                            </p>
	                        </div>
	                    </div>
	                </div>
	            </a>
	          </c:forEach>
            </div>
        </div>
        <div class="insert-btn">
        	<div id="moreBtn">
        		<button id="more" onclick="addpage()">더 보기</button>
        	</div>
            <button id="insert" type="button" class="btn btn-primary" style="width: 300px;">등록하기</button>
        </div>
        
    </div>
    <jsp:include page="../common/footer.jsp"/>
    
    <script type="text/javascript">
    let cpage = 1;
    function addpage(){
    	document.getElementById("more").style.display = "none";
    	cpage += ${pi.currentPage};
   		$.ajax({
               type: "GET",
               url: "fishReservationAddPage",
               data: {
            	   cpage: cpage
				},
               dataType: 'json',
               success: function(data) {
            	nextList(data);
            	if(cpage != ${pi.maxPage}){
            		document.getElementById("more").style.display = "block";
            	}else{
					document.getElementById("more").style.display = "none";
				}
               },
               error: function() {
               	console.log("ajax 통신 실패");
               }
           });
   	}
    </script>
    
    
    <!-- Modal -->

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">

                <h1 class="modal-title fs-5" id="staticBackdropLabel">지역선택</h1>

                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

            </div>

            <div class="modal-body">

                <div for="selectRegion" style="font-size: 18px;">지역</div>

                <select id="selectRegion" class="form-select" aria-label="Default select example">

                    <option>서울</option>

                    <option>경기북부</option>

					<option>경기남부</option>

					<option>인천</option>

                    <option>강원</option>

					<option>충북</option>

					<option>충남</option>

					<option>전라</option>

					<option>경상</option>

					<option>제주</option>


                </select>


                <div for="selectCity" style="font-size: 18px;">도시</div>

                <select id="selectCity" class="form-select" aria-label="Default select example">

                    <!-- 도시 목록은 JavaScript를 통해 동적으로 추가됩니다. -->

                </select>

            </div>

            <div class="modal-footer">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>

                <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="confirmBtn">확인</button>

            </div>

        </div>

    </div>

</div>
    
</body>
</html>