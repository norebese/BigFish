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
<link rel="stylesheet" href="<%=contextPath%>/resources/css/personalMyPage.css">

<!-- JS-->
<script src="<%=contextPath%>/resources/js/personalMyPage.js"></script>

<!-- API-->
<script src="<%=contextPath%>/resources/js/service/member-api.js"></script>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 주소 검색 API (다음카카오)-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


</head>
<body>
	  <jsp:include page="../common/header.jsp"/>
	  <br><br><br><br><br>
	  
	  
	<div class="top-line">
		<h1 class="head-text" style="color: rgb(59, 175, 252);">마이 페이지</h1>
	</div>
	<br><br>
	<!-- 메뉴 -->
	<div class="myPage">
		<div class="myPageMenuList">
			<button id="buttonProfile" onclick="showProfile()" style="width: 100%; border: none; background: rgb(28, 134, 204);" class="btn btn-secondary">프로필 관리</button><br><br>
			<button id="buttonReservation" onclick="showReservation()" style="width: 100%; border: none; background: rgb(59, 175, 252);" class="btn btn-secondary">예약 목록</button><br><br>
			<button style="width: 100%; border: none; background: rgb(59, 175, 252); " class="btn btn-secondary">구매 목록</button><br><br>
			<button style="width: 100%; border: none; background: rgb(59, 175, 252);" class="btn btn-secondary">장바구니</button>

		</div>	




		
		<div class="myPageContent">
			<!-- 프로필 관리 -->
			<div id="profileWork" style="display: flex; flex-direction: column; align-items: center;">
				<img id="profileShowArea" width="20%" height="20%" src="${loginUser.memChangeName}" alt="">
				<br>
				<label for="profileImg" style="border: none; background: rgb(59, 175, 252);" class="btn btn-primary">사진 선택</label>
				<input onchange="profileImgChange()" type="file" id="profileImg" style="display: none;">
				<input id="memChangeName" type="hidden" value="${loginUser.memChangeName}">
				<br>
				<table style="width: 60%;">
					<form action="updateNick.me" method="post"> <!-- 닉네임 변경 -->
						<input id="memNo" type="hidden" name="memNo" value="${loginUser.memNo}">
						<tr>
							<td align="center" style="width: 20%;">닉네임</td>
							<td><input required name="memNick" class="form-control" type="text" placeholder="${loginUser.memNick}"></td>
							<td style="width: 30%;"><button type="submit" style="width: 75%; border: none; background: rgb(59, 175, 252);" class="btn btn-primary">변경</button></td>
						</tr>
					</form>	
				</table><br>
				<table style="width: 60%;">
					<form action="updatePhone.me" method="post"> <!-- 휴대폰 번호 변경 -->
						<input type="hidden" name="memNo" value="${loginUser.memNo}">
						<tr>
							<td align="center" style="width: 20%;">휴대폰 번호</td>
							<td><input required name="phone" class="form-control" type="text" placeholder="${loginUser.phone}"></td>
							<td style="width: 30%;"><button type="submit" style="width: 75%; border: none; background: rgb(59, 175, 252);" class="btn btn-primary">변경</button></td>
						</tr>
					</form>
				</table><br>
				<table style="width: 60%;">
					<form action="updateAddress.me" method="post"> <!-- 주소 변경 -->
						<input type="hidden" name="memNo" value="${loginUser.memNo}">
						<tr>
							<td align="center" style="width: 20%;">우편 번호</td>
							<td><input id="postcode" name="postNo" required readonly class="form-control" type="text" placeholder="${loginUser.postNo}"></td>
							<td style="width: 30%;"></td>
						</tr>
						<tr>
							<td align="center" style="width: 20%;">주소</td>
							<td><input id="address" name="address" required readonly class="form-control" type="text" placeholder="${loginUser.address}"></td>
							<td style="width: 30%;"><button onclick="sample6_execDaumPostcode()" type="button" style="width: 75%; border: none; background: rgb(59, 175, 252);" class="btn btn-primary">주소 검색</button></td>
						</tr>
						<tr>
							<td align="center" style="width: 20%;">상세 주소</td>
							<td><input id="addressDetail" name="addressDetail" required class="form-control" type="text" placeholder="${loginUser.addressDetail}"></td>
							<td style="width: 30%;"><button type="submit" style="width: 75%; border: none; background: rgb(59, 175, 252);" class="btn btn-primary">변경</button></td>
						</tr>
					</form>
				</table><br>

				<button type="button" data-bs-toggle="modal" data-bs-target="#changePwd" class="btn btn-primary" style="border: none; background: rgb(59, 175, 252);">비밀번호 변경</button>
				


			</div>
			<!-- 예약 목록 -->
			<div id="reservationWork" style="display: none; flex-direction: column; align-items: center;">
				<c:choose>
					<c:when test="${not empty reserList}">
						<c:forEach var="r" items="${reserList}">
						<!-- 카드 -->
							<div style="width: 70%; margin-bottom: 30px;" class="card">
								<div class="card-header" style="padding-bottom: 3px; cursor: pointer;" onclick="location.href='myReservationDetail?revNo=${r.revNo}'">
									<div style="display: flex; flex-direction: row; justify-content: space-between;">
										<span style="font-weight: bold;">${r.rstoreName}</span>
										<span style="font-size: 13px;">No. ${r.revNo}</span>
									</div>
			
									
									<div style="display: flex; flex-direction: row; justify-content: space-between;">
										<span style="font-size: 13px;">${r.revDate}</span>
										<span>
											<c:choose>
												<c:when test="${r.revStatus eq 'WAITREV'}">
												예약 대기
												</c:when>
												<c:when test="${r.revStatus eq 'OKREV'}">
												예약 완료
												</c:when>
												<c:when test="${r.revStatus eq 'CANCELREV'}">
												예약 취소
												</c:when>
												<c:when test="${r.revStatus eq 'DONEREV'}">
												이용 완료
												</c:when>
											</c:choose>
										</span>
									</div>
								</div>
								<div class="card-body">
									<div style="display: flex; flex-direction: row; justify-content: space-between;">
										<span>${r.rticketName}</span>
										<span>${r.rticketPrice * r.revPeople}원</span>
									</div>
								</div>
								<div class="card-footer">
									<div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center;">
										<span style="font-size: 13px;">예약한 시간에 도착하지 못할 경우 예약이 취소될 수 있습니다.</span>
										<span>
											<button class="btn btn-sm btn-primary">1:1 문의</button>
											<button class="btn btn-sm btn-primary">리뷰 쓰기</button>
										</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h2>예약 목록이 없습니다.</h2>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		</div>

	  
			<!-- The Modal -->
		<div class="modal" id="changePwd">
			<div class="modal-dialog">
			<div class="modal-content">
	
			<!-- Modal Header -->
			<div class="modal-header">
			<h4 class="modal-title">비밀번호 변경</h4>
			
			</div>
	
			<!-- Modal body -->
			<form action="">
			<div style="display: flex;" class="modal-body">
				
				<table style="width: 80%; margin: 0px auto;">
					<tr>
						<td><input placeholder="현재 비밀번호를 입력하세요." class="form-control" type="text"></td>
					</tr>
					<tr>
						<td><input placeholder="변경할 비밀번호를 입력하세요." class="form-control" type="text"></td>
					</tr>
					<tr>
						<td><input placeholder="다시 한번 변경할 비밀번호를 입력하세요." class="form-control" type="text"></td>
					</tr>
				</table>
			</div>
	
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">변경하기</button>
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
				
			</div>
			</form>
			</div>
			</div>
	</div>


	  <br><br><br><br><br><br><br>
	  <jsp:include page="../common/footer.jsp"/>
</body>
</html>