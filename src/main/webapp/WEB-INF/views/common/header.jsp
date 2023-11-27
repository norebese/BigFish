<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .header-area{
            position: fixed;
            display: flex;
            width : 100%;
            top: 0;
            left: 0;
            margin : 0 auto;
            /* overflow: hidden; */
            white-space: nowrap;
            justify-content : space-around;
            
        }
        .header-logo{
            display: flex;
            width: 180px;
            float: left;
            margin-left: 80px;
            margin-right: 100px;
            margin-top : 10px;
        }
        .header-menu{
            display: flex;
            margin-top: 20px;
            padding: 0;
        }
        .search-area{
            float: left;
            border: 1px solid #bbb4b4;
            border-radius: 0.3rem;
            padding: 6px 8px;
            width: 600px;
            min-width: 300px;
            max-height: 25px;
            margin: 12px 100px 12px 0px;
            font-size: 0;
        }
        .search-area input{
            border: none;
            font-size: 13px;
            letter-spacing: -0.7px;
            vertical-align: top;
            width: calc(100% - 20px);
            outline: none;
            margin-top: 5px;
        }
        .search-btn{
            position: relative;
            float: right;
            margin-left: 0;
        }
        .menu-link{
            padding: 19px 0 22px;
            margin-left: 25px;
            text-decoration: none;
            color: black;
        }
        .menu-btn{
            padding: 12px 0 22px;
            margin-left: 60px;
            margin-top: 15px;
            
        }


    </style>
</head>
<body>
		<div class="header-area">
	            <div class="header-logo">
	                <img style="height:80px; width: 100px;" src="resources/images/BIGBIGFISH.png" alt="메인로고">
	                	
	            </div>
	            <div class="header-menu">
	                <div class="search-area">
	                    <input type="text" placeholder="검색어를 입력해 주세요">
	                    <a class="search-btn" href="">
	                        <img style="height: auto; width: 15px; margin-top: 4px;" src="resources/images/search_icon.png" alt="검색버튼">
	                    </a>
	            	</div>
	                <a class="menu-link" href="">공지사항</a>
	                <a class="menu-link" href="">FAQ</a>
	                <c:choose>
	                <c:when test="${empty loginUser}">
	                	<a class="menu-link" href="loginForm.me">로그인</a>
	                </c:when>
	                <c:otherwise>
	                	<img alt="회원아이콘" style="width:30px; height:30px; margin-left: 30px; margin-top: 15px;" src="resources/images/member_icon.png">
	                	
	                </c:otherwise>
	                </c:choose>

	            </div>
				<div class="menu-btn">
					<img style="height: 30px; width: 30px;" src="resources/images/menubar.png" alt="메뉴바">
				</div>
			</div>

</body>
</html>