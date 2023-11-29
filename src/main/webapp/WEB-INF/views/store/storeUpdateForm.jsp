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
<!-- CSS-->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/storeUpdateForm.css">

<!-- JS-->
<script src="<%=contextPath%>/resources/js/storeUpdateForm.js"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <br><br><br><br><br><br>
<div class="top-line">
    <h1 class="head-text" style="color: rgb(59, 175, 252);">사업장 수정</h1>
</div>
<br><br>

    <div>
        <div class="infoTitle">사업장 정보</div>
        <form class="input-form" action="">
        <input required placeholder="사업장 이름을 입력해주세요." style="width: 40%; margin: 0px auto;" class="form-control" type="text"><br>
        <input required placeholder="사업장 전화번호를 입력해주세요." style="width: 40%; margin: 0px auto;" class="form-control" type="text"><br>
        <table style="width: 40%; margin: 0px auto;">
            <tr style="width: 100%;">
                <td><input required placeholder="사업자 번호를 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
                <td><button type="button" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">사업자 확인</button></td>
            </tr>
        </table>
        <br>
        <div style="width: 40%; margin: 0px auto 5px auto; color: rgb(59, 175, 252);">
            사업 종류
        </div>
        <div style="display: flex; margin: 0px auto; width: 40%;">
        <select class="form-select" style="width: 100%;">
            <option value="seaShip">바다 배</option>
            <option value="seaSeat">바다 좌대</option>
            <option value="lakeSeat">민물 좌대</option>
            <option value="fishingCafe">낚시카페</option>
        </select>
        </div><br>
        <table style="width: 40%; margin: 0px auto;">
            <tr style="width: 100%;">
                <td><input required readonly placeholder="지역 선택 버튼으로 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
                <td><button type="button" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">지역 선택</button></td>
            </tr>
        </table><br>
        <table style="width: 40%; margin: 0px auto;">
            <tr style="width: 100%;">
                <td><input placeholder="우편번호" readonly style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
                <td><button type="button" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">주소 검색</button></td>
            </tr>
            <tr>
                <td colspan="2"><input readonly placeholder="주소 검색 버튼으로 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
            </tr>
            <tr>
                <td colspan="2"><input required placeholder="상세 주소를 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"><br></td>
            </tr>
        </table><br>
        <div style="width: 40%; margin: 0px auto 5px auto; color: rgb(59, 175, 252);">
            이용권 추가
        </div>
        <table id="fishTicket" style="width: 40%; margin: 0px auto;">
            <tr>
                <td style="width: 18%;">이용권 이름</td>
                <td colspan="3"><input required placeholder="이용권 이름을 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
            </tr>
            <tr>
                <td style="width: 18%;">이용권 가격</td>
                <td><input required placeholder="원" style="width: 100%; margin: 0px auto;" class="form-control" type="number"></td>
                <td style="width: 15%;">&nbsp;이용 시간</td>
                <td><input required placeholder="시간" style="width: 100%; margin: 0px auto;" class="form-control" type="number"></td>
            </tr>
        </table>
        <table style="width: 40%; margin: 0px auto;">
            <tr>
                <td colspan="4"><button type="button" onclick="addFishTicket()" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">추가</button></td>
            </tr>
        </table><br>

        <div style="width: 40%; margin: 0px auto 5px auto; color: rgb(59, 175, 252);">
            어종 추가
        </div>
        <table id="fishKind" style="width: 40%; margin: 0px auto;">
            <tr>
                <td colspan="4"><input required placeholder="어종을 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
            </tr>
        </table>
        <table style="width: 40%; margin: 0px auto;">
            <tr>
                <td colspan="4"><button type="button" onclick="addFishKind()" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">추가</button></td>
            </tr>
        </table><br>
        

        <table style="width: 40%; margin: 0px auto;">
            <tr>
                <td style="width: 25%;">주중 영업 시간</td>
                <td style="width: 25%">
                    <select class="form-select">
                        <option value="00:00">00:00</option>
                        <option value="01:00">01:00</option>
                        <option value="02:00">02:00</option>
                        <option value="03:00">03:00</option>
                        <option value="04:00">04:00</option>
                        <option value="05:00">05:00</option>
                        <option value="06:00">06:00</option>
                        <option value="07:00">07:00</option>
                        <option value="08:00">08:00</option>
                        <option value="09:00">09:00</option>
                        <option value="10:00">10:00</option>
                        <option value="11:00">11:00</option>
                        <option value="12:00">12:00</option>
                        <option value="13:00">13:00</option>
                        <option value="14:00">14:00</option>
                        <option value="15:00">15:00</option>
                        <option value="16:00">16:00</option>
                        <option value="17:00">17:00</option>
                        <option value="18:00">18:00</option>
                        <option value="19:00">19:00</option>
                        <option value="20:00">20:00</option>
                        <option value="21:00">21:00</option>
                        <option value="22:00">22:00</option>
                        <option value="23:00">23:00</option>
                    </select>
                </td>
                <td align="center">~</td>
                <td style="width: 25%;">
                    <select class="form-select">
                        <option value="00:00">00:00</option>
                        <option value="01:00">01:00</option>
                        <option value="02:00">02:00</option>
                        <option value="03:00">03:00</option>
                        <option value="04:00">04:00</option>
                        <option value="05:00">05:00</option>
                        <option value="06:00">06:00</option>
                        <option value="07:00">07:00</option>
                        <option value="08:00">08:00</option>
                        <option value="09:00">09:00</option>
                        <option value="10:00">10:00</option>
                        <option value="11:00">11:00</option>
                        <option value="12:00">12:00</option>
                        <option value="13:00">13:00</option>
                        <option value="14:00">14:00</option>
                        <option value="15:00">15:00</option>
                        <option value="16:00">16:00</option>
                        <option value="17:00">17:00</option>
                        <option value="18:00">18:00</option>
                        <option value="19:00">19:00</option>
                        <option value="20:00">20:00</option>
                        <option value="21:00">21:00</option>
                        <option value="22:00">22:00</option>
                        <option value="23:00">23:00</option>
                    </select>
                </td>
            </tr>
            <table style="width: 40%; margin: 0px auto;">
                <tr>
                    <td style="width: 25%;">주말 영업 시간</td>
                    <td style="width: 25%">
                        <select class="form-select">
                            <option value="00:00">00:00</option>
                            <option value="01:00">01:00</option>
                            <option value="02:00">02:00</option>
                            <option value="03:00">03:00</option>
                            <option value="04:00">04:00</option>
                            <option value="05:00">05:00</option>
                            <option value="06:00">06:00</option>
                            <option value="07:00">07:00</option>
                            <option value="08:00">08:00</option>
                            <option value="09:00">09:00</option>
                            <option value="10:00">10:00</option>
                            <option value="11:00">11:00</option>
                            <option value="12:00">12:00</option>
                            <option value="13:00">13:00</option>
                            <option value="14:00">14:00</option>
                            <option value="15:00">15:00</option>
                            <option value="16:00">16:00</option>
                            <option value="17:00">17:00</option>
                            <option value="18:00">18:00</option>
                            <option value="19:00">19:00</option>
                            <option value="20:00">20:00</option>
                            <option value="21:00">21:00</option>
                            <option value="22:00">22:00</option>
                            <option value="23:00">23:00</option>
                        </select>
                    </td>
                    <td align="center">~</td>
                    <td style="width: 25%;">
                        <select class="form-select">
                            <option value="00:00">00:00</option>
                            <option value="01:00">01:00</option>
                            <option value="02:00">02:00</option>
                            <option value="03:00">03:00</option>
                            <option value="04:00">04:00</option>
                            <option value="05:00">05:00</option>
                            <option value="06:00">06:00</option>
                            <option value="07:00">07:00</option>
                            <option value="08:00">08:00</option>
                            <option value="09:00">09:00</option>
                            <option value="10:00">10:00</option>
                            <option value="11:00">11:00</option>
                            <option value="12:00">12:00</option>
                            <option value="13:00">13:00</option>
                            <option value="14:00">14:00</option>
                            <option value="15:00">15:00</option>
                            <option value="16:00">16:00</option>
                            <option value="17:00">17:00</option>
                            <option value="18:00">18:00</option>
                            <option value="19:00">19:00</option>
                            <option value="20:00">20:00</option>
                            <option value="21:00">21:00</option>
                            <option value="22:00">22:00</option>
                            <option value="23:00">23:00</option>
                        </select>
                    </td>
                </tr>

        </table><br>

        <table style="width: 40%; margin: 0px auto;">
            <tr>
                <td style="width: 25%;">단체 가능 여부</td>
                <td>
                    가능&nbsp;<input checked type="radio" name="group" value="Y">
                    &nbsp;&nbsp;&nbsp;
                    불가능&nbsp;<input type="radio" name="group" value="N">
                </td>
            </tr>
        </table><br>

        <table style="width: 40%; margin: 0px auto;">
            <tr>
                <td style="width: 25%;">좌석 수</td>
                <td style="width: 25%;"><input required placeholder="" style="width: 100%;" class="form-control" type="number"></td>
                <td>석</td>
            </tr>
        </table><br>
        <div style="width: 40%; margin: 0px auto 5px auto; color: rgb(59, 175, 252);">
            대표 사진
        </div>
        <table style="width: 40%; margin: 0px auto;">
            <tr>
                <td><input required onchange="loadImg(this,1)" class="form-control" type="file"></td>
            </tr>
            <tr>
                <td style="height: 250px; border: 2px solid gray; margin: 0px auto;">
                    <img style="display: flex; max-width: 100%; max-height: 100%; margin: 0px auto;" id="title-img" src="resources/images/fileInput.png" alt="">
                </td>
            </tr>
        </table><br>

        <div style="width: 40%; margin: 0px auto 5px auto; color: rgb(59, 175, 252);">
            상세 사진 (최대 6장까지 가능합니다.)
        </div>
        <table style="width: 40%; margin: 0px auto;">
            <tr>
                <td><input onchange="loadImg(this,2)" class="form-control" type="file"></td>
                <td><input onchange="loadImg(this,3)" class="form-control" type="file"></td>
                <td><input onchange="loadImg(this,4)" class="form-control" type="file"></td>
            </tr>

            <tr>
                <td style="height: 250px; border: 2px solid gray; margin: 0px auto;">
                    <img style="display: flex; max-width: 100%; max-height: 100%; margin: 0px auto;" id="content-img1" src="resources/images/fileInput.png" alt="">
                </td>
                <td style="height: 250px; border: 2px solid gray; margin: 0px auto;">
                    <img style="display: flex; max-width: 100%; max-height: 100%; margin: 0px auto;" id="content-img2" src="resources/images/fileInput.png" alt="">
                </td>
                <td style="height: 250px; border: 2px solid gray; margin: 0px auto;">
                    <img style="display: flex; max-width: 100%; max-height: 100%; margin: 0px auto;" id="content-img3" src="resources/images/fileInput.png" alt="">
                </td>
            </tr>

            <tr>
                <td><input onchange="loadImg(this,5)" class="form-control" type="file"></td>
                <td><input onchange="loadImg(this,6)" class="form-control" type="file"></td>
                <td><input onchange="loadImg(this,7)" class="form-control" type="file"></td>
            </tr>

            <tr>
                <td style="height: 250px; border: 2px solid gray; margin: 0px auto;">
                    <img style="display: flex; max-width: 100%; max-height: 100%; margin: 0px auto;" id="content-img4" src="resources/images/fileInput.png" alt="">
                </td>
                <td style="height: 250px; border: 2px solid gray; margin: 0px auto;">
                    <img style="display: flex; max-width: 100%; max-height: 100%; margin: 0px auto;" id="content-img5" src="resources/images/fileInput.png" alt="">
                </td>
                <td style="height: 250px; border: 2px solid gray; margin: 0px auto;">
                    <img style="display: flex; max-width: 100%; max-height: 100%; margin: 0px auto;" id="content-img6" src="resources/images/fileInput.png" alt="">
                </td>
            </tr>
        </table><br>

        <div style="display: flex; margin: 0px auto; width: 40%;">
            <button id="enroll-btn" type="submit" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">회원가입</button></td>
        </div>
    </form>

    
</div>
    <div style="display: flex;width: 80%;justify-content: flex-end; align-items: baseline;">
        <label for="topButton">위로 이동</label>
        <img id="topButton" name="topButton" style="cursor: pointer; width: 30px; height: 30px;" onclick="moveTop()" src="resources/images/topButton.png" alt="">
    </div>

<br><br>
<jsp:include page="../common/footer.jsp"/>

</body>
</html>