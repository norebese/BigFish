	let month;
    let day;
    let selectedTime;   
    let endTime;
   	let numPeople;
	let isChecked;
	let dateClicked;
    let ticketNo;
    let ticketTime;
	let rPage = 1;
	
	

function init(ad, name, sNum){

    let infobtn = document.querySelector('.detail-tab');
    let replybtn = document.querySelector('.reply-tab');

    let infodiv = document.querySelector('.map-plus');
    let replydiv = document.querySelector('.reply-area');
    
    let storeInfo = document.querySelector('.detail-tab');
    let replyInfo = document.querySelector('.reply-tab');
    
    storeInfo.addEventListener('click', function () {
        storeInfo.style.backgroundColor = 'rgb(41, 128, 185)';
        replyInfo.style.backgroundColor = '';
    });
    replyInfo.addEventListener('click', function () {
        replyInfo.style.backgroundColor = 'rgb(41, 128, 185)';
        storeInfo.style.backgroundColor = '';
    });

    infobtn.addEventListener('click', function() {
        infodiv.classList.add('on');
        replydiv.classList.remove('on');
    });

    // Event listener for the second button
    replybtn.addEventListener('click', function() {
        infodiv.classList.remove('on');
        replydiv.classList.add('on');
    });

	$(".today, .futureDay").on("click", function() {
            dateClicked = 'passed';
        	day = $(this).text();
        	
        });
	
	$(".form-select").change(function() {
        // 선택된 값을 가져와 변수에 저장
        selectedTime = $(this).val();
        
        if (!dateClicked) {
        // 날짜가 선택되지 않았으면 알림 띄우고 select 태그 초기화
        showDateAlert();
        return;
   		}
        console.log(selectedTime);
        loadTickets();
    });
    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
        
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(ad, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
        	
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
            
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    	} 
	});  

	const existingArray = JSON.parse(localStorage.getItem('sNumArray')) || [];
	const newValue = sNum; 
	
	const index = existingArray.indexOf(newValue);
	if (index !== -1) {
	  // 중복된 값이 이미 배열에 있을 경우 해당 값을 제거
	  existingArray.splice(index, 1);
	}
	
	// 새로운 값을 배열의 맨 앞에 삽입
	existingArray.unshift(newValue);
	
	// 배열의 길이가 5를 초과하는 경우 마지막 항목 제거
	if (existingArray.length > 5) {
	  existingArray.pop();
	}
	localStorage.setItem('sNumArray', JSON.stringify(existingArray));

}

function showDateAlert() {
    alert("날짜를 먼저 선택하세요.");
    // 해당 select 태그 초기화
    $(".form-select").val('');
}

function handleCheckboxClick(clickedCheckboxId, num) {
    isChecked = 'checkOk';
    // 모든 체크박스에 대해 반복
    $(".myCheckbox").each(function() {
        // 클릭한 체크박스가 아니면 언체크
        if ($(this).attr("id") !== clickedCheckboxId) {
            $(this).prop("checked", false);
        }else{
        	$(this).prop("checked", true);
        	ticketNo = this.value
        	ticketTime = num;
        	let [selectedHours, selectedMinutes] = selectedTime.split(":").map(Number);
        	let selectedTimeDt = new Date(Date.UTC(2023, 0, 1, selectedHours, selectedMinutes));
        	selectedTimeDt.setHours(selectedTimeDt.getHours() + num);
        	endTime = `${selectedTimeDt.getUTCHours().toString().padStart(2, '0')}:${selectedTimeDt.getUTCMinutes().toString().padStart(2, '0')}`;

			console.log("selectedTime: "+selectedTime);
            console.log("ticketNo: "+ticketNo);
            console.log("endTime: "+endTime);
            console.log("num: "+num);
        }
    });
}

function changeQuantity(inputId, change) {
        let inputElement = document.getElementById(inputId);
        let currentValue = parseInt(inputElement.value);

        // 값이 1보다 작지 않으면 감소 버튼이 눌려도 실행되지 않도록
        if (change === -1 && currentValue > 1) {
            inputElement.value = currentValue + change;
        }

        // 값을 증가시킴
        if (change === 1) {
            inputElement.value = currentValue + change;
        }
    }
    
    
function selectNum(targetId, maxNum){
	numPeople = document.getElementById(targetId).value;
	if(numPeople > maxNum){
		alert("남은 이용권이 부족합니다");
		numPeople = null;
	}

}
	
	
function updateTicket(date){
	
	let ToUpdate = $('#showTicket-area');
	let htmlContent = '';
	
	$.each(date, function (index, ticket) {
		let formattedMinPrice = new Intl.NumberFormat().format(ticket.ticketPrice);
				if(ticket.amount == 0){
					htmlContent += '<li class="option-item disabled-option">'
				}else{
					 htmlContent += '<li class="option-item">'
				}
                htmlContent +='<label style="display: flex; cursor: pointer;" id="checkboxLabel'+ticket.ticketNo+'" data-bs-toggle="modal" data-bs-target="#myModal'+ticket.ticketNo+'">'
        		+'<div class="checkbox-icon"><label for="myCheckbox'+ticket.ticketNo+'"><input type="checkbox" id="myCheckbox'+ticket.ticketNo+'" class="myCheckbox" data-target="#checkboxLabel'+ticket.ticketNo
                +`" onclick="handleCheckboxClick('myCheckbox` + ticket.ticketNo+`','`+ticket.ticketTime+ `')" value="`+ticket.ticketNo+'">'
        		+'</label></div><div class="option-info"><div class="info-text"><div class="boucher-title">'+ticket.ticketName+'</div>'
        		+'<div class="info-content"><span>남은 수량 : '+ticket.amount+' <br></span><span>가격 : '+formattedMinPrice+' 원<br></span><span>이용가능 시간 : </span>'
        		+'<span class="timeval">'+ticket.ticketTime+'</span><span>hr</span></div></div></div></label><div class="modal" id="myModal'+ticket.ticketNo+'">'
				+'<div class="modal-dialog modal-dialog-centered"><div class="modal-content"><div class="modal-header"><h4 class="modal-title">인원수 설정</h4>'
				+'<button type="button" class="btn-close" data-bs-dismiss="modal"></button></div><div class="modal-body"><label for="quantity'+ticket.ticketNo+'">인원수:</label>'
				+`<div class="input-group"><button type="button" class="btn btn-outline-secondary" onclick="changeQuantity('quantity`+ticket.ticketNo+`', -1)">-</button>`
				+'<input type="text" class="resnum-area" id="quantity'+ticket.ticketNo+'" value="1">'
				+`<button type="button" class="btn btn-outline-secondary" onclick="changeQuantity('quantity`+ticket.ticketNo+`', 1)">+</button>`
				+'</div></div><div class="modal-footer">'
				+`<button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="selectNum('quantity`+ticket.ticketNo+`',`+ticket.amount+`)">확인</button>'`
				+'</div></div></div></div></li>';
            });
    
	
	ToUpdate.html(htmlContent);
}

function updateReplyList(date, memNum){
	let divToUpdate = $('#showReplyArea');
	let htmlContent = '';
	
	$.each(date, function (index, reply) {
                htmlContent += '<div class="" style="border-bottom: solid 2px rgb(204,204,204);">'
	            +'<div class="row"><div class="col-sm" style="display: flex; align-items: center;">'
	            +'<i class="replyImg"><img src="/bigFish/'+reply.memProfileImg+'"></i><span >'+reply.replyWriter+'</span></div>'
	            +`<div class="col-md-8" style="display: flex; align-items: center;">`+reply.replyContent+`</div>`
	            +'<div class="col-sm" style="display: flex; align-items: center;">'+reply.replyCreateDate;
	            
	            if (reply.rmemNo == memNum) {
			        htmlContent += '<span id="dltBtn" onclick="dltReply(' + reply.replyNo + ')">삭제</span>';
			    }
	            
	            htmlContent += '</div></div></div>';
            });

	divToUpdate.html(htmlContent);
}

function updatePageBtn(startPage, endPage, currentPage){
	let liToUpdate = $('#pageNBtn');
	liToUpdate.empty();
	let buttonsHTML = '';

	for (let p = startPage; p <= endPage; p++) {
        buttonsHTML += '<li class="page-item';
        if (p === currentPage) {
            buttonsHTML += ' active';
        }
        buttonsHTML += '"><a class="page-link" href="#' + p + '" onclick="pageReply(' + p + ')">' + p + '</a></li>';
    }
    
    liToUpdate.html(buttonsHTML);
}

function updateReplyBtn(endPage, maxPage, currentPage){
	console.log(maxPage);
	if(maxPage == 1 || maxPage == 0){
		document.getElementById("prevBtn").style.display = "none";
		document.getElementById("nextBtn").style.display = "none";
	}else if(currentPage == 1){
		document.getElementById("prevBtn").style.display = "none";
		document.getElementById("nextBtn").style.display = "block";
	}else if(currentPage == maxPage){
		document.getElementById("prevBtn").style.display = "block";
		document.getElementById("nextBtn").style.display = "none";
	}else{
		document.getElementById("prevBtn").style.display = "block";
		document.getElementById("nextBtn").style.display = "block";
	}
	
}

function changeToTextarea() {
let rDetail = document.getElementById('rDetail');
let updateRDetail = document.getElementById('updateRDetail');
let updateBtn = document.getElementById('updateBtn');
let saveBtn = document.getElementById('saveBtn');
	updateRDetail.innerText = rDetail.innerText;
	rDetail.style.display = 'none';
	updateRDetail.style.display = 'block';
	updateBtn.style.display = 'none';
	saveBtn.style.display = 'block';
}

//상세정보 업데이트
function updateDetailInfo(storeNo){
	let infoVal = document.getElementById('updateRDetail').value;
	const sendData = { storeNum: storeNo,
			infoVal: infoVal
        };
	resApi.updateDetailInfo(sendData,function(data){
		if(data.info > 0){
 		   alert('업데이트 성공');
 		   rDetail.innerText = data.detail;
   	        rDetail.style.display = 'block';
   	        updateRDetail.style.display = 'none';
   	        updateBtn.style.display = 'block';
   	        saveBtn.style.display = 'none';
 	   }else{
 		   alert('업데이트 실패');
 	   }
	})
}

function dltReply(rNum){
	const sendData = { rNum: rNum};
	resApi.dltReply(sendData,function(data){
		alert('댓글이 삭제되었습니다.');
       	 updateReplyList(data.replyList, memNum);
       	 document.getElementById('content').value = '';
       	 let startPage = (data.replyPi.startPage);
       	 let endPage = (data.replyPi.endPage);
       	 let maxPage = (data.replyPi.maxPage);
       	 let currentPage = (data.replyPi.currentPage);
       	 updatePageBtn(startPage, endPage, currentPage);
       	 updateReplyBtn(endPage, maxPage, currentPage);
       	 document.getElementById('replyNum').innerHTML = '댓글 ('+(data.rNum)+')';
	})
}


function pageReply(num){
	let scrollTop = $(window).scrollTop();
	if(num === 'prev'){
		rPage--;
		if(rPage<=0){
			rPage = 1;
		}
	}else if(num === 'next'){
		rPage++;
	}else{
		rPage = num;
	}
	const sendData = { rPage: rPage};
	resApi.pageReply(sendData,function(data){
		updateReplyList(data.replyList, memNum);
    	 let startPage = (data.replyPi.startPage);
    	 let endPage = (data.replyPi.endPage);
    	 let maxPage = (data.replyPi.maxPage);
    	 let currentPage = (data.replyPi.currentPage);
    	 updatePageBtn(startPage, endPage, currentPage);
    	 updateReplyBtn(endPage, maxPage, currentPage);
    	 
		$(window).scrollTop(scrollTop);
	})
}

function escapeHtml(text) {
    let div = document.createElement('div');
    div.innerText = text;
    return div.innerHTML;
}

function addReply(){
	//let contentValue = document.getElementById('content').value;
	const contentValue = escapeHtml(document.getElementById('content').value);
	const sendData = { contentValue: contentValue};
	resApi.addReply(sendData,function(data){
		updateReplyList(data.replyList, memNum);
       	 document.getElementById('content').value = '';
       	 let startPage = (data.replyPi.startPage);
       	 let endPage = (data.replyPi.endPage);
       	 let maxPage = (data.replyPi.maxPage);
       	 let currentPage = (data.replyPi.currentPage);
       	 updatePageBtn(startPage, endPage, currentPage);
       	 updateReplyBtn(endPage, maxPage, currentPage);
       	 document.getElementById('replyNum').innerHTML = '댓글 ('+(data.rNum)+')';
	})
}

function updateLike(user){
	if(user == 'null'){
		alert("로그인 후 이용가능 합니다.");
		return;
	}
	let likeImg = document.getElementById('like-logo');
	resApi.updateLike(function(data){
		if(data == 'Y'){
			likeImg.innerHTML='<img src="/bigFish/resources/images/heart-filled.png">'
		}else{
			likeImg.innerHTML='<img src="/bigFish/resources/images/heart-notfill.png">'
		}
	})
}

function loadTickets(){
	let year = document.getElementById("calYear").textContent;
   	let month = document.getElementById("calMonth").textContent;
   	const sendData = { year: year,
   			month: month,
   			day: day,
    		time: selectedTime
        };
   	resApi.loadTickets(sendData,function(data){
   		updateTicket(data);
   	})
}

function saveSelectedDate() {
	const timeSelect = document.getElementById('timeSelect');
    if (dateClicked !== "passed") {
        alert('날짜를 선택하세요.');
        return;
    }else if (timeSelect.value === "") {
        alert('시간을 선택하세요.');
        return;
    }else if (isChecked !=="checkOk") {
        alert('이용권을 선택해 주세요');
        return;
    }else if (numPeople == null) {
        alert('이용인원을 선택해 주세요');
        return;
    }
	let year = document.getElementById("calYear").textContent;
	let month = document.getElementById("calMonth").textContent;
	const sendData = { year: year,
   			month: month,
   			day: day,
    		time: selectedTime,
    		numPeople: numPeople,
    		ticketNo: ticketNo,
    		ticketTime: ticketTime
        };
	resApi.saveSelectedDate(sendData,function(data){
		console.log("예약 정보 전송 성공");
    	window.location.href = "/bigFish/insertReservationTwo";
	})
}