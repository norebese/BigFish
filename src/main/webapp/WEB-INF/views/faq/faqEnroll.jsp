<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.faq-button {
    width: 850px;
    font-size: 16px;
    font-weight: bolder;
    height: 50px;
    background-color: rgb(59, 175, 252);
    color: white;
    border-radius: 3px;
    border: 4px solid;
}
.faq-form{
	display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}
.faq-title{
	width: 850px;
    height: 40px;
}
.faq-content{
	width: 850px;
    height: 550px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br><br>
	
	<h1 class="faq-fa" style="color:rgb(59, 175, 252)">FAQ 내용 수정</h1>
	<div class="border-line"></div>
	
	<br><br>
	<form class="faq-form" action="faqUpdate.fa">
		<input type="text" class="faq-title" name="faqTitle" value="${f.faqTitle}"  placeholder="제목을 입력해주세요.">
		<input type="hidden" name="faqNo" value="${f.faqNo }"/>
		<input type="hidden" value="${loginUser.memId}" name="faqWriter" />
		<br><br><br>	
		<textarea class="faq-content" name="faqContent" placeholder="내용을 입력해주세요." >${f.faqContent}</textarea>
		<br><br>
		<button type="submit" class="faq-button">게시글 등록</button>
	</form>
	
	<br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>