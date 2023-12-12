function postFormSubmit(num) {
    if (num === 1) {
        $("#postForm").attr('action', 'updateForm.st');
    } $("#postForm").submit();
}

$(function () {
    //댓글 조회하는 함수호출
    selectReplyList();
})

function selectReplyList() {
    $.ajax({
        url: "rlist.st",
        data: {
            sno: ${ s.studyNo }
        },
success: function(list) {
    let str = "";
    for (reply of list) {
        str += ("<tr>" +
            "<td>" + reply.reply + "</td>" +
            "<td>" + reply.replyContent + "</td>" +
            "<td>" + reply.replyCreateDate + "</td>" +
            "</tr>")
    }

    //$("#replyArea tbody").html();
    document.querySelector("#replyArea tbody").innerHTML = str;
    document.querySelector("#rcount").innerHTML = list.length;
},
error: function() {
    console.log("ajax통신 실패")
}
    })
}

//댓글 추가
function addReply() {
    $.ajax({
        url: "rinsert.st",
        data: {
            rstudyNo: '${s.studyNo}',
            replyWriter: '${loginUser.memNick}',
            replyContent: $("#content").val()
        },
        success: function (res) {
            //성공시 다시 그려주기
            if (res === "success") {
                selectReplyList();
                $("#content").val("");
            }
        },
        error: function () {
            console.log("ajax통신 실패")
        }
    })
}
