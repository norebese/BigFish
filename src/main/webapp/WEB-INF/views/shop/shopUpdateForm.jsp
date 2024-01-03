<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
String alertMsg = (String) session.getAttribute("alertMsg");
%>
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
        <form id="updateForm" method="post" action="update.sh" enctype="multipart/form-data">
		<div class="header-box" style="margin: 5%;">
			<h6 align="left"
				style="border-bottom: solid 2px rgb(204, 204, 204); padding-bottom: 15px;">상품 수정하기
			</h6>
			<br>
			<div class="file-upload" style="width: 40%; float: left; margin-right: 10%;">					
                <input type="hidden" name="productNo" value="${s.productNo}">
                <table>
                    <div>
                        <label for="upfile" style="border: none; background: rgb(59, 175, 252);" class="btn btn-primary">상품 사진</label>
                        <input type="file" id="upfile" class="form-control-file border"
                            name="reupfile" required style="float: left; display: none;"
                            onchange="uploadFile(this)" ></input>
                            <input type="hidden" name="originName" value="${s.originName}"> 
                            <input type="hidden" name="changeName" value="${s.changeName}">   
                    </div>
                    <div
                        style="flex: 1; display: flex; margin-left: 20%;">
                        <!-- 이미지를 감싸는 div -->
                        <div style="height: 100%; margin-bottom: 20px;">
                            <!-- 실제로는 이미지의 경로를 적어주세요. -->
                            <img id="yourImageContainer" style="width: 500px; height: 300px; max-width: 100%;">
                        </div>
                    </div>
                </table>					 
			</div>
            <div class="content" align="center">
                <div class="innerOuter" style=" padding:4% 0%; width: 50%; float: left; margin-left: -10%;">
                    <div style="width: 60%;">
                        
                    <table>
                        <tr>
                            <td>
                                <input type="text" id="productName" class="form-control" style="margin-bottom: 20px;" value="${s.productName}" name="productName" required placeholder="상품 이름을 입력해주세요">
                            </td>
                        </tr> 
                        <tr>
                            <td>
                                <input type="text" id="productPrice" class="form-control" style="margin-bottom: 20px;" value="${s.productPrice}" name="productPrice" required placeholder="가격 입력">
                            </td>
                        </tr>            
                        <tr>
                            <td>
                                <input type="text" id="productOrigin" class="form-control" style="margin-bottom: 20px;" value="${s.productOrigin}" name="productOrigin" required placeholder="원산지 입력">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" id="productBrand" class="form-control" style="margin-bottom: 20px;" value="${s.productBrand}" name="productBrand" required placeholder="브랜드 입력">
                            </td>
                        </tr>
						<tr>
                            <td>
                                <input type="text" id="productStock" class="form-control" style="margin-bottom: 20px;" value="${s.productStock}" name="productStock" required placeholder="재고 입력">
                            </td>
                        </tr>
                    </table>
                    </div>
                    <button type="submit" class="btn btn-primary" onclick="location.href='list.sh'" style="width: 50%;">상품 수정</button>
                    </div>
                </div>
            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <div align="center">
                <td id="content"></td> <h6><상품 상세></h6>
                <textarea id="summernote" name="productDetail"
                style="resize: none; margin-bottom: 20px; height: 100%;text-align: left; " required></textarea>
            </div>
        </form>
        </div>
    <br><br><br><br><br>

    <script>
		// onImageUpload callback

		$(document).ready(

				function() {

					let toolbar = [
							// 글꼴 설정
							[ 'fontname', [ 'fontname' ] ],
							// 글자 크기 설정
							[ 'fontsize', [ 'fontsize' ] ],
							// 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
							[
									'style',
									[ 'bold', 'italic', 'underline',
											'strikethrough', 'clear' ] ],
							// 글자색
							[ 'color', [ 'forecolor', 'color' ] ],
							// 표만들기
							[ 'table', [ 'table' ] ],
							// 글머리 기호, 번호매기기, 문단정렬
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							// 줄간격
							[ 'height', [ 'height' ] ],
							// 그림첨부, 링크만들기, 동영상첨부
							[ 'insert', [ 'picture', 'link', 'video' ] ],
							// 코드보기, 확대해서보기, 도움말
							[ 'view', [ 'codeview', 'fullscreen', 'help' ] ] ];

					let setting = {
						height : 350,
                        width : 1000,
						minHeight : null,
						maxHeight : null,
						focus : true,
						lang : 'ko-KR',
						toolbar : toolbar,
						callbacks : { //여기 부분이 이미지를 첨부하는 부분
							onImageUpload : function(files) {
								console.log(files);
								for (let i = files.length - 1; i >= 0; i--) {
									shopuploadSummernoteImageFile(files[i]);
								}
							}
						}
					};

					$('#summernote').summernote(setting);
                    
					function shopuploadSummernoteImageFile(file) {
						console.log("바로여기" + file)
						data = new FormData();
						data.append("upfile", file);
						$.ajax({
							data : data,
							type : "POST",
							url : "shopuploadSummernoteImageFile",
							contentType : false,
							enctype : 'multipart/form-data',
							processData : false,
							success : function(data) {

								console.log($("#summernote"))
								$("#summernote").summernote("insertImage",
										"/bigFish" + data);

							}
						});
					}
				});

		function uploadFile(input) {
			if (input.files && input.files[0]) {
				let reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('yourImageContainer').src = e.target.result;
				};
				reader.readAsDataURL(input.files[0]);
			} else {
				document.getElementById("yourImageContainer").src = "";
			}
		}
		
		  document.getElementById('upfile').addEventListener('change', function() {
		        
		    });
	</script>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>