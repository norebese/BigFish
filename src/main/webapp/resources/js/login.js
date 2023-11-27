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