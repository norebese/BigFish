function checkPwd(){
    let reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;

    const pwd = document.querySelector("#pwd");
    const passwordRule = document.querySelector("#passwordRule");
    const pwdCheckBtn = document.querySelector("#pwdCheck-btn");

    if(!reg.test(pwd.value)){
        passwordRule.style.display = "block";
        return;
    }

    passwordRule.style.display = "none";
    pwd.setAttribute("readonly",true);
    
    pwdCheckBtn.setAttribute("disabled",true);

}

function samePwd(){
    const pwd = document.querySelector("#pwd");
    const pwdAgain = document.querySelector("#pwdAgain");
    const checkPasswordRule = document.querySelector("#checkPasswordRule");
    const enrollBtn = document.querySelector("#enroll-btn");

    if(pwd.value!==pwdAgain.value){
        checkPasswordRule.style.display = "block";
        enrollBtn.setAttribute("disabled",true);
        return;
    }

    checkPasswordRule.style.display = "none";
    enrollBtn.removeAttribute("disabled");

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
    
    fishKind.insertAdjacentHTML("beforeend",'<br><tr><td colspan="4"><input placeholder="어종을 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td></tr>')
}

// 이용권 추가
function addFishTicket(){
    const fishTicket = document.getElementById("fishTicket");

    fishTicket.insertAdjacentHTML("beforeend",'<br><tr><td style="width: 18%;">이용권 이름</td><td colspan="3"><input placeholder="이용권 이름을 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td></tr><tr><td style="width: 18%;">이용권 가격</td><td><input placeholder="원" style="width: 100%; margin: 0px auto;" class="form-control" type="number"></td><td style="width: 15%;">이용 시간</td><td><input placeholder="시간" style="width: 100%; margin: 0px auto;" class="form-control" type="number"></td></tr>');
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
        }else{
            // 사용 불가능한 경우
            checkNickSpace.innerHTML = "사용 불가능한 닉네임입니다.";
            checkNickSpace.style.color = "#dd2f35";
            enrollBtn.setAttribute("disabled",true);
        }
    })

}

// 회원 가입 시 중복체크 (사용 가능 시 "Y" 반환 사용 불가능 시 "N" 반환)
function checkEmailId(){
    const emailId = document.querySelector("#emailId");
    const checkEmailIdSpace = document.querySelector("#checkEmailIdSpace");
    const enrollBtn = document.querySelector("#enroll-btn");
    
    const sendData = {emailId : emailId.value};
    memberApi.checkId(sendData, function(result){
        if(result==="Y"){
            // 사용 가능한 경우
            checkEmailIdSpace.innerHTML = "사용 가능한 아이디입니다.";
            checkEmailIdSpace.style.color = "#2f9947";
        }else{
            // 사용 불가능한 경우
            checkEmailIdSpace.innerHTML = "사용 불가능한 아이디입니다.";
            checkEmailIdSpace.style.color = "#dd2f35";
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

    storeApi.checkBno(checkBnoSendData, function(result){
        console.log(result);
        console.log(result.data[0].b_stt_cd==="01");
        if(result.data[0].b_stt_cd==="01"){
            
            storeApi.checkSameBno(checkSameBnoSendData,function(result){
                if(result==="Y"){
                    checkBusinessNoSpace.innerHTML = "사용 가능한 사업자 번호입니다."
                    checkBusinessNoSpace.style.color = "#2f9947";
                }else{
                    checkBusinessNoSpace.innerHTML = "이미 등록된 사업자 번호입니다."
                    checkBusinessNoSpace.style.color = "#dd2f35";
                }
            })
        }else{
            checkBusinessNoSpace.innerHTML = "잘못된 사업자 번호입니다."
            checkBusinessNoSpace.style.color = "#dd2f35";
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
