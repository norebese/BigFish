function changePersonal(){
    const personalBtn = document.querySelector("#personal-login");
    const companyBtn = document.querySelector("#company-login");
    const personalInput = document.querySelector("#personal-input");
    const personalButton = document.querySelector("#personal-button");
    const personalNaverkakao = document.querySelector("#personal-naverkakao");
    const companyInput = document.querySelector("#company-input");
    const companyButton = document.querySelector("#company-button");
    const companyNaverkakao = document.querySelector("#company-naverkakao");
    
    personalInput.style.display = 'block';
    personalButton.style.display = 'flex';
    personalNaverkakao.style.display = 'flex';
    companyInput.style.display = 'none';
    companyButton.style.display = 'none';
    companyNaverkakao.style.display = 'none';
    personalBtn.classList.replace('btn-secondary','btn-primary');
    companyBtn.classList.replace('btn-primary','btn-secondary');
    
}

function changeCompany(){
    const personalBtn = document.querySelector("#personal-login");
    const companyBtn = document.querySelector("#company-login");
    const personalInput = document.querySelector("#personal-input");
    const personalButton = document.querySelector("#personal-button");
    const personalNaverkakao = document.querySelector("#personal-naverkakao");
    const companyInput = document.querySelector("#company-input");
    const companyButton = document.querySelector("#company-button");
    const companyNaverkakao = document.querySelector("#company-naverkakao");

    

    personalBtn.classList.replace('btn-primary','btn-secondary');
    companyBtn.classList.replace('btn-secondary','btn-primary');
    personalInput.style.display = 'none';
    personalButton.style.display = 'none';
    personalNaverkakao.style.display = 'none';
    companyInput.style.display = 'block';
    companyButton.style.display = 'flex';
    companyNaverkakao.style.display = 'flex';
    
}

    // // 네이버 로그인을 위한 팝업창 생성
    // function showLoginPopup(){
    //     let uri = 'https://nid.naver.com/oauth2.0/authorize?' +
    //         'response_type=code' +                  // 인증과정에 대한 내부 구분값 code 로 전송 (고정값 수정 X)
    //         '&client_id=nDDTuqLHbp7bBSNPwEfS' +     // 발급받은 client_id 를 입력
    //         '&state=NAVER_LOGIN_TEST' +             // CORS 를 방지하기 위한 특정 토큰값(임의값 사용)
    //         '&redirect_uri=http://localhost:8987/naverLogin.me';   // 어플케이션에서 등록했던 CallBack URL를 입력

    //     location.href = uri;
    // }

    // // 네이버 로그인

    // var naver_id_login = new naver_id_login("nDDTuqLHbp7bBSNPwEfS", "http://localhost:8987/bigFish/personalEnrollForm.me");
    // var state = naver_id_login.getUniqState();
    // naver_id_login.setButton("white", 2,40);
    // naver_id_login.setDomain("http://localhost:8987/bigFish");
    // naver_id_login.setState(state);
    // naver_id_login.setPopup();
    // naver_id_login.init_naver_id_login();



 




