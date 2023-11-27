function memberMenu(){
    const memberMenu = document.querySelector(".memberMenu");

    if(memberMenu.style.display !== "none"){
        memberMenu.style.display = "none";
    }else{
        memberMenu.style.display = "flex";
    }
}