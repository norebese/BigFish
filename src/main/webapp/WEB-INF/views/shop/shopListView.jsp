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

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<br><br><br>

    <div class="header-box" style="margin: 5%; border-bottom: solid 2px rgb(204, 204, 204);">
		<c:if test="${loginUser.memAdmin eq 'Y'}">
        	<button class="btn" onclick="location.href='enrollForm.sh'" style="background-color: rgb(52, 152, 219); color: white; float:right;">상품 등록</button>
		</c:if>
        <br>
        <h6>NEW ITEM</h6>
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
                <p>${s.productPrice}</p>
            </div>
        </c:forEach>
    </div>
    <br><br>

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
    
    
    <jsp:include page="../common/footer.jsp" />
</body>
</html>