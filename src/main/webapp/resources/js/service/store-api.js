const storeApi = {
    checkBno : function(data, callback){
        $.ajax({
            url : "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=7T3wg3mYwzn3MFzVvLrI1qBhmqOwrI81kL8O2EmLPRCDHnVxsdq68Pn3EFDWQMuYp4KHzBMAJQ08afpjdxMMyg%3D%3D",
            type : "POST",
            data : JSON.stringify(data),
            dataType : "JSON",
            contentType: "application/json",
            accept: "application/json",
            success: function (result) {
                callback(result);
              },
              error: function (error) {
                console.log("ajax 사업자 확인 통신 실패");
              }          
        })
    },
    checkSameBno : function(data,callback){
        $.ajax({
            url : "checkSameNo",
            data : data,
            success : function(result){
                callback(result)
            },
            error : function(){
                console.log("ajax 사업자 번호 중복 체크 통신 실패");
            }
        })
    },
    updateStoreStatus : function(data,callback){
        $.ajax({
            url : "updateStoreStatus",
            data : data,
            success : function(result){
                callback(result)
            },
            error : function(){
                console.log("ajax storeStatus 변경 실패");
            }
        })
    },
    checkBusinessNoForDelete : function(data,callback){
        $.ajax({
            url : "checkBusinessNoForDelete",
            data : data,
            success : function(result){
                callback(result)
            },
            error : function(){
                console.log("ajax 데이터베이스 사업자 확인 실패");
            }
        })
    },
    getMyStoreReservationList : function(data,callback){
        $.ajax({
            url : "getMyStoreReservationList",
            data : data,
            contentType : "application/text; charset:UTF-8",
            success : function(result){
                callback(result)
            },
            error : function(){
                console.log("ajax 날짜별 예약 불러오기 실패");
            }
        })
    },
    okReservation : function(data,callback){
        $.ajax({
            url : "okReservation",
            data : data,
            success : function(result){
                callback(result);
            },
            error : function(){
                console.log("ajax 예약 승인 실패");
            }
        })
    },
    cancelReservation : function(data,callback){
        $.ajax({
            url : "cancelReservation",
            data : data,
            success : function(result){
                callback(result);
            },
            error : function(){
                console.log("ajax 예약 취소 실패");
            }
        })
    }
}