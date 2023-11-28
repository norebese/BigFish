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

function addFishKind(){
    const fishKind = document.getElementById("fishKind");
    
    fishKind.innerHTML += '<br><tr><td colspan="4"><input placeholder="어종을 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td></tr>'
}

function addFishTicket(){
    const fishTicket = document.getElementById("fishTicket");

    fishTicket.innerHTML += '<br><tr><td style="width: 18%;">이용권 이름</td><td colspan="3"><input placeholder="이용권 이름을 입력해주세요." style="width: 100%; margin: 0px auto;" class="form-control" type="text"></td></tr><tr><td style="width: 18%;">이용권 가격</td><td><input placeholder="원" style="width: 100%; margin: 0px auto;" class="form-control" type="number"></td><td style="width: 15%;">이용 시간</td><td><input placeholder="시간" style="width: 100%; margin: 0px auto;" class="form-control" type="number"></td></tr>'
}


