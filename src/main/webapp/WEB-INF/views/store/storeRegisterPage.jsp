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
<link rel="stylesheet" href="<%=contextPath%>/resources/css/storeRegisterPage.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div>
		<div style="margin: 150px 100px 10px 100px; padding: 0; border-bottom: 1px solid; min-width: 100vh;">
            <p class="page-title">상세정보 수정하기</p>
        </div>
        <div class="selectStoreList">
              <select id="myStoreList" class="form-select" aria-label="Default select example" style="width: 400px;">
              	<option disabled selected value="">사업장을 선택해 주세요</option>
        		<c:forEach var="my" items="${myStoreList}">
                	<option value="${my.storeNo}">${my.storeName}</option>
            	</c:forEach>
              </select>
        </div>
        <div class="detailInfo-area">
        	<p style="font-size: 20px; font-weight: bold;">상세정보</p>
        	<div>
        		<textarea id="detailText" class="form-control" rows="55" cols="2" style="resize:none; width:100%; height: 120px;"></textarea>
        	</div>
        	<div class="btn-area">
        		<button class="btn btn-primary" onclick="updateDetailInfo()">수정하기</button>
        	</div>
        </div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
	<script type="text/javascript">
	let selectedStore;
	document.getElementById("myStoreList").addEventListener("change", function() {
	    selectedStore = this.value;
	    console.log(selectedStore);
	    getDetailInfo(selectedStore);
	  });
	function getDetailInfo(storeNum){
   		$.ajax({
               type: "GET",
               url: "ajaxGetDetailInfo",
               data: {
            	   storeNum: storeNum
				},
               success: function(data) {
            	   document.getElementById("detailText").value = data;
               },
               error: function() {
               	console.log("ajax 통신 실패");
               }
           });
   	}
	
	function updateDetailInfo(){
		let infoVal = document.getElementById('detailText').value;
   		$.ajax({
               type: "GET",
               url: "ajaxUpdateDetailInfo",
               data: {
            	   storeNum: selectedStore,
            	   infoVal: infoVal
				},
				dataType: 'json',
               success: function(data) {
            	   if(data.info > 0){
            		   alert('업데이트 성공');
            	   }else{
            		   alert('업데이트 실패');
            	   }
               },
               error: function() {
               	console.log("ajax 통신 실패");
               }
           });
   	}
	</script>
</html>