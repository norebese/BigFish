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
<title>Insert title here</title>

<<link

	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"

	rel="stylesheet"

	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"

	crossorigin="anonymous">

<link rel="stylesheet"

	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="<%=contextPath%>/resources/css/faqInsert.css">
	
	<!-- language pack -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"
	integrity="sha256-y2bkXLA0VKwUx5hwbBKnaboRThcu7YOFyuYarJbCnoQ=" crossorigin="anonymous"></script>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br><br>
	
	<h1 class="faq-fa" style="color:rgb(59, 175, 252)">FAQ</h1>
	<div class="border-line"></div>
	
	<br><br>
	
		<form class="faq-form" action="faqInsert.fa">
			<input type="text" class="faq-title" name="faqTitle" placeholder="제목을 입력해주세요.">
			<input type="hidden" value="${loginUser.memId}" name="faqWriter" />
			<br><br><br>
			<textarea id="summernote" class="faq-content" name="faqContent"></textarea>
			<br><br>
			<button type="submit" class="btn btn-primary faq-button">게시글 등록</button>
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