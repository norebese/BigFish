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
    },

    profileImgAreaChange : function(data, callback){
        $.ajax({
            type : "POST",
            url : "profileImgAreaChange",
            data : data,
            contentType : false,
            processData : false,
            success : function(result){
                callback(result)
            },
            error : function(){
                console.log("ajax 프로필 이미지 변경 통신 실패");
            }
        })
    },

    findId : function(data, callback){
        $.ajax({
            url : "findId.me",
            data : data,
            success : function(result){
                callback(result)
            },
            error : function(){
                console.log("ajax 아이디 찾기 통신 실패");
            }
        })
    },
    findPwd : function(data, callback){
        $.ajax({
            url: "findPwd.me",
            data : data,
            success : function(result){
                callback(result)
            },
            error : function(){
                console.log("ajax 비밀번호 찾기 통신 실패");
            }
        })
    },
    getMemberForChat : function(data, callback){
        $.ajax({
            url : "getMemberForChat",
            data : data,
            success : function(result){
                callback(result)
            },
            error : function(){
                console.log("ajax 멤버 정보 획득 실패");
            }
        })
    }
    
}