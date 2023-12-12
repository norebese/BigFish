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

<link rel="stylesheet" href="<%=contextPath%>/resources/css/faqEnroll.css">

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br><br>
	
	<h1 class="faq-fa" style="color:rgb(59, 175, 252)">FAQ 내용 수정</h1>
	<div class="border-line"></div>
	
	<br><br>
	<form class="faq-form" action="faqUpdate.fa">
		<input type="text" class="faq-title form-control" style="width: 63%;" name="faqTitle" value="${f.faqTitle}"  placeholder="제목을 입력해주세요.">
		<input type="hidden" name="faqNo" value="${f.faqNo }"/>
		<input type="hidden" value="${loginUser.memId}" name="faqWriter" />
		<br><br><br>	
		<textarea id="summernote" class="faq-content" name="faqContent" placeholder="내용을 입력해주세요." >${f.faqContent}</textarea>
		<br><br>
		<button type="submit" class="faq-button">게시글 등록</button>
	</form>
	
	
	<script>
		$('#summernote').summernote({	
		  placeholder: '내용을 적어주세요.',
		  tabsize: 5,
		  width: 950,
		  height: 400,
		  maxHeight: 450,
		  lang: 'ko-KR'
		});
	</script>
	
	<br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>