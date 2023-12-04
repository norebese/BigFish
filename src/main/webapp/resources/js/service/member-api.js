const memberApi = {
    checkId: function(data, callback){
        $.ajax({
            url : "checkEmailId",
            data : data,
            success : function(result){
                callback(result)
            },
            error : function(){
                console.log("ajax 중복 체크 통신 실패");
            }
        })
    },

    checkNick: function(data, callback){
        $.ajax({
            url : "checkNick",
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