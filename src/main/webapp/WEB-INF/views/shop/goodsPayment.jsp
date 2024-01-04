<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	
	String alertMsg = (String)session.getAttribute("alertMsg");
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- CSS-->
<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/freeBoardList.css">
<!-- JS-->
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
<body style="text-align: center;">
	<jsp:include page="../common/header.jsp" />
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div
		style="width: 80%; max-width: 1200px; display: inline-block; text-align: left;">

		<div>
			<h2 style="border-bottom: 3px solid #515151; padding-bottom: 15px;">주문자
				정보</h2>
			<div class="container text-center">
				<div class="row"
					style="border-bottom: 2px solid #a7a7a7; padding-top: 10px; padding-bottom: 10px;">
					<div class="col-sm-2">
						<h4>이름</h4>
					</div>
					<div class="col-sm-4" required>
						<tr>
							<td><input required id="name" name="name"
								placeholder="이름을 입력하세요." style="width: 100%; margin: 0px auto;"
								class="form-control" type="text"></td>
						</tr>
					</div>
					<div class="col-sm-4"></div>

				</div>
			</div>
			<div class="container text-center">
				<div class="row"
					style="border-bottom: 2px solid #a7a7a7; padding-top: 10px; padding-bottom: 10px;">
					<div class="col-sm-2">
						<h4>이메일</h4>
					</div>

					<div class="col-sm-4" required>
						<tr>
							<td><input required id="memId" name="memId"
								value="${loginUser.memId}" placeholder="이메일을 입력하세요."
								style="width: 100%; margin: 0px auto;" class="form-control"
								type="text"></td>

						</tr>
					</div>
					<div class="col-sm-4"></div>

				</div>
			</div>

			<div class="container text-center">
				<div class="row"
					style="border-bottom: 2px solid #a7a7a7; padding-top: 10px; padding-bottom: 10px;">
					<div class="col-sm-2">
						<h4>연락처</h4>
					</div>


					<div class="col-sm-4" required>
						<tr>
							<td><input required id="phone" name="phone"
								value="${loginUser.phone}" placeholder="연락처을 입력하세요."
								style="width: 100%; margin: 0px auto;" class="form-control"
								type="text"></td>

						</tr>
					</div>

				</div>
			</div>

		</div>
		<br> <br> <br>


		<div
			style="width: 100%; max-width: 1200px; display: inline-block; text-align: left;">

			<div>
				<h2 style="border-bottom: 3px solid #515151; padding-bottom: 15px;">배송지
					정보</h2>
				<div class="container text-center">
					<div class="row"
						style="border-bottom: 2px solid #a7a7a7; padding-top: 10px; padding-bottom: 10px;">
						<div class="col-sm-2">
							<h4>연락처</h4>
						</div>


						<div class="col-sm-4" required>
							<tr>
								<td><input required id="phone" name="phone"
									value="${loginUser.phone}" placeholder="연락처을 입력하세요."
									style="width: 100%; margin: 0px auto;" class="form-control"
									type="text"></td>

							</tr>
						</div>


					</div>
				</div>
				<div class="container text-center">
					<div class="row"
						style="border-bottom: 2px solid #a7a7a7; padding-top: 10px; padding-bottom: 10px;">
						<div class="col-sm-2"
							style="align-items: center; border-bottom: 2px solid #a7a7a7; margin-bottom: 10px;">
							<h4 style="margin-top: 45px;">주소</h4>
						</div>
						<div class="col-sm-10"
							style="display: flex; align-items: center; border-bottom: 2px solid #a7a7a7; margin-bottom: 10px;">
							<table style="width: 100%; margin: 0px auto;">
								<tr style="width: 100%;">
									<td><input name="postNo" id="postcode"
										value="${loginUser.postNo}" placeholder="우편번호" readonly
										style="width: 100%;" class="form-control" type="text"></td>
									<td><button type="button"
											onclick="sample6_execDaumPostcode()"
											style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;"
											class="btn btn-sm btn-primary">주소 검색</button></td>
								</tr>
								<tr>
									<td colspan="2"><input readonly id="address"
										name="address" value="${loginUser.address}"
										placeholder="주소 검색 버튼으로 입력해주세요." style="width: 100%;"
										class="form-control" type="text"></td>
								</tr>
								<tr>
									<td colspan="2"><input required id="addressDetail"
										name="addressDetail" value="${loginUser.addressDetail}"
										placeholder="상세 주소를 입력해주세요." style="width: 100%;"
										class="form-control" type="text"></td>
								</tr>
							</table>
						</div>

						<div class="col-sm-2" style="align-items: center;">
							<h4 style="margin-top: 30px;">배송메세지(100글자내외)</h4>
						</div>
						<div class="col-sm-10" style="display: flex; align-items: center;">
							<table style="width: 100%; margin: 0px auto;">
								<tr style="width: 100%;">
									<td colspan="3"><textarea id="postcode"
											placeholder="내용을 입력해주세요" style="width: 100%; resize: none;"
											class="form-control" type="text"></textarea>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<br> <br> <br>

			<div
				style="width: 100%; max-width: 1200px; display: inline-block; text-align: left;">
				<div>
					<h2 style="border-bottom: 3px solid #bfbfbf; padding-bottom: 15px;">주문
						상품 정보</h2>
				</div>
				<table
					style="width: 100%; margin: 0px auto; border-collapse: collapse;">
					<tr
						style="height: 80px; background-color: #bfbfbf; text-align: center;">
						<td style="border: 1px solid #bfbfbf; padding: 10px; width: 60%;">상품/옵션정보</td>
						<td style="border: 1px solid #bfbfbf; padding: 10px; width: 20%;">수량</td>
						<td style="border: 1px solid #bfbfbf; padding: 10px; width: 20%;">주문금액</td>
					</tr>
					<tr style="height: 100px;">
						<td
							style="border: 1px solid #a7a7a7; padding: 10px; width: 60%; text-align: left; vertical-align: left;">
							<span> <img id="qwerrewq"
								src="<%=contextPath%>${s.changeName}" alt="Your Image"
								style="height: 78px; width: 83px;">
								<h5 id="asdffdsa"
									style="display: inline-block; margin-left: 40px; text-align: center;">${s.productName}</h5>
						</span>
						</td>
						<td id="quantity" name="quantity"
							style="border: 1px solid #a7a7a7; padding: 10px; width: 20%; text-align: center;">${quantity}개</td>
						<td id="total_amount" name="sum"
							style="border: 1px solid #a7a7a7; padding: 10px; width: 20%; text-align: center;">${total_amount}원</td>
					</tr>
				</table>
			</div>
			<br> <br> <br>

			<div
				style="width: 100%; max-width: 1200px; display: inline-block; text-align: left; border-bottom: 3px solid #515151;">

				<div>
					<h2 style="border-bottom: 3px solid #515151; padding-bottom: 15px;">주문자
						동의</h2>

				</div>
				<div style="border-bottom: 2px solid #a7a7a7;">
					<div class="row">
						<div
							class="col-2 d-flex align-items-center justify-content-center">
							<h4 style="font-size: 18px;">청약철회 방침</h4>
						</div>
						<div class="col-10" style="font-size: 14px;">
							[청약철회 등]<br>① BigFish와 상품등의 구매에 관한 계약을 체결한 이용자는 전자상거래법 등 관련
							법령에 따라 상품등을 공급받거나 공급이 시작된 날 부터 7일 이내에 반품 또는 교환 신청 (청약철회)을 할 수
							있습니다. 단,이용자에게 책임이 있는 사유로 상품 등이 멸실 또는 훼손된 경우 등 전자상거래법제17조 제2항에 따른
							청약철회 제한 사유가 있는 경우에는 청약철회가 제한될 수 있습니다.<br> ② 이용자는 상품 등을 배송 받은
							경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.<br>1.이용자에게 책임 있는
							사유로 상품 등이 멸실 또는 훼손된 경우(다만 상품등의 내용을 확인하기 위하여 포장등을 훼손한 경우에는 상품이 불량일
							경우 청약철회를 할 수 있습니다.)<br>2.이용자의 사용 또는 일부 소비에 의하여 상품 등의 가치가 현저히
							감소한 경우<br>3.시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우<br>4.같은
							성능을 지닌 상품 등으로 복제가 가능한 경우 그 원본인 상품 등의 포장을 훼손한 경우<br>③전항의 규정에도
							불구하고, 이용자는 상품등의 내용이 표시 광고 내용과 다르거나 계약 내용과 다르게 이행된 경우에는 해당 상품 등을
							공급받은 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회를 할수있습니다.
						</div>
					</div>
				</div>

				<div>
					<div class="row" style="margin-top: 20px;">
						<div
							class="col-3 d-flex align-items-center justify-content-center">
							<h4 style="font-size: 18px;">개인정보 수집 및 이용</h4>
						</div>
						<div class="col-9" style="font-size: 14px;">
							<table style="width: 100%; border-collapse: collapse;">
								<thead>
									<tr
										style="height: 70px; background-color: #bfbfbf; text-align: center;">
										<th
											style="width: 33%; text-align: center; border: 2px solid #a7a7a7;">목적</th>
										<th
											style="width: 33%; text-align: center; border: 2px solid #a7a7a7;">항목</th>
										<th
											style="width: 33%; text-align: center; border: 2px solid #a7a7a7;">보유기간</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="text-align: center; border: 2px solid #a7a7a7;">주문자
											정보 확인 , 주문 내역 안내, 주문 내역 조회</td>
										<td style="text-align: center; border: 2px solid #a7a7a7;">주문자
											정보(연락처,이메일)</td>
										<td style="text-align: center; border: 2px solid #a7a7a7;"
											rowspan="3">주문일로부터 90일까지 보유하며,관련 법령에 따라 5년간 보관</td>
									</tr>
									<tr>
										<td style="text-align: center; border: 2px solid #a7a7a7;">상품배송(구매/환불/취소/교환)을
											위한 수취인 정보</td>
										<td style="text-align: center; border: 2px solid #a7a7a7;">수취인
											정보(이름,연락처1,연락처2,주소)</td>
									</tr>
									<tr>
										<td style="text-align: center; border: 2px solid #a7a7a7;">무통장
											결제 내역 확인을 위한 입금자명</td>
										<td style="text-align: center; border: 2px solid #a7a7a7;">무통장
											입금자명(미입력시 주문자명 사용)</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<table
					style="width: 100%; margin: 0px auto; border-collapse: collapse; margin-top: 20px;">
					<tr
						style="height: 80px; background-color: #bfbfbf; text-align: left;">
						<td style="border: 1px solid #bfbfbf; padding: 10px; width: 20%;"><h5>최종결제금액</h5></td>
						<td
							style="border: 1px solid #bfbfbf; padding: 10px; width: 80%; background-color: #bfbfbf; border: none; white-space: nowrap;">
							<h5 id="rewqqwer" style="display: inline; margin: 0;">${total_amount}</h5>
							<h5 style="display: inline; margin: 0;">원</h5>
						</td>
					</tr>


				</table>
				<br>
				<div style="text-align: center;">
					<button class="btn btn-primary" style="height: 64px; width: 276px;"
						onclick="kakao();">
						<h5>결제하기</h5>
					</button>
					<button class="btn btn-danger"
						style="height: 64px; width: 276px; margin-left: 50px; background-color: white;">
						<h5 style="color: red;">취소</h5>
					</button>
				</div>


			</div>
			<jsp:include page="../common/footer.jsp" />
			<script>
    function kakao() {
        let payValue = document.getElementById('rewqqwer').innerText;
        let payName = document.getElementById('asdffdsa').innerText;
        let payAmount = document.getElementById('quantity').innerText;

        let requestData = {
            cid: "TC0ONETIME",
            partner_order_id: "partner_order_id",
            partner_user_id: `${loginUser.memId}`,
            item_name: payName,
            quantity: parseInt(payAmount), // 수량을 정수로 변환
            total_amount: parseInt(payValue), // 총 결제 금액을 정수로 변환
            tax_free_amount: 0,
            approval_url: "http://localhost:8987/bigFish/detail.sh?sno=${sno}",//  detail.sh?sno=${s.productNo}&pg_token=", // 여러분의 approval_url로 교체하세요
            fail_url: "http://localhost:8987/fail",
            cancel_url: "http://localhost:8987/cancel"
        };
        console.log(requestData)

        $.ajax({
            url: "kakao.fr", // 여러분의 Kakao API 엔드포인트로 교체하세요
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(requestData),
            success: function(data) {
                console.log(data + "이곳이문제");
                alert("카카오페이 결제를 완료해주세요");
                data1 = JSON.parse(data);
                let box = data1.next_redirect_pc_url;
                console.log(box + "이곳이문제2");

                location.href = box;
            },
            error: function(error) {
                alert(error.responseText); // 서버에서 반환된 오류 메시지를 표시하세요
                console.log("에러 발생");
            }
        });
    }
    $(document).ready(function() {
        // pg_token 추출
        var pgToken = getParameterByName('pg_token');
        
        // pg_token이 존재하는 경우에만 처리
        if (pgToken) {
            // bno 추출
            var sno = getParameterByName('sno');
            console.log('pgToken:', pgToken);
            console.log('sno:', sno);

            // 서버로 pg_token 및 sno 전송
            sendTokenToServer(pgToken, sno);
        } else {
            console.log('pg_token이 없습니다.');
            // pg_token이 없을 경우에 대한 처리를 추가할 수 있습니다.
        }
    });

    function getParameterByName(name, url) {
        if (!url) url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }

    function sendTokenToServer(pgToken, sno) {
        // Ajax 요청으로 pgToken 및 bno을 서버로 전송
        $.ajax({
            url: "pay.fr",  // 서버의 실제 엔드포인트로 교체하세요
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                pg_token: pgToken,
                productNo: sno
            }),
            success: function(response) {
                console.log("서버 응답:", response);
                // 서버로 전송 성공 시 원하는 동작 수행
            },
            error: function(error) {
                console.error("서버 오류:", error.responseText);
                // 서버 오류 시 처리
            }
        });
    }

	function getParameterByName(name, url) {
	    if (!url) url = window.location.href;
	    name = name.replace(/[\[\]]/g, "\\$&");
	    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
	        results = regex.exec(url);
	    if (!results) return null;
	    if (!results[2]) return '';
	    return decodeURIComponent(results[2].replace(/\+/g, " "));
	}

	function sendTokenToServer(pgToken, sno) {
	    // Ajax 요청으로 pgToken 및 bno을 서버로 전송
	    $.ajax({
	        url: "pay.fr",  // 서버의 실제 엔드포인트로 교체하세요
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({
	            pg_token: pgToken,
	            productNo: sno
	        }),
	        success: function(response) {
	            console.log("서버 응답:", response);
	            // 서버로 전송 성공 시 원하는 동작 수행
	        },
	        error: function(error) {
	            console.error("서버 오류:", error.responseText);
	            // 서버 오류 시 처리
	        }
	    });
	}	
	
	function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }

	            // // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            // if(data.userSelectedType === 'R'){
	            //     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            //     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            //     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	            //         extraAddr += data.bname;
	            //     }
	            //     // 건물명이 있고, 공동주택일 경우 추가한다.
	            //     if(data.buildingName !== '' && data.apartment === 'Y'){
	            //         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            //     }
	            //     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            //     if(extraAddr !== ''){
	            //         extraAddr = ' (' + extraAddr + ')';
	            //     }
	            //     // 조합된 참고항목을 해당 필드에 넣는다.
	            //     document.getElementById("sample6_extraAddress").value = extraAddr;
	            
	            // } else {
	            //     document.getElementById("sample6_extraAddress").value = '';
	            // }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postcode').value = data.zonecode;
	            document.getElementById("address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("addressDetail").focus();
	        }
	    }).open();
	}
	</script>
</body>
</html>