<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/seaReservation.css">
<script src="/resources/js/seaReservation.js"></script>
</head>
<body>
	<div class="main-area">
        <!-- class에 'on' 이 들어가면 활성화 -->
        <div class="map-area1 on">
            <img id="main-img" src="/images/level01_1.png" alt="">
            <div class="btn-area">
                <span class="txt w01">서해중부</span>
                <span class="txt w02">서해남부</span>
                <span class="txt w03">남해서부</span>
                <span class="txt w04">제주도</span>
                <span class="txt w05">남해동부</span>
                <span class="txt w06">동해남부</span>
                <span class="txt w07">동해중부</span>
                <div class="non-click"></div>

                <div class="img-flid1">
                    <button id="hoverImage1" class="imgtab-btn" title="서해중부"></button>
                </div>
                <div class="img-flid2">
                    <button id="hoverImage2" class="imgtab-btn" title="서해남부"></button>
                    <div class="img-flid3">
                        <button id="hoverImage3" class="imgtab-btn" title="남해서부"></button>
                        <button id="hoverImage4" class="imgtab-btn" title="제주도"></button>
                    </div>
                </div>
                
                <div class="img-flid4">
                    <button id="hoverImage5" class="imgtab-btn" title="남해동부"></button>
                    <button id="hoverImage6" class="imgtab-btn" title="동해남부"></button>
                </div>
                <div class="img-flid5">
                    <button id="hoverImage7" class="imgtab-btn" title="동해중부"></button>
                </div>

            </div>
        </div>
        <div class="map-area2">
            <img id="" src="/images/level02_2.png" alt="서해중부 지도">
            <button class="prev-btn" title="이전으로 가기"></button>
            <div class="btn-area2">
                <p class="sub-txt">서해중부</p>
                <button class="icon-txt-btn1">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span id="test">인천,경기 북부 앞바다</span>
                </button>
                <button class="icon-txt-btn2">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span>인천,경기 남부 앞바다</span>
                </button>
                <button class="icon-txt-btn3">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span>충남 북부 앞바다</span>
                </button>
                <button class="icon-txt-btn4">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span>충남 남부 앞바다</span>
                </button>
            </div>
        </div>
        <div class="map-area3">
            <img id="" src="/images/level02_3.png" alt="서해남부 지도">
            <button class="prev-btn" title="이전으로 가기"></button>
            <div class="btn-area3">
                <p class="sub-txt">서해남부</p>
                <button class="icon-txt-btn5">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span id="test">전북 북부 앞바다</span>
                </button>
                <button class="icon-txt-btn6">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span id="test">전북 남부 앞바다</span>
                </button>
                <button class="icon-txt-btn7">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span id="test">전남 북부 서해 앞바다</span>
                </button>
                <button class="icon-txt-btn8">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span id="test">전남 중부 서해 앞바다</span>
                </button>
                <button class="icon-txt-btn9">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span id="test">전남 남부 서해 앞바다</span>
                </button>
            </div>
        </div>
        <div class="map-area4">
            <img src="/images/level02_4.png" alt="남해서부 지도">
            <button class="prev-btn" title="이전으로 가기"></button>
            <div class="btn-area4">
                <p class="sub-txt">남해남부</p>
                <button class="icon-txt-btn10">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span id="test">전남 서부 <br> 남해 앞바다</span>
                </button>
                <button class="icon-txt-btn11">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span id="test">전남 동부 남해 앞바다</span>
                </button>
            </div>
        </div>
        <div class="map-area5">
            <img src="/images/level02_5.png" alt="제주도 지도">
            <button class="prev-btn" title="이전으로 가기"></button>
            <div class="btn-area5">
                <p class="sub-txt">제주도</p>
                <button class="icon-txt-btn12">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span id="test">제주도 북부 앞바다</span>
                </button>
                <button class="icon-txt-btn13">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span id="test">제주도 동부 앞바다</span>
                </button>
                <button class="icon-txt-btn14">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span id="test">제주도 서부 앞바다</span>
                </button>
                <button class="icon-txt-btn15">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span id="test">제주도 남부 앞바다</span>
                </button>
            </div>
        </div>
        <div class="map-area6">
            <img src="/images/level02_6.png" alt="남해동부 지도">
            <button class="prev-btn" title="이전으로 가기"></button>
            <div class="btn-area6">
                <p class="sub-txt">남해동부</p>
                <button class="icon-txt-btn16">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span id="test">부산 앞바다</span>
                </button>
                <button class="icon-txt-btn17">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span id="test">경남 중부 남해 앞바다</span>
                </button>
                <button class="icon-txt-btn18">
                    <img src="/images/icon-txt-btn.png" alt="">
                    <span id="test">거제시 동부 앞바다</span>
                </button>
            </div>
        </div>
        <div id="testtext"></div>
    </div>
</body>
</html>