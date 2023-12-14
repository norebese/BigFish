document.addEventListener("DOMContentLoaded", function () {

    let selectRegion = document.getElementById("selectRegion");

    let selectCity = document.getElementById("selectCity");

    let confirmBtn = document.getElementById("confirmBtn");
	

    let cityData = {

        서울: ["강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동작구", "서대문구", "서초구", "성북구", "송파구", "은평구", "종로구", "영등포구"],

        경기북부: ["고양시", "구리시", "김포시", "남양주시", "양주시", "의정부시", "파주시", "포천시", "가평군", "양평군", "연천군"],

		경기남부: ["광명시", "광주시", "군포시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "여주시", "오산시", "용인시", "이천시", "평택시", "화성시"],

		인천: ["남구", "남동구", "부평구", "서구", "중구", "강화군", "옹진군"],

        강원: ["강릉시", "원주시", "춘천시", "영월군", "철원군", "평창군", "홍천군", "화천군", "횡성군"],

		충북: ["제천시", "청주시", "충주시", "괴산군","보은군", "옥천군", "음성군", "진천군"],

		충남: ["대전 서구", "대전 중구", "공주시", "계롱시", "논산시", "서산시", "아산시", "천안시", "금산군", "당진시", "부여군", "서천군", "예산군", "세종특별자치시", "태안군", "보령시", "홍성군"],

		전라: ["광주 광산구", "광주 동구", "광주 서구", "익산시", "전주시", "정읍시", "완주군", "임실군", "나주시", "장성군", "화순군", "군산시", "부안군", "고창군", "영광군", "신안군", "목포시", "여수시", "강진군", "고흥군", "무안군", "영암군", "완도군", "장흥군", "진도군", "해남군"],

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

        //alert("선택한 지역: " + selectedRegion + "\n선택한 도시: " + selectedCity);

        // 여기에서 원하는 작업 수행

		ajaxStoreList();

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

function updateList(date){
	
	let divToUpdate = $('#showList-area');
	let htmlContent = '';
	
	$.each(date, function (index, store) {
                htmlContent += '<a class="list-box-area" href="resDetailPage?storeNumber='+store.storeNo +'"><div class="list-img-box"><div class="img-box">'
				+'<img src="resources/images/shop-example.jpg" alt=""></div>'
	            +'<div class="list-txt-box"><p class="list-name">'+store.storeName+'</p><p class="fish-info">'
	            +'<span class="reply">'
	            +'<img style="height: 12px;" src="resources/images/reply.png" alt="">22</span>'
	            +'<span class="like"><img style="height: 12px;" src="resources/images/like.png" alt="">'+store.likeCount +'</span>'
	            +'</p><p class="address"><span>'+store.storeAddress+'</span></p><div class="price-area"><p>'+store.minPrice +'<span>원</span></p></div></div></div></a>';
            });
	
	divToUpdate.html(htmlContent);
}

function emptyResult(){
	let divTarget = $('#showList-area');
	divTarget.html('<h1>검색 결과가 없습니다</h1>');
}


function nextList(date){
	
	let showListArea = $("#showList-area");
	let Content = '';
	
	$.each(date, function (index, store) {
                Content += '<a class="list-box-area" href="resDetailPage?storeNumber='+store.storeNo +'"><div class="list-img-box"><div class="img-box">'
				+'<img src="resources/images/shop-example.jpg" alt=""></div>'
	            +'<div class="list-txt-box"><p class="list-name">'+store.storeName+'</p><p class="fish-info">'
	            +'<span class="reply">'
	            +'<img style="height: 12px;" src="resources/images/reply.png" alt="">22</span>'
	            +'<span class="like"><img style="height: 12px;" src="resources/images/like.png" alt="">'+store.likeCount +'</span>'
	            +'</p><p class="address"><span>'+store.storeAddress+'</span></p><div class="price-area"><p>'+store.minPrice +'<span>원</span></p></div></div></div></a>';
            });
	
	showListArea.append(Content);
}

function moveTop(){
            $("html, body").animate({ scrollTop: 0 }, 600);
}
