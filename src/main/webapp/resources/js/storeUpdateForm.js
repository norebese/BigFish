function moveTop(){
    $("html, body").animate({ scrollTop: 0 }, 600);
    
}



function loadImg(inputFile, num){
    
    //inputFile : 현재 변화가 생긴 input type=file 요소객체
    // num : 몇번째 input요소인지 확인하기위한 파라미터
    
    //inputFile.files[0]에 선택된 파일이 담겨있을 것이다.
    //inputFile.files.length => 1일 것이다.

    if(inputFile.files.length == 1) { // 파일이 선택된 경우 => 미리보기 나타나게
        //파일을 읽어들일 FileReader객체 생성
        const reader = new FileReader();

        //파일을 읽어들이는 메소드
        //해당파일을 읽어들이는 순간 해당 파일만의 고유한 url부여
        reader.readAsDataURL(inputFile.files[0]);
        
        //파일 읽어들이기 완료했을 때 실행할 함수 정의
        reader.onload = function(ev){          
            //ev.target.result => 읽어들인 파일의 고유한 url
            switch(num){
                case 1: document.getElementById('title-img').src = ev.target.result; break;
                case 2: document.getElementById('content-img1').src = ev.target.result; break;
                case 3: document.getElementById('content-img2').src = ev.target.result; break;
                case 4: document.getElementById('content-img3').src = ev.target.result; break;
                case 5: document.getElementById('content-img4').src = ev.target.result; break;
                case 6: document.getElementById('content-img5').src = ev.target.result; break;
                case 7: document.getElementById('content-img6').src = ev.target.result;
            }
        }

    } else { // 선택된 파일이 취소된 경우 => 미리보기 사라지게
        switch(num){
            case 1: document.getElementById('title-img').src = null; break;
            case 2: document.getElementById('content-img1').src = null; break;
            case 3: document.getElementById('content-img2').src = null; break;
            case 4: document.getElementById('content-img3').src = null; break;
            case 5: document.getElementById('content-img4').src = null; break;
            case 6: document.getElementById('content-img5').src = null; break;
            case 7: document.getElementById('content-img6').src = null;
        }
    }
}

// 어종 추가
function addFishKind(){
    const fishKind = document.getElementById("fishKind");
    
    fishKind.insertAdjacentHTML("beforeend",'<tr><td colspan="4"><input name="StoreFishKindArray" placeholder="어종을 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td></tr><br>');
}

// 이용권 추가
function addFishTicket(){
    const fishTicket = document.getElementById("fishTicket");

    fishTicket.insertAdjacentHTML("beforeend",'<tr><td style="width: 18%;">이용권 이름</td><td colspan="3"><input name="ticketNameArray" placeholder="이용권 이름을 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td></tr><tr><td style="width: 18%;">이용권 가격</td><td><input name="ticketPriceArray" placeholder="원" style="width: 100%; margin: 0px auto;" class="form-control" type="number"></td><td style="width: 15%;">이용 시간</td><td><input name="ticketTimeArray" placeholder="시간" style="width: 100%; margin: 0px auto;" class="form-control" type="number"></td></tr><br>');
}

// 회원 가입 시 닉네임 중복체크 (사용 가능 시 "Y" 반환 사용 불가능 시 "N" 반환)
function checkNick(){
    const memNick = document.querySelector("#memNick");
    const checkNickSpace = document.querySelector("#checkNickSpace");
    const enrollBtn = document.querySelector("#enroll-btn");
    const sendData = {memNick : memNick.value};
    
    memberApi.checkNick(sendData, function(result){
        if(result==="Y"){
            // 사용 가능한 경우
            checkNickSpace.innerHTML = "사용 가능한 닉네임입니다.";
            checkNickSpace.style.color = "#2f9947";
            enrollBtn.removeAttribute("disabled");
        }else{
            // 사용 불가능한 경우
            checkNickSpace.innerHTML = "사용 불가능한 닉네임입니다.";
            checkNickSpace.style.color = "#dd2f35";
            enrollBtn.setAttribute("disabled",true);
        }
    })

}

// 사업자 번호 유효성 체크 및 중복 체크 공공데이터 API
function checkBusinessNo(){

    const businessNo = document.querySelector("#businessNo");
    const checkBusinessNoSpace = document.querySelector("#checkBusinessNoSpace");
    const checkBnoSendData = {b_no : [businessNo.value]};
    const checkSameBnoSendData = {businessNo: businessNo.value+""};
    const enrollBtn = document.querySelector("#enroll-btn");

    storeApi.checkBno(checkBnoSendData, function(result){
        console.log(result);
        console.log(result.data[0].b_stt_cd==="01");
        if(result.data[0].b_stt_cd==="01"){
            
            storeApi.checkSameBno(checkSameBnoSendData,function(result){
                if(result==="Y"){
                    checkBusinessNoSpace.innerHTML = "사용 가능한 사업자 번호입니다."
                    checkBusinessNoSpace.style.color = "#2f9947";
                    enrollBtn.removeAttribute("disabled");
                }else{
                    checkBusinessNoSpace.innerHTML = "이미 등록된 사업자 번호입니다."
                    checkBusinessNoSpace.style.color = "#dd2f35";
                    enrollBtn.setAttribute("disabled",true);
                }
            })
        }else{
            checkBusinessNoSpace.innerHTML = "잘못된 사업자 번호입니다."
            checkBusinessNoSpace.style.color = "#dd2f35";
            enrollBtn.setAttribute("disabled",true);
        }

    
    })

}

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            // if(data.userSelectedType === 'R'){
            //     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            //     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            //     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
            //         extraAddr += data.bname;
            //     }
            //     // 건물명이 있고, 공동주택일 경우 추가한다.
            //     if(data.buildingName !== '' && data.apartment === 'Y'){
            //         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            //     }
            //     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            //     if(extraAddr !== ''){
            //         extraAddr = ' (' + extraAddr + ')';
            //     }
            //     // 조합된 참고항목을 해당 필드에 넣는다.
            //     document.getElementById("sample6_extraAddress").value = extraAddr;
            
            // } else {
            //     document.getElementById("sample6_extraAddress").value = '';
            // }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addressDetail").focus();
        }
    }).open();


    






}

document.addEventListener("DOMContentLoaded", function () {

    let selectRegion = document.getElementById("selectRegion");
    
    let selectCity = document.getElementById("selectCity");
    
    let confirmBtn = document.getElementById("confirmBtn");
       
    
    let cityData = {
    
    서울: ["강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동작구", "서대문구", "서초구", "성북구", "송파구", "은평구", "종로구"],
    
    경기북부: ["고양시", "구리시", "김포시", "남양주시", "양주시", "의정부시", "파주시", "포천시", "가평군", "양평군", "연천군"],
    
    경기남부: ["광명시", "광주시", "군포시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "여주시", "오산시", "용인시", "이천시", "평택시", "화성시"],
    
    인천: ["남구", "남동구", "부평구", "서구", "중구", "강화군"],
    
    강원: ["강릉시", "원주시", "춘천시", "영월군", "철원군", "평창군", "홍천군", "화천군", "횡성군"],
    
    충북: ["제천시", "청주시", "충주시", "괴산군","보은군", "옥천군", "음성군", "진천군"],

    충남: ["대전 서구", "대전 중구", "공주시", "계롱시", "논산시", "서산시", "아산시", "천안시", "금산군", "당진시", "부여군", "서천군", "예산군", "세종특별자치시", "태안군"],

    전라: ["광주 광산구", "광주 동구", "광주 서구", "익산시", "전주시", "정읍시", "완주군", "임실군", "나주시", "장성군", "속화초"],

    경상: ["부산 강서구", "부산 금정구", "부산 부산진구", "부산 기장군", "대구 달서구", "대구 북구", "대구 중구", "대구달성군", "울산 남구", "울산 중구", "경북 경산시", "경북 경주시", "경북 구미시", "경북 문경시", "경북 영천시", "경북 포항시", "경북 문경시", "경북 영천시", "경북 포항시", "경북 고령군", "경북 의성군", "경북 청도군", "경북 칠곡군", "경남 김해시", "경남 양산시", "경남 창원시", "경남 의령군", "경남 창녕군"],

    제주: ["제주", "서귀포시"]
    
    };
    
    
    // 초기 지역에 따라 도시 목록 설정
    
    updateCityOptions(selectRegion.value);
    
    
    // 지역 선택 변경 시 도시 목록 업데이트
    
    selectRegion.addEventListener("change", function () {
    
    updateCityOptions(selectRegion.value);
    
    });
    
    
    // 확인 버튼 클릭 시 선택한 지역과 도시 출력
    
    confirmBtn.addEventListener("click", function () {
    
    selectedRegion = selectRegion.value;
    
    selectedCity = selectCity.value;
    
    // alert("선택한 지역: " + selectedRegion + "\n선택한 도시: " + selectedCity);
    
    document.getElementById("locationBig").value = selectedRegion;
    document.getElementById("locationSmall").value = selectedCity;    


    // 여기에서 원하는 작업 수행
    
    
    });
    
    
    // 도시 목록 업데이트 함수
    
    function updateCityOptions(region) {
    
    // 기존 도시 목록 제거
    
    selectCity.innerHTML = "";
    
    
    // 선택된 지역에 해당하는 도시 목록 추가
    
    cityData[region].forEach(function (city) {
    
    var option = document.createElement("option");
    
    option.value = city;
    
    option.text = city;
    
    selectCity.appendChild(option);
    
    });
    
    }
    
    });



