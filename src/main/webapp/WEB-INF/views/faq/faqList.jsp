<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
</head>
<style>
.faq-fa{
	color: rgb(59, 175, 252);
    width: 90%;
    margin: 10px auto;
    font-weight: bolder;
}
.border-line{
	border-bottom: 2px solid rgb(204, 204, 204);
    width: 90%;
    margin: 10px auto;	
}
.faq-area{
	display: flex;
    align-items: flex-start;
    flex-direction: column;
    justify-content: center;
    margin: 10px;
    margin-left: 70px;
}
.faq-create{
	background-color: rgb(59, 175, 252);
	color: white;
	border-radius: 3px;
    border: none;
    width: 85px;
    height: 35px;
    position: absolute;
    margin-left: 1350px;
    margin-bottom: 100px;
}
.faq-title-line{
	border-bottom: 2px solid rgb(204, 204, 204);
	width: 90%;
    margin: 10px auto;	
}
.faq-date{
    margin-left: 7px;
}
li::marker {
  	color: rgb(41, 128, 185);
}
.faq-btn{
	border:none;
	font-size: 25px;
    background-color: white;
    font-weight: bolder;
}
.faq-title{
	 margin-left: 7px;
}
.enroll-btn{
	background-color: rgb(59, 175, 252);
	color: white;
	border-radius: 3px;
    border: none;
	position: absolute;
	margin-left: 1150px;
}
.delete-btn{
	position: absolute;
	margin-left: 1250px;
}
</style>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br>
	
	<h1 class="faq-fa" style="color:rgb(59, 175, 252)">FAQ</h1>
	<div class="border-line"></div>
	<br><br>
	<div class="faq-area">
	
		<button class="faq-btn" data-bs-toggle="collapse" data-bs-target="#faq1">자주묻는 질문안내사항</button>
		<p class="faq-date">2023.11.22</p>
	
	
		<div id="faq1" class="collapse">
			<p class="faq-title">1.이런거</p>
			<button class="btn btn-primary enroll-btn" onclick="faqEnroll()">수정하기</button>
							<!-- Button to Open the Modal -->
				<button type="button" class="btn btn-danger delete-btn" data-bs-toggle="modal" data-bs-target="#myModal">
				  	삭제하기
				</button>
				
						<!-- The Modal -->
						<div class="modal" id="myModal">
						  <div class="modal-dialog">
						    <div class="modal-content">
						
						      <!-- Modal Header -->
						      <div class="modal-header">
						        <h4 class="modal-title">주의 !</h4>
						        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						      </div>
						
						      <!-- Modal body -->
						      <div class="modal-body">
						    	정말 삭제하시겠습니까?    
						      </div>
						
						      <!-- Modal footer -->
						      <div class="modal-footer">
						        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">예</button>
						        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">아니오</button>
						      </div>
						
						    </div>
						  </div>
						</div>
						
							<p class="faq-title">2.이런거</p>
						</div>
					</div>
	<div class="faq-title-line"></div>
	
	<div class="faq-area">
	
		<button class="faq-btn" data-bs-toggle="collapse" data-bs-target="#faq2">낚시 이벤트 참가방법</button>
		<p class="faq-date">2023.10.12</p>
	
	
		<div id="faq2" class="collapse">
			<p class="faq-title">1.이런거</p>
			<p class="faq-title">2.이런거</p> 
		</div>
	</div>
	<div class="faq-title-line"></div>
	
	<div class="faq-area">
	
		<button class="faq-btn" data-bs-toggle="collapse" data-bs-target="#faq3">결제가 안돼요</button>
		<p class="faq-date">2023.10.12</p>
	
	
		<div id="faq3" class="collapse">
			<p class="faq-title">1.이런거</p>
			<p class="faq-title">2.이런거</p>
		</div>
	</div>
	<div class="faq-title-line"></div>
	
	<div class="faq-area">
	
		<button class="faq-btn" data-bs-toggle="collapse" data-bs-target="#faq4">신고는 어디서 하나요?</button>
		<p class="faq-date">2023.11.22</p>
	
	
		<div id="faq4" class="collapse">
			<p class="faq-title">1.이런거</p>
			<p class="faq-title">2.이런거</p>
			
		</div>
	</div>
	<div class="faq-title-line"></div>
	
	<br>
	
	<button class="faq-create" onclick="faqInsert()">작성하기</button>
		
	<br><br><br><br><br><br>
	
	<script>
		function faqInsert() {
			location.href = "faqInsert.fa"
		}
		function faqEnroll(){
			location.href = "faqEnroll.fa"
		}
	</script>
	
	<jsp:include page="../common/footer.jsp"/>	
</body>
</html>