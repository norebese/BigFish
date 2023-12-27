function memberMenu(){
    const memberMenu = document.querySelector(".memberMenu");

    if(memberMenu.style.display !== "none"){
        memberMenu.style.display = "none";
    }else{
        memberMenu.style.display = "flex";
    }
}


function mainSearch() {
    const input = document.querySelector("#keyword")
    const keyword = input.value;

    // 스크립트 삽입 방지를 위해 encodeURIComponent 사용
    const encodedKeyword = encodeURIComponent(keyword);
    // 검색 페이지로 이동
    location.href = 'search.bo?keyword=' + encodedKeyword;
}	

