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
  <jsp:include page="../common/header.jsp"/>
 
    <div class="content" align="center">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%; width: 80%;" >
            <h2 align="left" style="border-bottom: solid 2px rgb(204,204,204); padding-bottom: 15px; " >자유게시판</h2>
            <br>
           
            
           
            <table id="contentArea" algin="center" class="table" style=" border-bottom: solid 2px rgb(204,204,204); padding-bottom: 15px;" >
                
                <div  style=" text-align: left">
                    <h5 style="  font-size: 26px; ">경기도 광주시 매산리 저수지 낚시</h5>
                </div>
                <div class="container" style="margin-top: 10px; border-bottom: solid 2px rgb(204,204,204); padding-bottom: 0px;">
                    <div class="row" style="display: flex; align-items: center;">
                        <div class="col" style="flex-grow: 1;">
                            <div style="text-align: left; display: flex; align-items: center;">
                                <i class="bi bi-person-circle" style="font-size: 40px; margin-right: 10px;"></i>
                                <h6 style="margin: 0; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">광주낚시맨</h6>
                            </div>
                        </div>
                        
                        <div class="col" style="flex-grow: 1; ">
                            <div style="display: flex; align-items: center; justify-content: flex-end;">
                                <p style="margin: 0; margin-right: 10px; white-space: nowrap;">작성일</p>
                                <p style="margin: 0; margin-right: 10px; white-space: nowrap;">좋아요:50</p>
                                <p style="margin: 0; margin-right: 10px; white-space: nowrap;">조회수:32</p>
                                <p style="margin: 0; white-space: nowrap;">2023/01/01</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- <tr>

                    <td> <i class="bi bi-person-circle">광주낚시맨</i> </td>
                    <th>작성일</th>
                    <td>좋아요:50</td>
                    <td>조회수:32</td>
                    <td>2023/0101</td>
                </tr> -->
                
               
                <tr>
                    <td colspan="4"><p style="height:150px;">경기도 광주시 매산리 저수지 낚시 피쉬앤피플 사이트에서는 낚시 금지라도 안 뜨는데 광주 시청에다 전화해보니까 경기 광주시 전체 낚시 금지라는데 가서 낚시하면 안되겠죠???
                                                                </p></td>
                </tr>
            </table>
                 <div class="container" style="border-bottom: solid 2px rgb(204,204,204);  padding-bottom: 15px; padding-left: 0px; padding-right: 0px;">
               
                    <div class="row">
                    <div class="col-md-8"> <h6 align="left" style="margin-bottom: 0px; margin-top: 15px;" >좋아요: 55 댓글: 5</h6></div>
                    <div class="col-6 col-md-4">
                        <button type="button" class="btn btn-success">글수정</button>
                        <button type="button" class="btn btn-danger" style="margin-left: 15px;">글삭제</button>
                    </div>
                </div>
          
                <br>
    
                <div style="border-top: solid 2px rgb(204,204,204);  padding-bottom: 15px;">
                    <h6 style="text-align: left; margin-bottom: 10px;">댓글</h6>
                    <th colspan="2">
                        <div style="display: flex; align-items: center;">
                            <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%; height: 80px;"></textarea>
                            <button class="btn btn-primary" onclick="addReply();" style="height: 80px; width:120px; margin-left: 10px;">댓글등록</button>
                        </div>
                    </th>
                </div>
    </div>
    <!-- 댓글파트 -->
    <div class="container" style="border-bottom: solid 2px rgb(204,204,204); ">
        <div class="row">
            <div class="col-sm" style="display: flex; align-items: center;">
                <i class="bi bi-person" style="font-size: 40px;"></i>
                <span >임영웅</span>
            </div>
            <div class="col-md-8" style="display: flex; align-items: center;">네 아마 안될거 같네요.</div>
            <div class="col-sm" style="display: flex; align-items: center;">2023/11/19</div>
        </div>
    </div>
    <div class="container" style="border-bottom: solid 2px rgb(204,204,204); ">
        <div class="row">
            <div class="col-sm" style="display: flex; align-items: center;">
                <i class="bi bi-person" style="font-size: 40px;"></i>
                <span >임영웅</span>
            </div>
            <div class="col-md-8" style="display: flex; align-items: center;">네 아마 안될거 같네요.</div>
            <div class="col-sm" style="display: flex; align-items: center;">2023/11/19</div>
        </div>
    </div>
    
    <div class="container" style="border-bottom: solid 2px rgb(204,204,204); ">
        <div class="row">
            <div class="col-sm" style="display: flex; align-items: center;">
                <i class="bi bi-person" style="font-size: 40px;"></i>
                <span >임영웅</span>
            </div>
            <div class="col-md-8" style="display: flex; align-items: center;">네 아마 안될거 같네요.</div>
            <div class="col-sm" style="display: flex; align-items: center;">2023/11/19</div>
        </div>
    </div>
    

    
</body>
</html>