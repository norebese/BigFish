<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIG FISH</title>

<!-- CSS-->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/companyEnrollForm.css">

<!-- JS-->
<script src="<%=contextPath%>/resources/js/companyEnrollForm.js?ver=4"></script>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- memberAPI-->
<script src="<%=contextPath%>/resources/js/service/member-api.js"></script>

<!-- storeAPI-->
<script src="<%=contextPath%>/resources/js/service/store-api.js"></script>

<!-- 주소 검색 API (다음카카오)-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
<jsp:include page="../common/header.jsp"/>
	  
	  
	<br><br><br><br><br><br>
	<div class="top-line">
		<h1 class="head-text" style="color: rgb(59, 175, 252);">사업자 회원 가입</h1>
	</div>
	<br><br>
	<div class="infoTitle">기본 정보</div>
	<div>
		<form class="input-form" method="post" action="insertCompanyMember.me" enctype="multipart/form-data">
	
			<table style="width:40%; margin: 0px auto;">
				<tr>
					<td><input id="emailId" name="memId" required placeholder="이메일을 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
					<td><button type="button" onclick="checkEmailId()" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">중복 확인</button></td>
				</tr>
				<tr>
					<td id="checkEmailIdSpace" style="height: 25px;"></td>
				</tr>
				<tr>
					<td><input name="memPwd" id="pwd" required placeholder="비밀번호를 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="password"></td>
					<td><button type="button" id="pwdCheck-btn" onclick="checkPwd();" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">비밀번호 확인</button></td>
				</tr>
				<tr id="passwordRule" style="display: none;">
					<td><div class="warning-text" style=" width: 100%; margin: 0px auto; color: red;">&nbsp;비밀번호는 영문, 숫자, 특수문자 조합으로 8~15자여야합니다.</div></td>
				</tr>
				<tr id="passwordRuleOK" style="display: none;">
					<td colspan="2"><div class="warning-text" style=" width: 100%; margin: 0px auto; color: #2f9947;">&nbsp;사용 가능한 비밀번호 입니다!</div></td>
				</tr>
				
			</table>
			<br>
			<input id="pwdAgain" onkeyup="samePwd()" required placeholder="비밀번호를 한번 더 입력해주세요." style="width: 40%; margin: 0px auto;" class="form-control" type="password">
			<div id="checkPasswordRule" class="warning-text" style=" display: none; width: 40%; margin: 0px auto; color: red;">&nbsp;비밀번호가 일치하지 않습니다.</div>
			<br>
			<table style="width:40%; margin: 0px auto;">
				<tr>
					<td><input required id="memNick" name="memNick" placeholder="닉네임을 입력해주세요. (닉네임은 변경 가능합니다.)" style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
					<td><button type="button" id="checkNick-btn" onclick="checkNick()" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">닉네임 중복 확인</button></td>
				</tr>
				<tr>
					<td id="checkNickSpace" style="height: 25px;"></td>
				</tr>
			</table>
			<input required name="phone" placeholder="휴대폰 번호를 입력해주세요. (-미포함)" style="width: 40%; margin: 0px auto;" class="form-control" type="text"><br>


			<div class="infoTitle">사업장 정보</div>

			<input required name="storeName" placeholder="사업장 이름을 입력해주세요." style="width: 40%; margin: 0px auto;" class="form-control" type="text"><br>
			<input required name="storePhone" placeholder="사업장 전화번호를 입력해주세요." style="width: 40%; margin: 0px auto;" class="form-control" type="text"><br>
			<table style="width: 40%; margin: 0px auto;">
				<tr style="width: 100%;">
					<td><input name="businessNo" id="businessNo" required placeholder="사업자 번호를 입력해주세요. (-미포함)" style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
					<td><button onclick="checkBusinessNo()" type="button" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">사업자 확인</button></td>
				</tr>
				<tr>
					<td id="checkBusinessNoSpace" style="height: 25px;"></td>
				</tr>
			</table>
			
			<div style="width: 40%; margin: 0px auto 5px auto; color: rgb(59, 175, 252);">
				사업 종류
			</div>
			<div style="display: flex; margin: 0px auto; width: 40%;">
			<select name="storeKind" class="form-select" style="width: 100%;">
				<option value="seaShip">바다 배</option>
				<option value="seaSeat">바다 좌대</option>
				<option value="FreshSeat">민물 좌대</option>
				<option value="FreshCafe">낚시카페</option>
			</select>
			</div><br>
			<table style="width: 40%; margin: 0px auto;">
				<tr style="width: 100%;">
					<td><input id="locationBig" name="locationBig" required readonly placeholder="지역 선택 버튼으로 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
					<td><input id="locationSmall" name="locationSmall" required readonly placeholder="지역 선택 버튼으로 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
					<td><button type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">지역 선택</button></td>
				</tr>
			</table><br>
			<table style="width: 40%; margin: 0px auto;">
				<tr style="width: 100%;">
					<td><input name="storePostNo" id="postcode" placeholder="우편번호" readonly style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
					<td><button onclick="sample6_execDaumPostcode()" type="button" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">주소 검색</button></td>
				</tr>
				<tr>
					<td colspan="2"><input name="storeAddress" id="address" readonly placeholder="주소 검색 버튼으로 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
				</tr>
				<tr>
					<td colspan="2"><input name="storeAddressDetail" id="addressDetail" required placeholder="상세 주소를 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"><br></td>
				</tr>
			</table><br>
			<div style="width: 40%; margin: 0px auto 5px auto; color: rgb(59, 175, 252);">
				이용권 추가
			</div>
			<table id="fishTicket" style="width: 40%; margin: 0px auto;">
				<tr class="fishTicketName">
					<td style="width: 18%;">이용권 이름</td>
					<td colspan="3"><input name="ticketNameArray" placeholder="이용권 이름을 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
				</tr>
				<tr>
					<td style="width: 18%;">이용권 가격</td>
					<td><input name="ticketPriceArray" required placeholder="원" style="width: 100%; margin: 0px auto;" class="form-control" type="number"></td>
					<td style="width: 15%;">&nbsp;이용 시간</td>
					<td><input name="ticketTimeArray" required placeholder="시간" style="width: 100%; margin: 0px auto;" class="form-control" type="number"></td>
				</tr>
			</table>
			<table style="width: 40%; margin: 0px auto;">
				<tr>
					<td colspan="4"><button type="button" onclick="addFishTicket()" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">추가</button></td>
				</tr>
			</table><br>

			<div style="width: 40%; margin: 0px auto 5px auto; color: rgb(59, 175, 252);">
				어종 추가
			</div>
			<table id="fishKind" style="width: 40%; margin: 0px auto;">
				<tr>
					<td colspan="4"><input name="StoreFishKindArray" required placeholder="어종을 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
				</tr>
			</table>
			<table style="width: 40%; margin: 0px auto;">
				<tr>
					<td colspan="4"><button type="button" onclick="addFishKind()" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">추가</button></td>
				</tr>
			</table><br>
			

			<table style="width: 40%; margin: 0px auto;">
				<tr>
					<td style="width: 25%;">주중 영업 시간</td>
					<td style="width: 25%">
						<select name="storeWeekdayArray" class="form-select">
							<option value="00:00">00:00</option>
							<option value="01:00">01:00</option>
							<option value="02:00">02:00</option>
							<option value="03:00">03:00</option>
							<option value="04:00">04:00</option>
							<option value="05:00">05:00</option>
							<option value="06:00">06:00</option>
							<option value="07:00">07:00</option>
							<option value="08:00">08:00</option>
							<option value="09:00">09:00</option>
							<option value="10:00">10:00</option>
							<option value="11:00">11:00</option>
							<option value="12:00">12:00</option>
							<option value="13:00">13:00</option>
							<option value="14:00">14:00</option>
							<option value="15:00">15:00</option>
							<option value="16:00">16:00</option>
							<option value="17:00">17:00</option>
							<option value="18:00">18:00</option>
							<option value="19:00">19:00</option>
							<option value="20:00">20:00</option>
							<option value="21:00">21:00</option>
							<option value="22:00">22:00</option>
							<option value="23:00">23:00</option>
						</select>
					</td>
					<td align="center">~</td>
					<td style="width: 25%;">
						<select name="storeWeekdayArray" class="form-select">
							<option  value="00:00">00:00</option>
							<option value="01:00">01:00</option>
							<option value="02:00">02:00</option>
							<option value="03:00">03:00</option>
							<option value="04:00">04:00</option>
							<option value="05:00">05:00</option>
							<option value="06:00">06:00</option>
							<option value="07:00">07:00</option>
							<option value="08:00">08:00</option>
							<option value="09:00">09:00</option>
							<option value="10:00">10:00</option>
							<option value="11:00">11:00</option>
							<option value="12:00">12:00</option>
							<option value="13:00">13:00</option>
							<option value="14:00">14:00</option>
							<option value="15:00">15:00</option>
							<option value="16:00">16:00</option>
							<option value="17:00">17:00</option>
							<option value="18:00">18:00</option>
							<option value="19:00">19:00</option>
							<option value="20:00">20:00</option>
							<option value="21:00">21:00</option>
							<option value="22:00">22:00</option>
							<option value="23:00">23:00</option>
						</select>
					</td>
				</tr>
				<table style="width: 40%; margin: 0px auto;">
					<tr>
						<td style="width: 25%;">주말 영업 시간</td>
						<td style="width: 25%">
							<select name="storeWeekendArray" class="form-select">
								<option value="00:00">00:00</option>
								<option value="01:00">01:00</option>
								<option value="02:00">02:00</option>
								<option value="03:00">03:00</option>
								<option value="04:00">04:00</option>
								<option value="05:00">05:00</option>
								<option value="06:00">06:00</option>
								<option value="07:00">07:00</option>
								<option value="08:00">08:00</option>
								<option value="09:00">09:00</option>
								<option value="10:00">10:00</option>
								<option value="11:00">11:00</option>
								<option value="12:00">12:00</option>
								<option value="13:00">13:00</option>
								<option value="14:00">14:00</option>
								<option value="15:00">15:00</option>
								<option value="16:00">16:00</option>
								<option value="17:00">17:00</option>
								<option value="18:00">18:00</option>
								<option value="19:00">19:00</option>
								<option value="20:00">20:00</option>
								<option value="21:00">21:00</option>
								<option value="22:00">22:00</option>
								<option value="23:00">23:00</option>
							</select>
						</td>
						<td align="center">~</td>
						<td style="width: 25%;">
							<select name="storeWeekendArray" class="form-select">
								<option value="00:00">00:00</option>
								<option value="01:00">01:00</option>
								<option value="02:00">02:00</option>
								<option value="03:00">03:00</option>
								<option value="04:00">04:00</option>
								<option value="05:00">05:00</option>
								<option value="06:00">06:00</option>
								<option value="07:00">07:00</option>
								<option value="08:00">08:00</option>
								<option value="09:00">09:00</option>
								<option value="10:00">10:00</option>
								<option value="11:00">11:00</option>
								<option value="12:00">12:00</option>
								<option value="13:00">13:00</option>
								<option value="14:00">14:00</option>
								<option value="15:00">15:00</option>
								<option value="16:00">16:00</option>
								<option value="17:00">17:00</option>
								<option value="18:00">18:00</option>
								<option value="19:00">19:00</option>
								<option value="20:00">20:00</option>
								<option value="21:00">21:00</option>
								<option value="22:00">22:00</option>
								<option value="23:00">23:00</option>
							</select>
						</td>
					</tr>

			</table><br>

			<table style="width: 40%; margin: 0px auto;">
				<tr>
					<td style="width: 25%;">단체 가능 여부</td>
					<td>
						가능&nbsp;<input checked type="radio" name="storeGroup" value="Y">
						&nbsp;&nbsp;&nbsp;
						불가능&nbsp;<input type="radio" name="storeGroup" value="N">
					</td>
				</tr>
			</table><br>

			<table style="width: 40%; margin: 0px auto;">
				<tr>
					<td style="width: 25%;">좌석 수</td>
					<td style="width: 25%;"><input name="maxMember" required placeholder="" style="width: 100%;" class="form-control" type="number"></td>
					<td>석</td>
				</tr>
			</table><br>
			<div style="width: 40%; margin: 0px auto 5px auto; color: rgb(59, 175, 252);">
				대표 사진
			</div>
			<table style="width: 40%; margin: 0px auto;">
				<tr>
					<td><input required onchange="loadImg(this,1)" name="upfile" class="form-control" type="file"></td>
				</tr>
				<tr>
					<td style="height: 250px; border: 2px solid gray; margin: 0px auto;">
						<img style="display: flex; max-width: 100%; max-height: 100%; margin: 0px auto;" id="title-img" src="resources/images/fileInput.png" alt="">
					</td>
				</tr>
			</table><br>

			<div style="width: 40%; margin: 0px auto 5px auto; color: rgb(59, 175, 252);">
				상세 사진 (최대 6장까지 가능합니다.)
			</div>
			<table style="width: 40%; margin: 0px auto;">
				<tr>
					<td><input onchange="loadImg(this,2)" name="upfile" class="form-control" type="file"></td>
					<td><input onchange="loadImg(this,3)" name="upfile" class="form-control" type="file"></td>
					<td><input onchange="loadImg(this,4)" name="upfile" class="form-control" type="file"></td>
				</tr>

				<tr>
					<td style="height: 250px; border: 2px solid gray; margin: 0px auto;">
						<img style="display: flex; max-width: 100%; max-height: 100%; margin: 0px auto;" id="content-img1" src="resources/images/fileInput.png" alt="">
					</td>
					<td style="height: 250px; border: 2px solid gray; margin: 0px auto;">
						<img style="display: flex; max-width: 100%; max-height: 100%; margin: 0px auto;" id="content-img2" src="resources/images/fileInput.png" alt="">
					</td>
					<td style="height: 250px; border: 2px solid gray; margin: 0px auto;">
						<img style="display: flex; max-width: 100%; max-height: 100%; margin: 0px auto;" id="content-img3" src="resources/images/fileInput.png" alt="">
					</td>
				</tr>

				<tr>
					<td><input onchange="loadImg(this,5)" name="upfile" class="form-control" type="file"></td>
					<td><input onchange="loadImg(this,6)" name="upfile" class="form-control" type="file"></td>
					<td><input onchange="loadImg(this,7)" name="upfile" class="form-control" type="file"></td>
				</tr>

				<tr>
					<td style="height: 250px; border: 2px solid gray; margin: 0px auto;">
						<img style="display: flex; max-width: 100%; max-height: 100%; margin: 0px auto;" id="content-img4" src="resources/images/fileInput.png" alt="">
					</td>
					<td style="height: 250px; border: 2px solid gray; margin: 0px auto;">
						<img style="display: flex; max-width: 100%; max-height: 100%; margin: 0px auto;" id="content-img5" src="resources/images/fileInput.png" alt="">
					</td>
					<td style="height: 250px; border: 2px solid gray; margin: 0px auto;">
						<img style="display: flex; max-width: 100%; max-height: 100%; margin: 0px auto;" id="content-img6" src="resources/images/fileInput.png" alt="">
					</td>
				</tr>
			</table><br>

			<div style="display: flex; margin: 0px auto; width: 40%;">
				<button id="enroll-btn" disabled type="submit" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">회원가입</button></td>
			</div>
		</form>
	</div>

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
	



	<br><br>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>