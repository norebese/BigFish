  
        let buttonElement1 = document.getElementById('hoverImage1');
        let buttonElement2 = document.getElementById('hoverImage2');
        let buttonElement3 = document.getElementById('hoverImage3');
        let buttonElement4 = document.getElementById('hoverImage4');
        let buttonElement5 = document.getElementById('hoverImage5');
        let buttonElement6 = document.getElementById('hoverImage6');
        let buttonElement7 = document.getElementById('hoverImage7');
        let imageElement = document.getElementById('main-img');
        
        // 마우스 호버 이벤트 리스너 추가
        buttonElement1.addEventListener('mouseover', function() {
        // 이미지의 src 속성 변경
        imageElement.src = 'resources/images/level01_3.png';
        });
        buttonElement2.addEventListener('mouseover', function() {
        imageElement.src = 'resources/images/level01_4.png';
        });
        buttonElement3.addEventListener('mouseover', function() {
        imageElement.src = 'resources/images/level01_5.png';
        });
        buttonElement4.addEventListener('mouseover', function() {
        imageElement.src = 'resources/images/level01_7.png';
        });
        buttonElement5.addEventListener('mouseover', function() {
        imageElement.src = 'resources/images/level01_6.png';
        });
        buttonElement6.addEventListener('mouseover', function() {
        imageElement.src = 'resources/images/level01_8.png';
        });
        buttonElement7.addEventListener('mouseover', function() {
        imageElement.src = 'resources/images/level01_9.png';
        });
		
        // 마우스 아웃 이벤트 리스너 추가 (다시 초기 이미지로 변경)
        buttonElement1.addEventListener('mouseout', function() {
        // 이미지의 src 속성 초기 이미지로 변경
        imageElement.src = 'resources/images/level01_1.png';
        });

        buttonElement1.addEventListener('click', function() {
            document.querySelector('.map-area2').classList.add('on');
            document.querySelector('.map-area1').classList.remove('on');
        });

        buttonElement2.addEventListener('click', function() {
            document.querySelector('.map-area3').classList.add('on');
            document.querySelector('.map-area1').classList.remove('on');
        });
        buttonElement3.addEventListener('click', function() {
            document.querySelector('.map-area4').classList.add('on');
            document.querySelector('.map-area1').classList.remove('on');
        });
        buttonElement4.addEventListener('click', function() {
            document.querySelector('.map-area5').classList.add('on');
            document.querySelector('.map-area1').classList.remove('on');
        });
        buttonElement5.addEventListener('click', function() {
            document.querySelector('.map-area6').classList.add('on');
            document.querySelector('.map-area1').classList.remove('on');
        });
        buttonElement6.addEventListener('click', function() {
            document.querySelector('.map-area7').classList.add('on');
            document.querySelector('.map-area1').classList.remove('on');
        });
        buttonElement7.addEventListener('click', function() {
            document.querySelector('.map-area8').classList.add('on');
            document.querySelector('.map-area1').classList.remove('on');
        });
        
        

        let prevButtons = document.querySelectorAll('.prev-btn');
        // 이전으로 가기 버튼 클릭 이벤트 리스너 추가
        prevButtons.forEach(function(prevButton) {
            prevButton.addEventListener('click', function() {
                // map-area1 활성화, 나머지 비활성화
                document.querySelector('.map-area1').classList.add('on');
                document.querySelector('.map-area2').classList.remove('on');
                document.querySelector('.map-area3').classList.remove('on');
                document.querySelector('.map-area4').classList.remove('on');
                document.querySelector('.map-area5').classList.remove('on');
                document.querySelector('.map-area6').classList.remove('on');
                document.querySelector('.map-area7').classList.remove('on');
                document.querySelector('.map-area8').classList.remove('on');
            })
        })

		
		function moveTop(){
            $("html, body").animate({ scrollTop: 0 }, 600);
        }
        
        
    function nextList(date){
	
		let showListArea = $("#showList-area");
		let Content = '';
		
		$.each(date, function (index, store) {
	                Content += '<a class="list-box-area" href="resDetailPage?storeNumber='+store.storeNo +'"><div class="list-img-box"><div class="img-box">'
					+'<img src="/bigFish/resources/uploadFiles/'+store.thumbnailImg+'"></div>'
		            +'<div class="list-txt-box"><p class="list-name">'+store.storeName+'</p><p class="fish-info">'
		            +'<span class="reply">'
		            +'<img style="height: 12px;" src="resources/images/reply.png">'+' '+store.replyCount +' '+'</span>'
		            +'<span class="like"><img style="height: 12px;" src="resources/images/like.png">'+' '+store.likeCount +'</span>'
		            +'</p><p class="address"><span>'+store.storeAddress+'</span></p><div class="price-area"><p>'+store.minPrice +'<span>원</span></p></div></div></div></a>';
	            });
		
		showListArea.append(Content);
	}
	
	function nextListFiltered(date){
	
		let showListArea = $("#showList-area");
		let Content = '';
		
		$.each(date, function (index, store) {
	                Content += '<a class="list-box-area" href="resDetailPage?storeNumber='+store.storeNo +'"><div class="list-img-box"><div class="img-box">'
					+'<img src="/bigFish/resources/uploadFiles/'+store.thumbnailImg+'"></div>'
		            +'<div class="list-txt-box"><p class="list-name">'+store.storeName+'</p><p class="fish-info">'
		            +'<span class="reply">'
		            +'<img style="height: 12px;" src="resources/images/reply.png">'+' '+store.replyCount +' '+'</span>'
		            +'<span class="like"><img style="height: 12px;" src="resources/images/like.png">'+' '+store.likeCount +'</span>'
		            +'</p><p class="address"><span>'+store.storeAddress+'</span></p><div class="price-area"><p>'+store.minPrice +'<span>원</span></p></div></div></div></a>';
	            });
		
		showListArea.append(Content);
	}


function updateSeaList(date){
	
	let divToUpdate = $('#showList-area');
	let htmlContent = '';
	
	$.each(date, function (index, store) {
                htmlContent += '<a class="list-box-area" href="resDetailPage?storeNumber='+store.storeNo +'"><div class="list-img-box"><div class="img-box">'
				+'<img src="/bigFish/resources/uploadFiles/'+store.thumbnailImg+'"></div>'
	            +'<div class="list-txt-box"><p class="list-name">'+store.storeName+'</p><p class="fish-info">'
	            +'<span class="reply">'
	            +'<img style="height: 12px;" src="resources/images/reply.png">'+' '+store.replyCount +' '+'</span>'
	            +'<span class="like"><img style="height: 12px;" src="resources/images/like.png">'+' '+store.likeCount +'</span>'
	            +'</p><p class="address"><span>'+store.storeAddress+'</span></p><div class="price-area"><p>'+store.minPrice +'<span>원</span></p></div></div></div></a>';         
            });
	
	divToUpdate.html(htmlContent);
}

function emptyResult(){
	let divTarget = $('#showList-area');
	divTarget.html('<h1>검색 결과가 없습니다</h1>');
}

document.getElementById("sortStore").addEventListener("change", function() {
    let selectedOption = this.value;
    storeKindFilter(selectedOption);
  });
  
function updateFishKindList(date){
	let divToUpdate = $('#fish-group');
	let htmlContent = '';
	
	$.each(date, function (index, fish) {
        htmlContent += `<li onclick="showFish(`+"'"+fish.key+"'"+`)" class="list-group-item d-flex justify-content-between align-items-center">` +
            fish.key + '<span class="badge bg-primary rounded-pill">' + fish.value + '</span></li>';
    });
    divToUpdate.html(htmlContent);
}

function selectedSea(ways){
console.log(ways);
	let newSeaName;
	if(ways == '12A20101'){
		newSeaName = "인천,경기 북부 앞바다"
	}else if(ways == '12A20102'){
		newSeaName = "인천,경기 남부 앞바다"
	}else if(ways == '12A20103'){
		newSeaName = "충남 북부 앞바다"
	}else if(ways == '12A20104'){
		newSeaName = "충남 남부 앞바다"
	}else if(ways == '22A30101'){
		newSeaName = "전북 북부 앞바다"
	}else if(ways == '22A30102'){
		newSeaName = "전북 남부 앞바다"
	}else if(ways == '22A30103'){
		newSeaName = "전남 북부 서해 앞바다"
	}else if(ways == '22A30104'){
		newSeaName = "전남 중부 서해 앞바다"
	}else if(ways == '22A30105'){
		newSeaName = "전남 남부 서해 앞바다"
	}else if(ways == '12B10101'){
		newSeaName = "전남 서부 남해 앞바다"
	}else if(ways == '12B10102'){
		newSeaName = "전남 동부 남해 앞바다"
	}else if(ways == '12B10302'){
		newSeaName = "제주도 북부 앞바다"
	}else if(ways == '12B10301'){
		newSeaName = "제주도 동부 앞바다"
	}else if(ways == '12B10304'){
		newSeaName = "제주도 서부 앞바다"
	}else if(ways == '12B10303'){
		newSeaName = "제주도 남부 앞바다"
	}else if(ways == '12B20103'){
		newSeaName = "부산 앞바다"
	}else if(ways == '12B20104'){
		newSeaName = "거제시 동부 앞바다"
	}else if(ways == '12B20101'){
		newSeaName = "경남 서부 남해 앞바다"
	}else if(ways == '12C10103'){
		newSeaName = "경북 북부 앞바다"
	}else if(ways == '12C10102'){
		newSeaName = "경북 남부 앞바다"
	}else if(ways == '12C10101'){
		newSeaName = "울산 앞바다"
	}else if(ways == '12C20103'){
		newSeaName = "강원 북부 앞바다"
	}else if(ways == '12C20102'){
		newSeaName = "강원 중부 앞바다"
	}else if(ways == '12C20101'){
		newSeaName = "강원 남부 앞바다"
	}


	document.getElementById("seaName").innerText = newSeaName;
}

let sPage;
let city1 = ''; let city2 = ''; let city3 = ''; let city4 = ''; let city5 = ''; let city6 = '';
	function seaAreaFilter(param1, param2, param3, param4, param5, param6, ways){
		sPage = 1;
		const sendData = { param1: param1,
	                    	param2: param2,
	                    	param3: param3,
	                    	param4: param4,
	                    	param5: param5,
	                    	param6: param6
	                    };
		storeApi.ajaxSeaAreaFilter(sendData,function(data){
			seaWeather(ways);
        	selectedSea(ways);
        	updateFishKindList(data.fishKindList);
        	if (data.list.length === 0) {
        		if(document.getElementById("more") != null){
        			document.getElementById("more").style.display = "none";
        		}
            	emptyResult();
            	if(document.getElementById("moreA") != null){
        			document.getElementById("moreA").style.display = "none";
        		}
            } else{
            	updateSeaList(data.list);
            	let moreButton3 = $(`<button id="moreA" onclick="ajaxSeaAreaMore()">더 보기 `
						+`<span>`+data.piS.currentPage+`</span>`
						+`<span style="color: rgba(96,96,96,.5)">/ `+data.piS.maxPage+`</span>`
						+`</button>`);
                $('#btn-area').html(moreButton3);
                if(data.piS.currentPage === data.piS.maxPage){
            		document.getElementById("moreA").style.display = "none";
            	}
            }
        	city1 = data.cityNames[0];
        	city2 = data.cityNames[1];
        	city3 = data.cityNames[2];
        	city4 = data.cityNames[3];
        	city5 = data.cityNames[4];
        	city6 = data.cityNames[5];
		})
	}

function ajaxSeaAreaMore(){
	sPage++;
	const sendData = { param1: city1,
        	param2: city2,
        	param3: city3,
        	param4: city4,
        	param5: city5,
        	param6: city6,
        	sPage: sPage
        };
	storeApi.ajaxSeaAreaMore(sendData,function(data){
		nextListFiltered(data.list);
    	let moreButton2 = $('<button id="moreA" onclick="ajaxSeaAreaMore()">더 보기+</button>');
		$('#btn-area').html(moreButton2);
    	if(data.piS.currentPage === data.piS.maxPage){
    		document.getElementById("moreA").style.display = "none";
    	}
	})
}

function getDirection(way) {
    if(way == 'N'){
    	return '북';
    }else if(way == 'NW'){
    	return '북서';
    }else if(way == 'NE'){
    	return '북동';
    }else if(way == 'E'){
    	return '동';
    }else if(way == 'SE'){
    	return '남동';
    }else if(way == 'S'){
    	return '남';
    }else if(way == 'SW'){
    	return '남서';
    }else if(way == 'W'){
    	return '서';
    }
}

function daySet(timestamp, num){
	let day;
	let year = timestamp.toString().substr(0, 4);
	let month = timestamp.toString().substr(4, 2) - 1;
	let originalDay = parseInt(timestamp.toString().substr(6, 2), 10);
	if(num==0){
		day = originalDay;
	}else if(num==1){
		day = originalDay + 1;
	}else if(num==2){
		day = originalDay + 2;
	}
	let hour = timestamp.toString().substr(8, 2);
	let minute = timestamp.toString().substr(10, 2);

	let date = new Date(year, month, day, hour, minute);
	let formattedDate = date.toLocaleDateString("ko-KR", { month: "numeric", day: "numeric" });

	return formattedDate;
}
function timeSet(num){
	let time;
	if(num == 1){
		time = '오전'
	}else{
		time = '오후'
	}
	return time;
}
function weatherIcon(rnYn, wfCd){
	let result;
	if(rnYn>0){
		if(rnYn == 1){
			result = 'rain.png';
		}else if(rnYn == 2){
			result = 'snowrain.png';
		}else if(rnYn == 3){
			result = 'snow.png';
		}
	}else{
		if(wfCd == 'DB01'){
			result = 'sun.png';
		}else if(wfCd == 'DB03'){
			result = 'sunhalf.png';
		}else if(wfCd == 'DB04'){
			result = 'cloud.png';
		}
	}
	
	return result;
}

function seaWeather(ways){
	const sendData = {location : ways};
	storeApi.seaWeather(sendData,function(data){
		console.log(data);
		document.getElementById("dayOne").innerText = daySet(data[0].tmFc, 0);
		document.getElementById("dayTwo").innerText = daySet(data[0].tmFc, 1);
		document.getElementById("dayThree").innerText = daySet(data[0].tmFc, 2);
		$(".table-inner").empty();
		$(".table-inner2").empty();
		$(".table-inner3").empty();
		let num = 1;
		if(data.length == 7 || data.length == 9){
			for (let i = 0; i < 1; i++) {
				let rowData = data[i];
				let rowHtml = `<div class="cell-weather"><span class="time-inner"><strong class="inner-text"><span class="text-inner">`;
				rowHtml +=`<span>오후<img class="wIcon" src="/bigFish/resources/images/`+weatherIcon(rowData.rnYn,rowData.wfCd)+`">`;
				rowHtml +=`</span><span><span class="w-text">풍향</span><span class="wind-direction">`+ getDirection(rowData.wd1) +"-"+getDirection(rowData.wd2)+`</span></span><span>`;
				rowHtml +=`<span class="w-text">풍속</span><span class="wind-speed">`+ rowData.ws1 + "~" + rowData.ws2 +" m/s"+`</span></span><span><span class="w-text">파고</span>`
				rowHtml +=`<span class="wave-info">`+ rowData.wh1 + "~" + rowData.wh2 + " m"+`</span>`;
				
				$(".table-inner").append(rowHtml);
			}
			num =1;	
			for (let i = 1; i < 3; i++) {
				let rowData = data[i];
				let rowHtml = `<div class="cell-weather"><span class="time-inner"><strong class="inner-text"><span class="text-inner">`;
				rowHtml +=`<span>`+timeSet(num)+`<img class="wIcon" src="/bigFish/resources/images/`+weatherIcon(rowData.rnYn,rowData.wfCd)+`">`;
				rowHtml +=`</span><span><span class="w-text">풍향</span><span class="wind-direction">`+ getDirection(rowData.wd1) +"-"+getDirection(rowData.wd2)+`</span></span><span>`;
				rowHtml +=`<span class="w-text">풍속</span><span class="wind-speed">`+ rowData.ws1 + "~" + rowData.ws2 +" m/s"+`</span></span><span><span class="w-text">파고</span>`
				rowHtml +=`<span class="wave-info">`+ rowData.wh1 + "~" + rowData.wh2 + " m"+`</span>`;
				
				$(".table-inner2").append(rowHtml);
				num++;
			}
			num =1;
			for (let i = 3; i < 5; i++) {
				let rowData = data[i];
				let rowHtml = `<div class="cell-weather"><span class="time-inner"><strong class="inner-text"><span class="text-inner">`;
				rowHtml +=`<span>`+timeSet(num)+`<img class="wIcon" src="/bigFish/resources/images/`+weatherIcon(rowData.rnYn,rowData.wfCd)+`">`;
				rowHtml +=`</span><span><span class="w-text">풍향</span><span class="wind-direction">`+ getDirection(rowData.wd1) +"-"+getDirection(rowData.wd2)+`</span></span><span>`;
				rowHtml +=`<span class="w-text">풍속</span><span class="wind-speed">`+ rowData.ws1 + "~" + rowData.ws2 +" m/s"+`</span></span><span><span class="w-text">파고</span>`
				rowHtml +=`<span class="wave-info">`+ rowData.wh1 + "~" + rowData.wh2 + " m"+`</span>`;
				
				$(".table-inner3").append(rowHtml);
				num++;
		}
		}else if(data.length == 8){
			for (let i = 0; i < 2; i++) {
				let rowData = data[i];
				let rowHtml = `<div class="cell-weather"><span class="time-inner"><strong class="inner-text"><span class="text-inner">`;
				rowHtml +=`<span>`+timeSet(num)+`<img class="wIcon" src="/bigFish/resources/images/`+weatherIcon(rowData.rnYn,rowData.wfCd)+`">`;
				rowHtml +=`</span><span><span class="w-text">풍향</span><span class="wind-direction">`+ getDirection(rowData.wd1) +"-"+getDirection(rowData.wd2)+`</span></span><span>`;
				rowHtml +=`<span class="w-text">풍속</span><span class="wind-speed">`+ rowData.ws1 + "~" + rowData.ws2 +" m/s"+`</span></span><span><span class="w-text">파고</span>`
				rowHtml +=`<span class="wave-info">`+ rowData.wh1 + "~" + rowData.wh2 + " m"+`</span>`;
				
				$(".table-inner").append(rowHtml);
				num++;
			}
			num =1;	
			for (let i = 2; i < 4; i++) {
				let rowData = data[i];
				let rowHtml = `<div class="cell-weather"><span class="time-inner"><strong class="inner-text"><span class="text-inner">`;
				rowHtml +=`<span>`+timeSet(num)+`<img class="wIcon" src="/bigFish/resources/images/`+weatherIcon(rowData.rnYn,rowData.wfCd)+`">`;
				rowHtml +=`</span><span><span class="w-text">풍향</span><span class="wind-direction">`+ getDirection(rowData.wd1) +"-"+getDirection(rowData.wd2)+`</span></span><span>`;
				rowHtml +=`<span class="w-text">풍속</span><span class="wind-speed">`+ rowData.ws1 + "~" + rowData.ws2 +" m/s"+`</span></span><span><span class="w-text">파고</span>`
				rowHtml +=`<span class="wave-info">`+ rowData.wh1 + "~" + rowData.wh2 + " m"+`</span>`;
				
				$(".table-inner2").append(rowHtml);
				num++;
			}
			num =1;
			for (let i = 4; i < 6; i++) {
				let rowData = data[i];
				let rowHtml = `<div class="cell-weather"><span class="time-inner"><strong class="inner-text"><span class="text-inner">`;
				rowHtml +=`<span>`+timeSet(num)+`<img class="wIcon" src="/bigFish/resources/images/`+weatherIcon(rowData.rnYn,rowData.wfCd)+`">`;
				rowHtml +=`</span><span><span class="w-text">풍향</span><span class="wind-direction">`+ getDirection(rowData.wd1) +"-"+getDirection(rowData.wd2)+`</span></span><span>`;
				rowHtml +=`<span class="w-text">풍속</span><span class="wind-speed">`+ rowData.ws1 + "~" + rowData.ws2 +" m/s"+`</span></span><span><span class="w-text">파고</span>`
				rowHtml +=`<span class="wave-info">`+ rowData.wh1 + "~" + rowData.wh2 + " m"+`</span>`;
				
				$(".table-inner3").append(rowHtml);
				num++;
			}
		}
		
	
	})
}

let cpage = 1;
    function addSeaPage(){
    	cpage++;
    	const sendData = {cpage : cpage};
    	storeApi.addSeaPage(sendData,function(data){
    		nextList(data.seaStoreList);
    		let moreButton3 = $(`<button id="moreA" onclick="addSeaPage()">더 보기 +`
    							+`<span>`+data.pi.currentPage+`</span>`
    							+`<span style="color: rgba(96,96,96,.5)">/ `+data.pi.maxPage+`</span>`
    							+`</button>`);
    		$('#btn-area').html(moreButton3);
    		if(data.pi.currentPage === data.pi.maxPage){
        		document.getElementById("moreA").style.display = "none";
        	}
    	})
   	}

let sfPage;
function storeKindFilter(selectedOption){
	sfPage = 1; 
	const sendData = { param1: city1,
        	param2: city2,
        	param3: city3,
        	param4: city4,
        	param5: city5,
        	param6: city6,
        	selectedOption: selectedOption,
        	sfPage: sfPage
        };
	storeApi.storeKindFilter(sendData,function(data){
		if (data.list.length === 0) {
    		if(document.getElementById("more") != null){
    			document.getElementById("more").style.display = "none";
    		}
        	emptyResult();
        	document.getElementById("moreA").style.display = "none";
        }else{
        	updateSeaList(data.list);
        	let moreButton3 = $(`<button id="moreA" onclick="storeKindFilterMore(`+ selectedOption + `)">더 보기 +`
					+`<span>`+data.piS.currentPage+`</span>`
					+`<span style="color: rgba(96,96,96,.5)">/ `+data.piS.maxPage+`</span>`
					+`</button>`);
    		$('#btn-area').html(moreButton3);
        	if(data.piS.currentPage >= data.piS.maxPage){
        		document.getElementById("moreA").style.display = "none";
        	}
        }
	})
}

function storeKindFilterMore(selectedOption){
	sfPage++; 
	const sendData = { param1: city1,
        	param2: city2,
        	param3: city3,
        	param4: city4,
        	param5: city5,
        	param6: city6,
        	selectedOption: selectedOption,
        	sfPage: sfPage
        };
	storeApi.storeKindFilterMore(sendData,function(data){
		nextListFiltered(data.list);
    	let moreButton3 = $(`<button id="moreA" onclick="storeKindFilterMore(`+ selectedOption + `)">더 보기 +`
				+`<span>`+data.piS.currentPage+`</span>`
				+`<span style="color: rgba(96,96,96,.5)">/ `+data.piS.maxPage+`</span>`
				+`</button>`);
		$('#btn-area').html(moreButton3);
    	if(data.piS.currentPage === data.piS.maxPage){
    		document.getElementById("moreA").style.display = "none";
    	}
	})
}

document.addEventListener('DOMContentLoaded', function () {
	seaWeather('12A20101');
    selectedSea('12A20101');
    const fishgroup = document.getElementById('fish-group');

    // 이벤트 위임을 사용하여 container에서 mouseover와 mouseout 이벤트를 처리
    fishgroup.addEventListener('mouseover', function (event) {
        const target = event.target;

        // 만약에 hoverable-element 클래스를 가진 요소면 hovered 클래스를 추가
        if (target.classList.contains('list-group-item')) {
            target.style.backgroundColor = '#f0f0f0';
        }
    });

    fishgroup.addEventListener('mouseout', function (event) {
        const target = event.target;

        if(target.classList.contains('list-group-item')) {
            target.style.backgroundColor = '';
        }
    })
})

function showFish(fish){
	const sendData = {fish:fish};
	storeApi.showFish(sendData,function(data){
		let imgData = `<img src="`+data.img+`" style="width: 100%;" height="160px;">`
		$("#fishImg-area").html(imgData);
	})
}
