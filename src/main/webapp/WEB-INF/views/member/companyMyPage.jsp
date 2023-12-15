<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIG FISH</title>
<!-- CSS-->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/companyMyPage.css">

<!-- JS-->
<script src="<%=contextPath%>/resources/js/companyMyPage.js"></script>

<!-- memberAPI-->
<script src="<%=contextPath%>/resources/js/service/member-api.js"></script>

<!-- storeAPI-->
<script src="<%=contextPath%>/resources/js/service/store-api.js"></script>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br><br>
	<div class="top-line">
		<h1 class="head-text" style="color: rgb(59, 175, 252);">사업자 관리</h1>
	</div>
	<br>  
	  
	<div class="myPage">
		<div class="myPageMenuList" id="myPageMenuList">
			<button id="buttonProfile" onclick="showProfile()" style="width: 100%; border: none; background: rgb(28, 134, 204);" class="btn btn-secondary">프로필 관리</button><br><br>
			<button id="buttonBusiness" onclick="showBusiness()" style="width: 100%; border: none; background: rgb(59, 175, 252);" class="btn btn-secondary">사업장 관리</button><br><br>
			<c:forEach var="store" items="${storeList}">
				<c:choose>
					<c:when test="${store.storeStatus eq 'DeleteOpen'}">
					</c:when>
					<c:otherwise>
						<button id="buttonSample1" onclick="showSample1()" style="width: 100%; border: none; background: rgb(59, 175, 252); " class="btn btn-secondary businessButton">${store.storeName }</button><br><br>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<div class="myPageContent">
			<div id="profileWork" style="display: flex; flex-direction: column; align-items: center;">
				<img id="profileShowArea" width="20%" height="20%" src=${loginUser.memChangeName} alt="">
				<br>
				<label for="profileImg" style="border: none; background: rgb(59, 175, 252);" class="btn btn-primary">사진 선택</label>
				<input onchange="profileImgChange()" type="file" id="profileImg" style="display: none;">
				<input id="memChangeName" type="hidden" value="${loginUser.memChangeName}">
				<br>
				<table style="width: 60%;">
					<form action="companyUpdateNick.me" method="post"> <!-- 닉네임 변경 -->
						<input id="memNo" type="hidden" name="memNo" value="${loginUser.memNo}">
						<tr>
							<td align="center" style="width: 20%;">닉네임</td>
							<td><input required name="memNick" class="form-control" type="text" placeholder="${loginUser.memNick}"></td>
							<td style="width: 30%;"><button type="submit" style="width: 75%; border: none; background: rgb(59, 175, 252);" class="btn btn-primary">변경</button></td>
						</tr>
					</form>
				</table><br>
				<table style="width: 60%;">
					<form action="companyUpdatePhone.me" method="post"> <!-- 휴대폰 번호 변경 -->
						<input type="hidden" name="memNo" value="${loginUser.memNo}">
					<tr>
						<td align="center" style="width: 20%;">휴대폰 번호</td>
						<td><input required name="phone" class="form-control" type="text" placeholder="${loginUser.phone}"></td>
						<td style="width: 30%;"><button style="width: 75%; border: none; background: rgb(59, 175, 252);" class="btn btn-primary">변경</button></td>
					</tr>
					</form>
				</table><br>

				<button type="button" data-bs-toggle="modal" data-bs-target="#changePwd" class="btn btn-primary" style="border: none; background: rgb(59, 175, 252);">비밀번호 변경</button>
			</div>

			<div id="businessWork" style="display: none; flex-direction: column; align-items: center;">
				<c:forEach var="store" items="${storeList}">
					<!-- 카드 1 -->
					<c:choose>
						<c:when test="${store.storeStatus eq 'DeleteOpen'}">
						</c:when>
						<c:otherwise>
							<div style="width: 70%; margin-bottom: 30px;" class="card">
								<div class="card-header">
									<span style="font-weight: bolder;">${store.storeName}</span>
								</div>
								<div class="card-body" style="display: flex; flex-direction: row;">
									<div style="display: flex; flex-direction: row; justify-content: space-between;">
										<img style="width: 120px; height: 100px; margin-right: 15px;" src="resources/images/businessSample.png" alt="">
									</div>
									
									<div style="display: flex; flex-direction: column;">
										<span style="font-weight: 500;">사업자 번호 : ${store.businessNo}</span><br>
										<span>
											<form action="storeUpdateForm.sto" method="post">
											<input type="hidden" name="storeNo" value="${store.storeNo}">
											<button type="button" style="border: none; background: rgb(59, 175, 252);" class="btn btn-primary">1:1 문의</button>
											<button type="submit" style="border: none; background: rgb(59, 175, 252);" class="btn btn-primary">사업장 수정</button>
											<button type="button" class="btn btn-danger" data-bs-toggle="modal" style="border: none;" data-bs-target="#businessDelete">사업장 삭제</button>
											</form>
										</span>
									</div>
									<div class="form-check form-switch" style="display: flex; flex-direction: column; width: 50%; align-items: flex-end;">
										<span style="scale: 1.2;">
											<label class="form-check-label" for="mySwitch${store.storeNo}">운영 여부</label>
											<c:choose>
												<c:when test="${store.storeStatus eq 'open'}">
												<input class="form-check-input" onchange="updateStoreStatus(this, '${store.storeName}')" type="checkbox" id="mySwitch${store.storeNo}" name="darkmode" data-store-status="open" data-store-No="${store.storeNo}" value="yes" checked>
												</c:when>
												<c:otherwise>
												<input class="form-check-input" onchange="updateStoreStatus(this, '${store.storeName}')" type="checkbox" id="mySwitch${store.storeNo}" name="darkmode" data-store-status="stopOpen" data-store-No="${store.storeNo}" value="yes">
												</c:otherwise>
											</c:choose>
										</span>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>

					<button onclick="location.href='storeEnrollForm.sto'" style="width: 70%; border: none; background: rgb(59, 175, 252);" class="btn btn-primary">사업장 추가</button>
			</div>

			<div id="sample1Work" style="display: none; flex-direction: column;">
				<div style="display: flex; flex-direction: row; justify-content: space-evenly;">
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
					<div style="display: flex; flex-direction: column; justify-content: center;">
						<div style="display: flex; width: 100%; justify-content: space-evenly; flex-direction: row; align-items: center;">
							<div style="display: flex; flex-direction: column; align-items: center;">
								<img style="width: 100px; height: 100px;" src="resources/images/groupImg.png" alt="">
								<p style="padding: 5px; background: rgb(59, 175, 252); color: white; border-radius: 8px;">총 예약</p>
							</div>
							
							<div style="font-size: 20px; font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;2건</div>
						</div>
						

					</div>
					
				</div>
				<div class="top-line" style="width: 100%;"></div>

				<div>
					<div class="card" style="margin-bottom: 30px;">
						<div class="card-header" style="padding-bottom: 3px;">
							<div style="display: flex; flex-direction: row; justify-content: space-between;">
								<span style="font-weight: bold;">김예약</span>
								<span style="font-size: 13px;">No. 12322</span>
							</div>
							<div style="display: flex; flex-direction: row; justify-content: space-between;">
								<span style="font-size: 13px;">12월 9일(토) | 12:00</span>
								<span>예약 신청</span>
							</div>

						</div>
						<div class="card-body">
							<div style="display: flex; flex-direction: row; justify-content: space-between;">
								<span>1시간 이용권 2매</span>
								<span>48000원</span>
							</div>

							<div class="top-line" style="border-bottom: 1px solid rgb(204, 204, 204);  width: 100%;"></div>

							<div>
								요청 사항 : 아이가 둘 있어요.
							</div>

						</div>

						<div class="card-footer" style="display: flex; justify-content: space-between;">
							<span>
								총합 : 48000원
							</span>
							<span>
								<button class="btn btn-sm btn-primary">예약 승인</button>
								<button class="btn btn-sm btn-danger">예약 취소</button>
							</span>
						</div>
					  </div>
				</div>
				
				<div>
					<div class="card" style="margin-bottom: 30px;">
						<div class="card-header" style="padding-bottom: 3px;">
							<div style="display: flex; flex-direction: row; justify-content: space-between;">
								<span style="font-weight: bold;">이예약</span>
								<span style="font-size: 13px;">No. 12321</span>
							</div>
							<div style="display: flex; flex-direction: row; justify-content: space-between;">
								<span style="font-size: 13px;">12월 9일(토) | 18:00</span>
								<span>예약 신청</span>
							</div>

						</div>
						<div class="card-body">
							<div style="display: flex; flex-direction: row; justify-content: space-between;">
								<span>1시간 이용권 2매</span>
								<span>48000원</span>
							</div>

							<div class="top-line" style="border-bottom: 1px solid rgb(204, 204, 204);  width: 100%;"></div>

							<div>
								요청 사항 : 주차 공간이 필요해요.
							</div>

						</div>

						<div class="card-footer" style="display: flex; justify-content: space-between;">
							<span>
								총합 : 48000원
							</span>
							<span>
								<button class="btn btn-sm btn-primary">예약 승인</button>
								<button class="btn btn-sm btn-danger">예약 취소</button>
							</span>
						</div>
					  </div>
				</div>


			</div>


		</div>
	</div>

	<!-- 삭제 모달 -->
	<div class="modal" id="businessDelete">
		<div class="modal-dialog">
		<div class="modal-content">
	
			<!-- Modal Header -->
			<div class="modal-header">
			<h4 class="modal-title">사업장 삭제</h4>
			</div>
	
			<!-- Modal body -->
			<div class="modal-body" style="display: flex; flex-direction: column; align-items: center;">
				사업자 번호를 정확히 입력한 후 삭제 버튼을 눌러주세요.<br><br>
				<div style="display: flex; flex-direction: row;">
					<input class="form-control" id="deleteBusinessInput" type="text" placeholder="사업자 번호를 입력해주세요.">&nbsp;
					<button type="button" onclick="checkBusinessNoForDelete()" style="width: 50%;" class="btn btn-primary btn-sm">사업자 번호 확인</button>
				</div>
				<div style="display: none; color: #dd2f35;" id="deleteBusinessArea"></div>
			</div>
	
			<!-- Modal footer -->
			<div class="modal-footer">
			<button disabled id="deleteBusinessBtn" type="button" onclick="businessDelete()" class="btn btn-danger">사업장 삭제</button>
			<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
			</div>
	
		</div>
		</div>
	</div>

	  
	  <br><br>
	  <jsp:include page="../common/footer.jsp"/>

</body>
</html>



