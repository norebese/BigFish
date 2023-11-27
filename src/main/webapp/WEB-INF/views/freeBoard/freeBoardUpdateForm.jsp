<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 부트스트랩 css 사용 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

    <style>
        .content {
            text-align: center;
        }

        .innerOuter {
            padding: 5% 10%;
            width: 80%;
            margin: 0 auto; /* 가운데 정렬을 위해 추가 */
        }

        table {
            width: 100%; /* 테이블 100% 넓이로 설정 */
        }

        input.form-control,
        textarea.form-control {
            width: 100%; /* 입력 필드 100% 넓이로 설정 */
        }
    </style>
</head>
<body>
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2 align="left" style="border-bottom: solid 1px; padding-bottom: 15px;">자유게시판 글수정</h2>
            <br>

            <table>
                <tr>
                    <td><input type="text" id="title" class="form-control" style="margin-bottom: 20px;" value="" name="boardTitle" required></td>
                </tr>
                
                <tr>
                    <td><textarea id="content" class="form-control" rows="19" style="resize:none; margin-bottom: 20px;" name="boardContent" required></textarea></td>
                </tr>
                
            </table>
            <button type="button" class="btn btn-primary" style="width: 100%;">게시글 수정</button>
           
        </div>
    </div>
</body>
</html>