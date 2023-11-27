var buttonElement1 = document.getElementById('hoverImage1');
var buttonElement2 = document.getElementById('hoverImage2');
var buttonElement3 = document.getElementById('hoverImage3');
var buttonElement4 = document.getElementById('hoverImage4');
var buttonElement5 = document.getElementById('hoverImage5');
var buttonElement6 = document.getElementById('hoverImage6');
var buttonElement7 = document.getElementById('hoverImage7');
var imageElement = document.getElementById('main-img');

// 마우스 호버 이벤트 리스너 추가
buttonElement1.addEventListener('mouseover', function() {
// 이미지의 src 속성 변경
imageElement.src = '/images/level01_3.png';
});
buttonElement2.addEventListener('mouseover', function() {
imageElement.src = '/images/level01_4.png';
});
buttonElement3.addEventListener('mouseover', function() {
imageElement.src = '/images/level01_5.png';
});
buttonElement4.addEventListener('mouseover', function() {
imageElement.src = '/images/level01_7.png';
});
buttonElement5.addEventListener('mouseover', function() {
imageElement.src = '/images/level01_6.png';
});
buttonElement6.addEventListener('mouseover', function() {
imageElement.src = '/images/level01_8.png';
});
buttonElement7.addEventListener('mouseover', function() {
imageElement.src = '/images/level01_9.png';
});

// 마우스 아웃 이벤트 리스너 추가 (다시 초기 이미지로 변경)
buttonElement1.addEventListener('mouseout', function() {
// 이미지의 src 속성 초기 이미지로 변경
imageElement.src = '/images/level01_1.png';
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

var prevButtons = document.querySelectorAll('.prev-btn');
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
    })
})




var test = document.getElementById('test');
test.addEventListener('click', function() {
    document.getElementById('testtext').innerText='정보 입니다';
});
