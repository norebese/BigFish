<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIG FISH</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="<%=contextPath%>/resources/css/reservationDetail.css">
	<script src="<%=contextPath%>/resources/js/reservationDetail.js"></script>
</head>
<body onload="init()">
<jsp:include page="../common/header.jsp"/>
	<div style="margin: 150px 100px 10px 100px; padding: 0; border-bottom: 1px solid; min-width: 100vh;">
        <p class="page-title">민물 낚시</p>
    </div>

    <div class="photo-info">
        <div class="photo-area">
            <div id="demo" class="carousel slide" data-bs-ride="carousel">

                <!-- Indicators/dots -->
                <div class="carousel-indicators">
                  <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                  <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                  <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
                </div>
              
                <!-- The slideshow/carousel -->
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="<%=contextPath%>/resources/images/ex1.jpg" alt="Los Angeles" class="d-block w-100">
                  </div>
                  <div class="carousel-item">
                    <img src="<%=contextPath%>/resources/images/ex2.jpg" alt="Chicago" class="d-block w-100">
                  </div>
                  <div class="carousel-item">
                    <img src="<%=contextPath%>/resources/images/shop-example.jpg" alt="New York" class="d-block w-100">
                  </div>
                </div>
              
                <!-- Left and right controls/icons -->
                <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                  <span class="carousel-control-next-icon"></span>
                </button>
            </div>
        </div>
        
        <div class="info-area">
            <p class="bkind">
                사업장 종류
            </p>
            <p class="bname">
                사업장 이름
            </p>
            <p class="baddress">
                충남 당진시 석문면 난지3길 12
            </p>
        </div>
    </div>

    <div class="detail-reply">
        <div class="tab-area">
            <ul class="half">
                <li class="detail-tab">낚시터 정보</li>
                <li class="reply-tab">댓글</li>
            </ul>
        </div>
        <div class="map-plus on">
            <div class="map-area">
                <div class="kakao-map">

                </div>
                <div class="address-area">
                    <p class="title-address">위치 정보</p>
                    <p class="detail-address">충남 당진시 석문면 난지3길 12</p>
                </div>
            </div>
            

            <div class="price-area">
                <p class="price-title">이용 요금</p>
                <div style="margin-bottom: 50px;">
                    <table>
                        <tbody>
                            <tr>
                                <td>대인</td>
                                <td class="price-num">50,000원</td>
                            </tr>
                            <tr>
                                <td>소인</td>
                                <td class="price-num">100,000원</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="fishkind-area">
                <span class="price-title">주요 어종!</span>
                <span style="color: green;">3종</span>

                <div style="display: flex; margin-left: 10px;">
                    <div class="fish-img">
                        <img src="<%=contextPath%>/resources/images/fish ex.png" alt="">
                        <p class="fishname">붕어</p>
                    </div>
                    <div class="fish-img">
                        <img src="<%=contextPath%>/resources/images/fish ex.png" alt="">
                        <p class="fishname">잉어</p>
                    </div>
                    <div class="fish-img">
                        <img src="<%=contextPath%>/resources/images/fish ex.png" alt="">
                        <p class="fishname">향어</p>
                    </div>
                </div>
            </div>
            <div class="information">
                <p class="info-title">업장 정보</p>
                <div class="detail-info">
                    <p>주중 영업 : 06:00 ~ 익일 05:00</p>
                    <p>주말 영업:  12:00 ~ 익일 05:00</p>
                    <p>단체가능여부:  가능</p>
                    <p>좌석수: 40석</p>
                </div>
            </div>
            <div class="detail-information">
                <p class="info-title">상세 정보</p>
                <div class="detail-info">
                    <p>최고의 서비스를 제공하겠습니다.</p>
                </div>
            </div>
        </div>

        <div class="reply-area">
            <div class="reply-line">
                <h6 style="text-align: left; margin-bottom: 10px;">댓글 (3)</h6>
            </div>
            
            <div class="container" style="border-bottom: solid 2px rgb(204,204,204); ">
                <div class="row">
                    <div class="col-sm" style="display: flex; align-items: center;">
                        <i class="bi bi-person" style="font-size: 40px;"></i>
                        <span >임영웅</span>
                    </div>
                    <div class="col-md-8" style="display: flex; align-items: center;">네 아마 안될거 같네요.</div>
                    <div class="col-sm" style="display: flex; align-items: center;">2023/11/19</div>
                </div>
            </div>
            <div class="container" style="border-bottom: solid 2px rgb(204,204,204); ">
                <div class="row">
                    <div class="col-sm" style="display: flex; align-items: center;">
                        <i class="bi bi-person" style="font-size: 40px;"></i>
                        <span >임영웅</span>
                    </div>
                    <div class="col-md-8" style="display: flex; align-items: center;">네 아마 안될거 같네요.</div>
                    <div class="col-sm" style="display: flex; align-items: center;">2023/11/19</div>
                </div>
            </div>
            
            <div class="container" style="border-bottom: solid 2px rgb(204,204,204); ">
                <div class="row">
                    <div class="col-sm" style="display: flex; align-items: center;">
                        <i class="bi bi-person" style="font-size: 40px;"></i>
                        <span >임영웅</span>
                    </div>
                    <div class="col-md-8" style="display: flex; align-items: center;">네 아마 안될거 같네요.</div>
                    <div class="col-sm" style="display: flex; align-items: center;">2023/11/19</div>
                </div>
            </div>

            <div style="border-top: solid 2px rgb(204,204,204);  padding-bottom: 15px; margin-top: 50px;">
                
                <th colspan="2">
                    <div style="display: flex; align-items: center;">
                        <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%; height: 80px;"></textarea>
                        <button class="btn btn-primary" onclick="addReply();" style="height: 80px; width:120px; margin-left: 10px;">댓글등록</button>
                    </div>
                </th>
            </div>
        </div>
        
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>