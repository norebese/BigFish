	let month;
    let day;
    let selectedTime;   
    let endTime;
   	let numPeople;
	let isChecked;
	let dateClicked;

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

function handleCheckboxClick(clickedCheckboxId) {
    isChecked = 'checkOk';
    // 모든 체크박스에 대해 반복
    $(".myCheckbox").each(function() {
        // 클릭한 체크박스가 아니면 언체크
        if ($(this).attr("id") !== clickedCheckboxId) {
            $(this).prop("checked", false);
        }else{
        	$(this).prop("checked", true);
        	let ticketTime = this.value
        	let selectedTimeDt = new Date("2023-01-01 " + selectedTime);
			selectedTimeDt.setMinutes(selectedTimeDt.getMinutes() + ticketTime * 60);
		    endTime = `${selectedTimeDt.getHours().toString().padStart(2, '0')}:${selectedTimeDt.getMinutes().toString().padStart(2, '0')}`;
			console.log("selectedTime: "+selectedTime);
            console.log("ticketTime: "+ticketTime);
            console.log("endTime: "+endTime);
        }
        
    });
}

function changeQuantity(inputId, change) {
        var inputElement = document.getElementById(inputId);
        var currentValue = parseInt(inputElement.value);

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