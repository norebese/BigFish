<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BIG FISH</title>
<style>
	.header-box{
    display: flex;
    flex-direction: row;
    
}

.left_box{
    background-color: rgb(52, 152, 219);  
    width: 25%; 
    height: 286px;
}

.center_box{
    display: flex;
    flex-direction: row;
    background-color: rgb(59, 175, 252); 
    width: 100%; 
    max-width: 1200px;
    height: 286px;
    justify-content: space-evenly;
    align-items: center;
    
}

.right_box{
    background-color: rgb(52, 152, 219); 
    width: 25%; 
    height: 286px;
}

.shop-image{
    color: white;
    display: flex;
    justify-content: space-around;
    align-items: flex-start;
}
</style>

<!-- CSS-->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/studyListView.css">

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<br><br><br>

	<div class="header-box">
        <div class="left_box"></div>
        <div class="center_box">
            <div style="color: white;">
            <h2>낚시 용품</h2>
            <br>
                <tr>
                    <td>BIG FISH 낚시 용품점입니다!</td>
                </tr>
            </div>
            <div class="study-image" style="color: white;">              
                <img style="width: 150px;" src="resources/images/shop-icon.png">
            </div>
        </div>
        <div class="right_box"></div>
    </div>

    <div class="header-box" style="margin: 5%; border-bottom: solid 2px rgb(204, 204, 204); display: flex; justify-content: space-between;">
		<h6 style="margin: 2%;">NEW ITEM</h6>
		<br>
		<c:if test="${loginUser.memAdmin eq 'Y'}">
			<button class="btn" onclick="location.href='enrollForm.sh'" style="margin: 1%; background-color: rgb(52, 152, 219); color: white;">상품 등록</button>
		</c:if>
	</div>
    <div
        style="display: flex; justify-content: center; margin: 0 auto; flex-wrap: wrap; border-bottom: solid 2px gray; padding-bottom: 15px;">        
        <c:forEach var="s" items="${list}">
            <div
                style="width: 25%; text-align: center; margin-bottom: 40px;"
                onclick="location.href='detail.sh?sno=${s.productNo}'">
                <img src="<%=contextPath%>${s.changeName}" alt="Your Image"
                    style="width: 60%; height: 60%; object-fit: contain; cursor: pointer;">
                <h6 style="font-weight: 800;">${s.productBrand}</h6>
                <p>${s.productName}</p>
                <p>${s.productPrice}원</p>
            </div>
        </c:forEach>
    </div>
    <br><br>

	<div>
    <nav aria-label="Page navigation example"
				class="d-flex justify-content-center">
				<ul class="pagination">
					<c:choose>
						<c:when test="${pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link"><span
									aria-hidden="true">&laquo;</span> </a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="list.sh?cpage=${pi.currentPage - 1 }"><span
									aria-hidden="true">&laquo;</span> </a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<li class="page-item"><a class="page-link"
							href="list.sh?cpage=${p }">${p }</a></li>
					</c:forEach>

					<c:choose>
						<c:when test="${pi.currentPage eq pi.maxPage }">
							<li class="page-item disabled"><a class="page-link"><span
									aria-hidden="true">&raquo;</span> </a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="list.sh?cpage=${pi.currentPage + 1 }"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
			<div style="margin-left: 8%;">
			<form class="sh-search-area" id="searchForm" action="search.sh" method="get" align="center">
                <div class="select" style="margin: none; width: 17%;">
                    <select id="selectbox" name="condition" onchange="" class="form-select pt-1 mt-4">
                        <option value="productName">상품 이름</option>
                        <option value="productBrand">상품 브랜드</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword" value="${keyword}" style="margin-top: 24px;">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary"
                    style="margin-top: 28px;">검색</button>
            </form>
            <c:if test="${ not empty condition }">
		        <script>
		        	window.onload = function() {
		        		const opt = document.querySelector("#st-search-area option[value=${condition}]")
		        		opt.setAttribute("selected", true);
		        	}
		        </script>
			</c:if>
		</div>
    </div>
    <br><br><br><br><br>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>