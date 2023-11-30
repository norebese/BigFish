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
}