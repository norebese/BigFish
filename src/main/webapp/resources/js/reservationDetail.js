	let month;
    let day;
    let selectedTime;   
    let endTime;
   	let numPeople;
	let isChecked;
	let dateClicked;
    let ticketNo;
    let ticketTime;

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

function init(){
    let infobtn = document.querySelector('.detail-tab');
    let replybtn = document.querySelector('.reply-tab');

    let infodiv = document.querySelector('.map-plus');
    let replydiv = document.querySelector('.reply-area');

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
    
    
        
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('서울특별시 관악구 남부순환로247가길 18', function(result, status) {

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
        	
            content: '<div style="width:150px;text-align:center;padding:6px 0;"></div>'
            
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    	} 
	});  
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
    
    
function selectNum(targetId){
		numPeople = document.getElementById(targetId).value;

	}
	
	
function updateTicket(date){
	
	let ToUpdate = $('#showTicket-area');
	let htmlContent = '';
	
	$.each(date, function (index, ticket) {
                htmlContent += '<li class="option-item"><label style="display: flex; cursor: pointer;" id="checkboxLabel'+ticket.ticketNo+'" data-bs-toggle="modal" data-bs-target="#myModal'+ticket.ticketNo+'">'
        		+'<div class="checkbox-icon"><label for="myCheckbox'+ticket.ticketNo+'"><input type="checkbox" id="myCheckbox'+ticket.ticketNo+'" class="myCheckbox" data-target="#checkboxLabel'+ticket.ticketNo
                +`" onclick="handleCheckboxClick('myCheckbox` + ticket.ticketNo+`','`+ticket.ticketTime+ `')" value="`+ticket.ticketNo+'">'
        		+'</label></div><div class="option-info"><div class="info-text"><div class="boucher-title">'+ticket.ticketName+'</div>'
        		+'<div class="info-content"><span>남은 수량 : '+ticket.amount+' <br></span><span>가격 : '+ticket.ticketPrice+'<br></span><span>이용가능 시간 :</span>'
        		+'<span class="timeval">'+ticket.ticketTime+'</span><span>hr</span></div></div></div></label><div class="modal" id="myModal'+ticket.ticketNo+'">'
				+'<div class="modal-dialog modal-dialog-centered"><div class="modal-content"><div class="modal-header"><h4 class="modal-title">인원수 설정</h4>'
				+'<button type="button" class="btn-close" data-bs-dismiss="modal"></button></div><div class="modal-body"><label for="quantity'+ticket.ticketNo+'">인원수:</label>'
				+`<div class="input-group"><button type="button" class="btn btn-outline-secondary" onclick="changeQuantity('quantity`+ticket.ticketNo+`', -1)">-</button>`
				+'<input type="text" class="resnum-area" id="quantity'+ticket.ticketNo+'" value="1">'
				+`<button type="button" class="btn btn-outline-secondary" onclick="changeQuantity('quantity`+ticket.ticketNo+`', 1)">+</button>`
				+'</div></div><div class="modal-footer">'
				+`<button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="selectNum('quantity`+ticket.ticketNo+`')">확인</button>'`
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
	            +'<i class="bi bi-person" style="font-size: 40px;"></i><span >'+reply.replyWriter+'</span></div>'
	            +'<div class="col-md-8" style="display: flex; align-items: center;">'+reply.replyContent+'</div>'
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

	if(maxPage == 1){
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

