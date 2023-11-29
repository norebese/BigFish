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