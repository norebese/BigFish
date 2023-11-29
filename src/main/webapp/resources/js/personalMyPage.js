function showProfile(){
    const profileWork = document.querySelector("#profileWork");
    const reservationWork = document.querySelector("#reservationWork");
    const buttonProfile = document.querySelector("#buttonProfile");
    const buttonReservation = document.querySelector("#buttonReservation");

    profileWork.style.display = "flex";
    reservationWork.style.display = "none";
    buttonProfile.style.background = "rgb(28, 134, 204)";
    buttonReservation.style.background = "rgb(59, 175, 252)";
}

function showReservation(){
    const profileWork = document.querySelector("#profileWork");
    const reservationWork = document.querySelector("#reservationWork");
    const buttonProfile = document.querySelector("#buttonProfile");
    const buttonReservation = document.querySelector("#buttonReservation");

    profileWork.style.display = "none";
    reservationWork.style.display = "flex";
    buttonProfile.style.background = "rgb(59, 175, 252)";
    buttonReservation.style.background = "rgb(28, 134, 204)";

}