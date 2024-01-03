<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BIG FISH</title>
    
        
    <!-- CSS-->
	<link rel="stylesheet" href="<%=contextPath%>/resources/css/studyListView.css">
	<!-- JS-->
	<script src="<%=contextPath%>/resources/js/studyListView.js"></script>
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"> 
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <br><br><br><br><br>
    <div>
    <div class="header-box">
        <div class="left_box"></div>
        <div class="center_box">
            <div style="color: white;">
            <h2>학습동영상</h2>
            <br>
                <tr>
                    <td>낚시에 대한 새로운 지식을 배워보세요!</td>
                </tr>
            </div>
            <div class="study-image" style="color: white;">              
                <img style="width: 150px;" src="resources/images/study.png">
            </div>
        </div>
        <div class="right_box"></div>
    </div>

    <div class="content" align="center">

        <br><br>
        <div class="innerOuter" style="padding:5% 10%; width: 80%;">
            <h3 align="left" style="font-weight: bolder; color: rgb(59, 175, 252); margin-left: 5px;">학습동영상</h3>

            <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
            <c:if test="${loginUser.memAdmin eq 'Y'}">  
                <button class="btn" onclick="location.href='enrollForm.st' " style="background-color: rgb(52, 152, 219); color: white; float:right;">글쓰기</button>
                <br><br>
            </c:if>
            <br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>등록일</th>
                        <th>조회수</th>
                        <th>좋아요</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="s" items="${list}">
                    <tr onclick="location.href='detail.st?sno=${s.studyNo}'">
                        <td>${s.studyNo}</td>
                        <td>${s.studyTitle}</td>
                        <td>${s.studyCreateDate}</td>
                        <td>${s.studyCount}</td>
                        <td>${s.likeCount}</td>
                    </tr>
					</c:forEach>
                </tbody>
            </table>
                <!-- <script>
                    function nextList(date){
                
                    let boardList = $("#boardList");
                    let Content = '';
                    
                    $.each(date, function (index, study) {
                                Content += '<a class="table table-hover" href="detail.st?sno='+study.studyNo +'"><div class="list-img-box"><div class="img-box">'
                                +'<span class="like"><img style="height: 12px;" src="resources/images/like.png">'+' '+study.likeCount +'</span>';
                            });
                    
                        boardList.append(Content);
                }

                function nextListFiltered(date){
	
                let boardList = $("#boardList");
                let Content = '';
                
                $.each(date, function (index, study) {
                                Content += '<a class="table table-hover" href="detail.st?sno='+study.studyNo +'"><div class="list-img-box"><div class="img-box">'
                                +'<span class="like"><img style="height: 12px;" src="resources/images/like.png">'+' '+study.likeCount +'</span>';
                            });
                
                    boardList.append(Content);
            }


            function updateSeaList(date){

            let boardList = $('#boardList');
            let htmlContent = '';

            $.each(date, function (index, study) {
                                Content += '<a class="table table-hover" href="detail.st?sno='+study.studyNo +'"><div class="list-img-box"><div class="img-box">'
                                +'<span class="like"><img style="height: 12px;" src="resources/images/like.png">'+' '+study.likeCount +'</span>';
                            });

            divInnerOuter.html(htmlContent);
            }
                </script> -->
            <br><br><br>

            <div id="pagingArea">
                <ul class="pagination">
                   <c:choose>
                      <c:when test="${pi.currentPage eq 1 }">
                          <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                       </c:when>
                       <c:otherwise>
                          <li class="page-item"><a class="page-link" href="list.st?cpage=${pi.currentPage-1 }">이전</a></li>
                       </c:otherwise>
                   </c:choose>
                   
               <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                         <li class="page-item"><a class="page-link" href="list.st?cpage=${p }">${p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                       <c:when test="${pi.currentPage eq pi.maxPage }">
                           <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                        </c:when>
                        <c:otherwise>
                           <li class="page-item"><a class="page-link" href="list.st?cpage=${pi.currentPage+1 }">다음</a></li>
                        </c:otherwise>
                     </c:choose>
                
                </ul>
            </div>

			<form class="st-search-area" id="searchForm" action="search.st" method="get" align="center">
                <div class="select" style="margin: none;">
                    <select id="selectbox" name="condition" onchange="" class="form-select pt-1 mt-4">
                        <option value="studyTitle">제목</option>
                        <option value="studyContent">내용</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword" value="${keyword}" style="margin-top: 24px;">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary" style="margin-top: 28px;">검색</button>
            </form>
            
            <c:if test="${empty searchResults}">
                <c:set var="hasSearch" value="false" />
            </c:if>
            
            <c:if test="${not empty searchResults}">
                <c:set var="hasSearch" value="true" />
            </c:if>
            
            <c:if test="${hasSearch eq 'true'}">
                <script>
                    window.onload = function() {
                        const opt = document.querySelector("#st-search-area option[value=${condition}]");
                        opt.setAttribute("selected", true);
                    }
                </script>
            </c:if>
            
            <c:if test="${hasSearch eq 'false'}">
                <script>
                    window.onload = function() {
                        const selectBox = document.querySelector("#selectbox");
                        const defaultOption = selectBox.querySelector("option[value=studyTitle]");
                        defaultOption.selected = true;
                    }
                </script>
            </c:if>
            
            <c:if test="${empty list}">
                <p style="text-align: center; margin-top: -12%;">검색 내용이 없습니다.</p>
            </c:if>
        </div>
    </div>
    <br><br><br>
        <jsp:include page="../common/footer.jsp" />
</body>

</html>