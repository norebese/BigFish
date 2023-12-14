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
    
    location.href='search.bo?keyword=' + input.value;
}	

