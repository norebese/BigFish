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

<!-- JS-->
<script src="<%=contextPath%>/resources/js/fishingTeacher.js"></script>

<!-- CSS-->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/fishingTeacher.css">

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br><br>
	
	<div class="top-line">
		<h1 class="head-text" style="color: rgb(59, 175, 252);">낚시 빅선생</h1>
	</div>
	<br><br>
	<div style="width: 90%; color: #2f9947; font-size: 15px; margin: 0px auto;">빅선생은 ChatGPT 3.5 turbo 기반으로 작동하며, 사실이 아닌 말을 출력할 때도 있으니 활용 전 점검 후 사용해주세요!</div>
	<br>
	<div id="chatArea">
		<div style="margin: 5px; font-weight: 700;">
			&nbsp;빅선생<div class="card" style="max-width: 50%; width: max-content;">
				<div class="card-body">낚시에 관한 궁금한 점을 물어봐주세요.</div>
			  </div>
		</div>
	</div>
	<div id="questionbar">
		<textarea id="questionArea" style="width: 80%; height: 90%; border: none; resize: none; margin-top: 3.5px;"></textarea>
		<button onclick="sendPrompt()" style="width: 20%; background:rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">질문하기</button>
	</div>

	
	<br><br>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>