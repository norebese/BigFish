<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIG FISH</title>
<!-- 부트스트랩 css 사용 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<!-- 썸머노트 사용 -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
    <br><br><br>

    <div class="content">
        <form id="enrollForm" method="post" action="insert.sh" enctype="multipart/form-data">
		<div class="header-box" style="margin: 5%;">
			<h6 align="left"
				style="border-bottom: solid 2px rgb(204, 204, 204); padding-bottom: 15px;">상품 등록하기
			</h6>
			<br>
			<div class="file-upload" style="width: 50%;">					
                <table>
                    <div>
                        <input type="text" id="" class=""
                            style="margin-bottom: 20px; border: none;"value="" name=""
                            readonly required></input>
                        <input type="file" id="upfile" class="form-control-file border"
                            name="upfile" required style="float: left;"
                            onchange="uploadFile(this)" ></input> 
                    </div>
                    <div
                        style="flex: 1; display: flex; margin-right: 20px; margin-top: 20px;">
                        <!-- 이미지를 감싸는 div -->
                        <div style="height: 100%; margin-bottom: 20px;">
                            <!-- 실제로는 이미지의 경로를 적어주세요. -->
                            <img id="yourImageContainer">
                        </div>
                    </div>
                    <div>
                        <td id="content"></td>
                        <textarea id="summernote" name="productContent"
                            style="resize: none; margin-bottom: 20px; height: 100%; text-align: left; " required></textarea>
                    </div>
                </table>					 
			</div>
            <div class="content" align="center">
                <div class="innerOuter" style="padding:5% 10%; width: 80%;">
                    <table>
                        <tr>
                            <td>
                                <input type="text" id="productName" class="form-control" style="margin-bottom: 20px;" name="studyTitle" required placeholder="상품 이름을 입력해주세요">
                            </td>
                        </tr> 
                        <tr>
                            <td>
                                <input type="text" id="productPrice" class="form-control" style="margin-bottom: 20px;" name="studyLink" required placeholder="가격 입력">
                            </td>
                        </tr>            
                        <tr>
                            <td>
                                <input type="text" id="productOrigin" class="form-control" style="margin-bottom: 20px;" name="studyLink" required placeholder="원산지 입력">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" id="productBrand" class="form-control" style="margin-bottom: 20px;" name="studyLink" required placeholder="브랜드 입력">
                            </td>
                        </tr>
                    </table>
                    <button type="submit" class="btn btn-primary" style="width: 50%;">상품 등록</button>
                    </div>
                </div>
            </div>
        </form>
        </div>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>