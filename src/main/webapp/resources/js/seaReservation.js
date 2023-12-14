  
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
					+'<img src="resources/images/shop-example.jpg"></div>'
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
					+'<img src="resources/images/shop-example.jpg"></div>'
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
				+'<img src="resources/images/shop-example.jpg"></div>'
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
