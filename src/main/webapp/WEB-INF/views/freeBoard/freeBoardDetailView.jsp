<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <!-- 부트스트랩 css 사용 -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

</head>
<body>
    <div class="content" align="center">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%; width: 80%;" >
            <h2 align="left" style="border-bottom: solid 1px ; padding-bottom: 15px;" >자유게시판</h2>
            <br>
           
            
           
            <table id="contentArea" algin="center" class="table">
                <tr>
                    
                    <td colspan="4" >경기도 광주시 매산리 저수지 낚시</td>
                </tr>
                <tr>

                    <td> <i class="bi bi-person-circle">광주낚시맨</i> </td>
                    <th>작성일</th>
                    <td>좋아요:50</td>
                    <td>조회수:32</td>
                    <td>2023/0101</td>
                </tr>
                
               
                <tr>
                    <td colspan="4"><p style="height:150px;">경기도 광주시 매산리 저수지 낚시 피쉬앤피플 사이트에서는 낚시 금지라도 안 뜨는데 광주 시청에다 전화해보니까 경기 광주시 전체 낚시 금지라는데 가서 낚시하면 안되겠죠???
                                                                </p></td>
                </tr>
            </table>

            <thead>
                <tr>
                    <th colspan="2">
                        <div style="display: flex; align-items: center;">
                            <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%; height: 50px;"></textarea>
                            <button class="btn btn-secondary" onclick="addReply();" style="height: 50px; width:120px;">등록하기</button>
                        </div>
                    </th>
                </tr>
            </thead>


       


  
    </div>
    
</body>
</html>