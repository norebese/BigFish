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
                console.log("ajax 닉네임 중복 체크 통신 실패");
            }
        })
    }
}