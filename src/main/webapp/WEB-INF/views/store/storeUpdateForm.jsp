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

<!-- memberAPI-->
<script src="<%=contextPath%>/resources/js/service/member-api.js"></script>

<!-- storeAPI-->
<script src="<%=contextPath%>/resources/js/service/store-api.js"></script>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 주소 검색 API (다음카카오)-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
        <form class="input-form" action="storeUpdate" method="post" enctype="multipart/form-data">
        <input type="hidden" name="storeNo" value="${storeInfo.storeNo}">
        <input required name="storeName" placeholder="사업장 이름을 입력해주세요." value="${storeInfo.storeName}" style="width: 40%; margin: 0px auto;" class="form-control" type="text"><br>
        <input required name="storePhone" placeholder="사업장 전화번호를 입력해주세요.(-제외)" value="${storeInfo.storePhone}" style="width: 40%; margin: 0px auto;" class="form-control" type="text"><br>
        <table style="width: 40%; margin: 0px auto;">
            <tr style="width: 100%;">
                <td><input name="businessNo" required id="businessNo" placeholder="사업자 번호를 입력해주세요." value="${storeInfo.businessNo}" readonly style="background: rgb(230, 227, 227); width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
                <td><button type="button" onclick="checkBusinessNo()" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">사업자 확인</button></td>
            </tr>
            <tr>
                <td id="checkBusinessNoSpace" style="height: 25px; font-size: 14px;">사업자 번호는 변경이 불가합니다.</td>
            </tr>
        </table>
        <br>
        <div style="width: 40%; margin: 0px auto 5px auto; color: rgb(59, 175, 252);">
            사업 종류
        </div>
        <div style="display: flex; margin: 0px auto; width: 40%;">
        <select name="storeKind" class="form-select" style="width: 100%;">
            <option id="seaShip" value="seaShip">바다 배</option>
            <option id="seaSeat" value="seaSeat">바다 좌대</option>
            <option id="FreshSeat" value="freshSeat">민물 좌대</option>
            <option id="FreshCafe" value="freshCafe">낚시카페</option>
        </select>
        </div><br>
        <table style="width: 40%; margin: 0px auto;">
            <tr style="width: 100%;">
                <td><input id="locationBig" name="locationBig" value="${storeInfo.locationBig}" required readonly placeholder="지역 선택 버튼으로 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
                <td><input id="locationSmall" name="locationSmall" value="${storeInfo.locationSmall}" required readonly placeholder="지역 선택 버튼으로 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
                <td><button type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">지역 선택</button></td>
            </tr>
        </table><br>
        <table style="width: 40%; margin: 0px auto;">
            <tr style="width: 100%;">
                <td><input name="storePostNo" placeholder="우편번호" id="postcode" value="${storeInfo.storePostNo}" readonly style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
                <td><button onclick="sample6_execDaumPostcode()" type="button" style="width: 100%; height: 38px; background: rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">주소 검색</button></td>
            </tr>
            <tr>
                <td colspan="2"><input name="storeAddress" readonly id="address" value="${storeInfo.storeAddress}" placeholder="주소 검색 버튼으로 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td>
            </tr>
            <tr>
                <td colspan="2"><input name="storeAddressDetail" required id="addressDetail" value="${storeInfo.storeAddressDetail}" placeholder="상세 주소를 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"><br></td>
            </tr>
        </table><br>
        <div style="width: 40%; margin: 0px auto 5px auto; color: rgb(59, 175, 252);">
            이용권 추가
        </div>
        <table id="fishTicket" style="width: 40%; margin: 0px auto;">

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
                    <select name="storeWeekdayArray" id="weekdayStart" class="form-select">
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
                    <select name="storeWeekdayArray" id="weekdayEnd" class="form-select">
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
                        <select name="storeWeekendArray" id="weekendStart" class="form-select">
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
                        <select name="storeWeekendArray" id="weekendEnd" class="form-select">
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
                <td id="storeGroupArea">
                    가능&nbsp;<input type="radio" name="storeGroup" value="Y">
                    &nbsp;&nbsp;&nbsp;
                    불가능&nbsp;<input type="radio" name="storeGroup" value="N">
                </td>
            </tr>
        </table><br>

        <table style="width: 40%; margin: 0px auto;">
            <tr>
                <td style="width: 25%;">좌석 수</td>
                <td style="width: 25%;"><input required name="maxMember" value="${storeInfo.maxMember}" style="width: 100%;" class="form-control" type="number"></td>
                <td>석</td>
            </tr>
        </table><br>
        <div style="width: 40%; margin: 0px auto 5px auto; color: rgb(59, 175, 252);">
            대표 사진
        </div>
        <table style="width: 40%; margin: 0px auto;">
            <tr>
                <td><input id="title-input" onchange="loadImg(this,1)" name="upfile" class="form-control" type="file"></td>
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
                <td><input id="content-input1" onchange="loadImg(this,2)" name="upfile" class="form-control" type="file"></td>
                <td><input id="content-input2" onchange="loadImg(this,3)" name="upfile" class="form-control" type="file"></td>
                <td><input id="content-input3" onchange="loadImg(this,4)" name="upfile" class="form-control" type="file"></td>
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
                <td><input id="content-input4" onchange="loadImg(this,5)" name="upfile" class="form-control" type="file"></td>
                <td><input id="content-input5" onchange="loadImg(this,6)" name="upfile" class="form-control" type="file"></td>
                <td><input id="content-input6" onchange="loadImg(this,7)" name="upfile" class="form-control" type="file"></td>
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

        <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">지역선택</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div for="selectRegion" style="font-size: 18px;">지역</div>
                        <select id="selectRegion" class="form-select" aria-label="Default select example">
                            <option>서울</option>
                            <option>경기북부</option>
                            <option>경기남부</option>
                            <option>인천</option>
                            <option>강원</option>
                            <option>충북</option>
                            <option>충남</option>
                            <option>전라</option>
                            <option>경상</option>
                            <option>제주</option>
                        </select>
                        <div for="selectCity" style="font-size: 18px;">도시</div>
                            <select id="selectCity" class="form-select" aria-label="Default select example">
                            <!-- 도시 목록은 JavaScript를 통해 동적으로 추가됩니다. -->
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="confirmBtn">확인</button>
                        </div>
            </div>
        </div>	
    </div>


<br><br>
<jsp:include page="../common/footer.jsp"/>

<script>
    window.onload = function(){
        // storeKind 설정
        const storeKindSelected = document.getElementById("${storeInfo.storeKind}");
        storeKindSelected.setAttribute("selected",true);

        // storeWeekday 설정
        const storeWeekdayStartSelected = document.querySelector("#weekdayStart > option[value='${weekdayStart}']");
        const storeWeekdayendSelected = document.querySelector("#weekdayEnd > option[value='${weekdayEnd}']");

        storeWeekdayStartSelected.setAttribute("selected",true);
        storeWeekdayendSelected.setAttribute("selected",true);
        // storeWeekend 설정
        const storeWeekendStartSelected = document.querySelector("#weekendStart > option[value='${weekendStart}']");
        const storeWeekendEndSelected = document.querySelector("#weekendEnd > option[value='${weekendEnd}']");

        storeWeekendStartSelected.setAttribute("selected",true);
        storeWeekendEndSelected.setAttribute("selected",true);

        // storeGroup 설정
        const storeGroup = document.querySelector("#storeGroupArea > input[value='${storeInfo.storeGroup}']");
        storeGroup.setAttribute("checked",true);

        // 어종 설정
        const fishKindArea = document.querySelector("#fishKind");
        const arr = "${fishKindArr}".split("/");
        
        

        for(let fish of arr){
            fishKind.insertAdjacentHTML("afterbegin",'<tr><td colspan="4"><input name="StoreFishKindArray" value="'+fish+'" placeholder="어종을 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td></tr><br>');
        }
        
        
        // 이용권 설정
        let fishTicket = document.querySelector("#fishTicket");
        for(let t of ${ticketArr}){
            console.log(t.ticketName);

            fishTicket.insertAdjacentHTML("afterbegin",'<tr><td style="width: 18%;">이용권 이름</td><td colspan="3"><input value="'+t.ticketName+'" name="ticketNameArray" placeholder="이용권 이름을 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td></tr><tr><td style="width: 18%;">이용권 가격</td><td><input value="'+t.ticketPrice+'" name="ticketPriceArray" placeholder="원" style="width: 100%; margin: 0px auto;" class="form-control" type="number"></td><td style="width: 15%;">이용 시간</td><td><input value="'+t.ticketTime+'" name="ticketTimeArray" placeholder="시간" style="width: 100%; margin: 0px auto;" class="form-control" type="number"></td></tr><br>');
        }
        
        let num = 0;
        for(let att of ${attArr}){
            
            if(num===0){
                document.querySelector("#title-img").src = "resources/uploadFiles/"+att.changeName;
            }else{
                document.querySelector("#content-img"+num).src = "resources/uploadFiles/"+att.changeName;
            }
            num++;
        }

   
        
     

        
        
        
    }


</script>

</body>
</html>