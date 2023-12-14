function showProfile(){
    const profileWork = document.querySelector("#profileWork");
    const businessWork = document.querySelector("#businessWork");
    const buttonProfile = document.querySelector("#buttonProfile");
    const buttonBusiness = document.querySelector("#buttonBusiness");
    const sample1Work = document.querySelector("#sample1Work");
    const btns = document.getElementsByClassName("businessButton");

    for(let btn of btns){
        btn.style.background = "rgb(59, 175, 252)";
    }

    profileWork.style.display = "flex";
    businessWork.style.display = "none";
    sample1Work.style.display = "none";

    buttonProfile.style.background = "rgb(28, 134, 204)";
    buttonBusiness.style.background = "rgb(59, 175, 252)";
    
    
}

function showBusiness(){
    const profileWork = document.querySelector("#profileWork");
    const businessWork = document.querySelector("#businessWork");
    const buttonProfile = document.querySelector("#buttonProfile");
    const buttonBusiness = document.querySelector("#buttonBusiness");
    const sample1Work = document.querySelector("#sample1Work");
    const btns = document.getElementsByClassName("businessButton");

    for(let btn of btns){
        btn.style.background = "rgb(59, 175, 252)";
    }

    profileWork.style.display = "none";
    businessWork.style.display = "flex";
    sample1Work.style.display = "none";

    buttonProfile.style.background = "rgb(59, 175, 252)";
    buttonBusiness.style.background = "rgb(28, 134, 204)";

}

function showSample1(){

    const profileWork = document.querySelector("#profileWork");
    const businessWork = document.querySelector("#businessWork");
    const buttonProfile = document.querySelector("#buttonProfile");
    const buttonBusiness = document.querySelector("#buttonBusiness");
    const sample1Work = document.querySelector("#sample1Work");
    const btns = document.getElementsByClassName("businessButton");
    const buttonSample1 = this.event.target;

    profileWork.style.display = "none";
    businessWork.style.display = "none";
    sample1Work.style.display = "flex";

    for(let btn of btns){
        btn.style.background = "rgb(59, 175, 252)";
    }

    buttonProfile.style.background = "rgb(59, 175, 252)";
    buttonBusiness.style.background = "rgb(59, 175, 252)";
    buttonSample1.style.background = "rgb(28, 134, 204)";

}

function loadBusinessAjax(){

}


window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
let today = new Date();     // 페이지를 로드한 날짜를 저장
today.setHours(0,0,0,0);    // 비교 편의를 위해 today의 시간을 초기화

// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
function buildCalendar() {

    let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
    let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

    let tbody_Calendar = document.querySelector(".Calendar > tbody");
    document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
    document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

    while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
        tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
    }

    let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

    for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
        let nowColumn = nowRow.insertCell();        // 열 추가
    }

    for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

        let nowColumn = nowRow.insertCell();        // 새 열을 추가하고
        nowColumn.innerText = leftPad(nowDay.getDate());      // 추가한 열에 날짜 입력

    
        if (nowDay.getDay() == 0) {                 // 일요일인 경우 글자색 빨강으로
            nowColumn.style.color = "#DC143C";
        }
        if (nowDay.getDay() == 6) {                 // 토요일인 경우 글자색 파랑으로 하고
            nowColumn.style.color = "#0000CD";
            nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
        }


        if (nowDay < today) {                       // 지난날인 경우
            nowColumn.className = "pastDay";
        }
        else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
            nowColumn.className = "today";
            nowColumn.onclick = function () { choiceDate(this); }
        }
        else {                                      // 미래인 경우
            nowColumn.className = "futureDay";
            nowColumn.onclick = function () { choiceDate(this); }
        }
    }
}

// 날짜 선택
function choiceDate(nowColumn) {
    if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
    }
    nowColumn.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
}

// 이전달 버튼 클릭
function prevCalendar() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
    document.querySelector("#next-btn").style.display = "table-cell";
    document.querySelector("#prev-btn").innerHTML="";
    let pbtn = document.getElementById("prev-btn");
    pbtn.removeEventListener("click", prevCalendar);
    buildCalendar();    // 달력 다시 생성
}
// 다음달 버튼 클릭
function nextCalendar() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
    document.querySelector("#next-btn").style.display = "none";
    document.querySelector("#prev-btn").innerHTML="&#60";
    let pbtn = document.getElementById("prev-btn");
    pbtn.addEventListener("click", prevCalendar);
    buildCalendar();    // 달력 다시 생성
    
    
}

// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
function leftPad(value) {
    if (value < 10) {
        value = "0" + value;
        return value;
    }
    return value;
}

// 마이페이지 프로필 이미지 변경
function profileImgChange(){
    const profileShowArea = document.querySelector("#profileShowArea");
    const memNo = document.querySelector("#memNo");
    const memChangeName = document.querySelector("#memChangeName");
    const profileImg = document.querySelector("#profileImg");
    

    let formData = new FormData();
        formData.append("profileImg",profileImg.files[0]);
        formData.append("memNo",memNo.value);
        formData.append("memChangeName",memChangeName.value);
                    
    memberApi.profileImgAreaChange(formData, function(result){
        profileShowArea.src = result;
    })

    

}

// 사업 상태 변경
function updateStoreStatus(ev, storeName){
    
    console.log(storeName);
    console.log(ev.dataset.storeNo);
    console.log(ev.dataset.storeStatus);

    sendData = {storeNo : ev.dataset.storeNo,
                storeStatus : ev.dataset.storeStatus};

    storeApi.updateStoreStatus(sendData, function(result){
        if(result>0){
            alert(storeName+" 사업장의 상태 변경에 성공했습니다.");
            if(ev.dataset.storeStatus==="open"){
                ev.dataset.storeStatus="stopOpen";
            }else{
                ev.dataset.storeStatus="open";
            }
        }else{
            alert(storeName+" 사업장의 상태 변경에 실패했습니다.");
        }
    })
    
}

function checkBusinessNoForDelete(){

    const deleteBusinessInput = document.querySelector("#deleteBusinessInput");
    const deleteBusinessArea = document.querySelector("#deleteBusinessArea");
    const deleteBusinessBtn = document.querySelector("#deleteBusinessBtn");
    

    sendData = {businessNo : deleteBusinessInput.value};

    storeApi.checkBusinessNoForDelete(sendData, function(result){
        if(result==="Y"){
            console.log("사업자 번호 일치");
            deleteBusinessArea.innerHTML = "삭제 버튼을 누를 경우 사업장이 삭제됩니다.";
            deleteBusinessArea.style.display = "flex";
            deleteBusinessBtn.removeAttribute("disabled");
        }else{
            console.log("사업자 번호 불일치");
            deleteBusinessArea.innerHTML = "삭제할 사업장의 사업자 번호를 정확히 입력해야합니다.";
            deleteBusinessArea.style.display = "flex";
            deleteBusinessBtn.setAttribute("disabled",true);
        }
    })

}

function businessDelete(){
    const deleteBusinessInput = document.querySelector("#deleteBusinessInput");

    location.href = "businessDelete?businessNo="+deleteBusinessInput.value;
}