const chatApi = {
    getRevStoreForChat : function(callback){
        $.ajax({
            url : "getRevStoreForChat",
            success : function(result){
                callback(result);
            },
            error : function(){
                console.log("ajax 예약한 사업장 리스트 불러오기 실패");
            }
        })
    },
    getChat : function(data, callback){
        $.ajax({
            url : "getChat",
            data : data,
            success : function(result){
                callback(result);
            },
            error : function(){
                console.log("ajax 이전 대화 불러오기 실패");
            }
        })
    },
    getUserForChat : function(data, callback){
        $.ajax({
            url : "getUserForChat",
            data : data,
            success : function(result){
                callback(result);
            },
            error : function(){
                console.log("ajax 메세지 보낸 유저들 리스트 불러오기 실패");
            }
        })
    },
    readCheckPersonal : function(data, callback){
        $.ajax({
            url : "readCheckPersonal",
            data : data,
            success : function(result){
                callback(result);
            },
            error : function(){
                console.log("ajax 메시지 안읽음 여부 불러오기 실패");
            }
        })
    },
    updateReadPersonal : function(data, callback){
        console.log(data);
        $.ajax({
            url : "updateReadPersonal",
            data : data,
            success : function(result){
                console.log(result)
                callback(result)
            },
            error : function(){
                console.log("ajax 메시지 읽음 처리 실패");
            }
        })
    },
    getUserNameInfoForChat : function(data, callback){
        $.ajax({
            url : "getUserNameInfoForChat",
            data : data,
            success : function(result){
                callback(result);
            },
            error : function(){
                console.log("ajax 상대 이름 가져오기 실패");
            }
        })
    },
    getStoreNameInfoForChat : function(data, callback){
        $.ajax({
            url : "getStoreNameInfoForChat",
            data : data,
            success : function(result){
                callback(result);
            },
            error : function(){
                console.log("ajax 상대 이름 가져오기 실패");
            }
        })
    }
}