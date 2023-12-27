<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%String contextPath = request.getContextPath();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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

	<!-- CSS-->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/freeBoardList.css">
<!-- JS-->
<style>

.header-box{
    display: flex;
    flex-direction: row;
    
}

.left_box{
    background-color: rgb(52, 152, 219);  
    width: 25%; 
    height: 286px;
}

.center_box{
    display: flex;
    flex-direction: row;
    background-color: rgb(59, 175, 252); 
    width: 100%; 
    max-width: 1200px;
    height: 286px;
    justify-content: space-evenly;
    align-items: center;
    
}

.right_box{
    background-color: rgb(52, 152, 219); 
    width: 25%; 
    height: 286px;
}

.study-image{
    color: white;
    display: flex;
    justify-content: space-around;
    align-items: flex-start;
}

</style>
</head>
<body style="text-align: center;">
    <jsp:include page="../common/header.jsp" />
    <br><br><br><br><br><br><br>
    <div style="width: 80%; max-width: 1200px; display: inline-block; text-align: left;">
      
        <div>
          <h2 style="border-bottom: 3px solid #515151; padding-bottom: 15px;">주문자 정보</h2>
          <div class="container text-center">
            <div class="row" style=" border-bottom: 2px solid #a7a7a7;padding-top: 10px; padding-bottom: 10px;">
              <div class="col-sm-2"><h4>이름</h4></div>
              <div class="col-sm-4" required>
                <tr>
					<td><input required id="name" name="name" placeholder="이름을 입력하세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>					
				</tr>
              </div>   
              <div class="col-sm-4"></div>
            
            </div>
        </div>
        <div class="container text-center">
            <div class="row" style=" border-bottom: 2px solid #a7a7a7; padding-top: 10px; padding-bottom: 10px;">
              <div class="col-sm-2"><h4>이메일</h4></div>
             
              <div class="col-sm-4" required>
                <tr>
					<td><input required id="memId" name="memId" value="${loginUser.memId}" placeholder="이메일을 입력하세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
					
				</tr>
              </div>  
              <div class="col-sm-4"></div>
             
            </div>
        </div>
        
        <div class="container text-center">
            <div class="row" style=" border-bottom: 2px solid #a7a7a7; padding-top: 10px; padding-bottom: 10px;">
              <div class="col-sm-2"><h4>연락처</h4></div>
             
           
              <div class="col-sm-4" required>
                <tr>
					<td><input required id="phone" name="phone" value="${loginUser.phone}" placeholder="연락처을 입력하세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
					
				</tr>
              </div>   
             
            </div>
        </div>

    </div>
     <br><br><br>


    <div style="width: 100%; max-width: 1200px; display: inline-block; text-align: left;">
      
        <div>
          <h2 style="border-bottom: 3px solid #515151; padding-bottom: 15px;">배송지 정보</h2>
          <div class="container text-center">
            <div class="row" style=" border-bottom: 2px solid #a7a7a7; padding-top: 10px; padding-bottom: 10px;">
                <div class="col-sm-2"><h4>연락처</h4></div>
               
             
                <div class="col-sm-4" required>
                    <tr>
                        <td><input required id="phone" name="phone" value="${loginUser.phone}" placeholder="연락처을 입력하세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
                        
                    </tr>
                  </div>   
                
               
              </div>
        </div>
        <div class="container text-center">
            <div class="row" style="border-bottom: 2px solid #a7a7a7; padding-top: 10px; padding-bottom: 10px;">
                <div class="col-sm-2" style=" align-items: center;  border-bottom: 2px solid #a7a7a7;margin-bottom: 10px;">
                    <h4 style="margin-top: 45px;">주소</h4>
                </div>
                <div class="col-sm-10" style="display: flex; align-items: center; border-bottom: 2px solid #a7a7a7;margin-bottom: 10px;">
                    <table style="width: 100%; margin: 0px auto;">
                        <tr style="width: 100%;">
                            <td><input name="postNo" id="postcode" value="${loginUser.postNo}" placeholder="우편번호" readonly style="width: 100%;" class="form-control" type="text"></td>
                            <td><button type="button" onclick="sample6_execDaumPostcode()" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">주소 검색</button></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input readonly id="address" name="address" value="${loginUser.address}" placeholder="주소 검색 버튼으로 입력해주세요." style="width: 100%;" class="form-control" type="text"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input required id="addressDetail" name="addressDetail" value="${loginUser.addressDetail}" placeholder="상세 주소를 입력해주세요." style="width: 100%;" class="form-control" type="text"></td>
                        </tr>
                    </table>
                </div>
              
                <div class="col-sm-2" style=" align-items: center;">
                    <h4 style="margin-top: 30px;">배송메세지(100글자내외)</h4>
                </div>
                <div class="col-sm-10" style="display: flex; align-items: center;">
                    <table style="width: 100%; margin: 0px auto;">
                        <tr style="width: 100%;">
                            <td colspan="3"><textarea  id="postcode" placeholder="내용을 입력해주세요"  style="width: 100%; resize: none;   " class="form-control" type="text"></textarea>                        
                        </tr>              
                    </table>
                </div>           
            </div>
        </div>
    </div>
    <br><br><br>

    <div style="width: 100%; max-width: 1200px; display: inline-block; text-align: left;">
        <div>
          <h2 style="border-bottom: 3px solid #bfbfbf; padding-bottom: 15px;">주문 상품 정보</h2>
        </div>
        <table style="width: 100%; margin: 0px auto; border-collapse: collapse;">
            <tr style="height: 80px; background-color: #bfbfbf;text-align: center;">
                <td style="border: 1px solid #bfbfbf; padding: 10px; width: 60%; ">상품/옵션정보</td>
                <td style="border: 1px solid #bfbfbf; padding: 10px; width: 20%;">수량</td>
                <td style="border: 1px solid #bfbfbf; padding: 10px; width: 20%;">주문금액</td>
            </tr>
            <tr style="height: 100px;">
                <td style="border: 1px solid #a7a7a7; padding: 10px; width: 60%; text-align: left; vertical-align: left;">
                    <span>
                        <img src="<%=contextPath%>${s.changeName}" alt="Your Image" style="height: 78px; width: 83px; ">
                        <h5 style="display: inline-block;margin-left: 40px;text-align: center;">${s.productName}</h5>
                    </span>
                </td>
                <td style="border: 1px solid #a7a7a7; padding: 10px; width: 20%;text-align: center;">개</td>
                <td style="border: 1px solid #a7a7a7; padding: 10px; width: 20%; text-align: center;">${s.productPrice}</td>
            </tr> 
        </table>
    </div>
    <br><br><br>

    <div style="width: 100%; max-width: 1200px; display: inline-block; text-align: left;border-bottom: 3px solid #515151;">
      
        <div>
          <h2 style="border-bottom: 3px solid #515151; padding-bottom: 15px;">주문자 동의</h2>
         
        </div>
        <div>
            <img src="<%=contextPath%>/resources/images/agreee.png" alt="" style="width: 100%;">
        </div>

        <table style="width: 100%; margin: 0px auto; border-collapse: collapse;">
            <tr style="height: 80px; background-color: #bfbfbf;text-align: left;">
                <td style="border: 1px solid #bfbfbf; padding: 10px; width: 20%; "><h5>최종결제금액</h5></td>
                <td style="border: 1px solid #bfbfbf; padding: 10px; width: 80%;"><input id="productPrice" value="${s.productPrice}" readonly style="background-color: #bfbfbf; color: #ff0000; border: none;"></input><h5 style="color: #ff0000; ">원</h5></td>
             
            </tr>
           
          
        </table>
        <br>
        <div style="text-align: center;">
            <button  class="btn btn-danger" style="height: 64px;width: 276px; background-color: white;"><h5 style=" color: red; ">취소</h5></button>
            <button class="btn btn-primary" style="height: 64px;width: 276px; margin-left: 50px;" onclick="kakao();"><h5>결제하기</h5></button>
        </div>
      

    </div>
    <jsp:include page="../common/footer.jsp"/>
    <script>
    function kakao() {
    	 let payValue = document.getElementById('payValue').value;
	    let requestData = {
	        cid: "TC0ONETIME",
	        partner_order_id: "partner_order_id",
	        partner_user_id: `${loginUser.memId}`,
	        item_name: "SDFASD-ASDF-S",
	        quantity: 4,
	        total_amount: payValue,
	        tax_free_amount: 0,
	        approval_url:`http://localhost:8987/bigFish/listasdf.SHbo&pg_token=`,//`http://localhost:8987/bigFish/detail.fbo?bno=${b.freeNo}&pg_token=`,
	        fail_url: "http://localhost:8987/fail",
	        cancel_url: "http://localhost:8987/cancel"
	    }

	    $.ajax({
	        url: "kakao.fr", // 여러분의 Kakao API 엔드포인트로 교체하세요
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify(requestData),
	        success: function(data) {
	            console.log(data+"이곳이문제");
	            alert("카카오페이 결제를 완료해주세요");
	            data1 = JSON.parse(data); 
	            let box = data1.next_redirect_pc_url;
	            console.log(box+"이곳이문제2");
	            
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
	    
	    // bno 추출
	    var bno = getParameterByName('bno');

	    // 서버로 pg_token 및 bno 전송
	    sendTokenToServer(pgToken, bno);
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

	function sendTokenToServer(pgToken, bno) {
	    // Ajax 요청으로 pgToken 및 bno을 서버로 전송
	    $.ajax({
	        url: "pay.fr",  // 서버의 실제 엔드포인트로 교체하세요
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({
	            pg_token: pgToken,
	            productNo: bno
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
	</script>
 </body>
</html>