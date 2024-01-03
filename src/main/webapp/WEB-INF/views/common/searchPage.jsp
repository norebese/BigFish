<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIG FISH</title>
<link rel="stylesheet" href="<%=contextPath%>/resources/css/searchPage.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br>
	<div class="container">
		<form action="search.bo">
		<div class="header-box">
			<h5>통합 검색 결과</h5>
		</div>
		<br>
		<div class="search-result">
			<td><c:out value="${keyword}"/> 통합검색 결과</td>
		</div>

		<br>
		
		<div class="boardList">
			<div id="seaReservation-board" class="seaReservation-board">
				<div class="board-title">
					<h5>바다 낚시터</h5>
				</div>
				<table class="seaReservation_table">
					<c:if test="${empty seaStoreList}">
					    <p>검색 결과가 없습니다.</p>
					</c:if>
					<c:forEach var="ssl" items="${seaStoreList}" varStatus="loopStatus">
						<a class="list-box-area" href="resDetailPage?storeNumber=${ssl.storeNo}">
			                <div class="list-img-box">
			                    <div class="img-box">
			                        <img src="<%=contextPath%>/resources/uploadFiles/${ssl.thumbnailImg}">
			                    </div>
			                    <div class="list-txt-box">
			                        <p class="list-name">
			                            	${ssl.storeName}
			                        </p>
			                        <p class="fish-info">
			                            <span class="reply">
			                                <img style="height: 12px;" src="<%=contextPath%>/resources/images/reply.png" alt="">
			                                ${ssl.replyCount}
			                            </span>
			                            <span class="like">
			                                <img style="height: 12px;" src="<%=contextPath%>/resources/images/like.png" alt="">
			                                ${ssl.likeCount}
			                            </span>
			                        </p>
			                        <p class="address">
			                            <span>${ssl.storeAddress}</span>
			                        </p>
			                        <div class="price-area">
			                            <p>
			                                <fmt:formatNumber value="${ssl.minPrice}"/>
			                                <span>원</span>
			                            </p>
			                        </div>
			                    </div>
			                </div>
			            </a>
					</c:forEach>
				</table>
				<br>
				<div class="all-see">
					<a href="seaReservation">바다낚시터 바로가기 ></a>
				</div>
			</div>
	
			<br><br>

			<div id="fishReservation-board" class="fishReservation-board">
				<div class="board-title">
					<h5>민물 낚시터</h5>
				</div>
				<table class="fishReservation_table">
					<c:if test="${empty fishStoreList}">
					    <p>검색 결과가 없습니다.</p>
					</c:if>
					<c:forEach var="sl" items="${fishStoreList}" varStatus="loopStatus">
						<a class="list-box-area" href="resDetailPage?storeNumber=${sl.storeNo}">
			                <div class="list-img-box">
			                    <div class="img-box">
			                        <img src="<%=contextPath%>/resources/uploadFiles/${sl.thumbnailImg}">
			                    </div>
			                    <div class="list-txt-box">
			                        <p class="list-name">
			                            	${sl.storeName}
			                        </p>
			                        <p class="fish-info">
			                            <span class="reply">
			                                <img style="height: 12px;" src="<%=contextPath%>/resources/images/reply.png" alt="">
			                                ${sl.replyCount}
			                            </span>
			                            <span class="like">
			                                <img style="height: 12px;" src="<%=contextPath%>/resources/images/like.png" alt="">
			                                ${sl.likeCount}
			                            </span>
			                        </p>
			                        <p class="address">
			                            <span>${sl.storeAddress}</span>
			                        </p>
			                        <div class="price-area">
			                            <p>
			                            	<fmt:formatNumber value="${sl.minPrice}"/>
			                                <span>원</span>
			                            </p>
			                        </div>
			                    </div>
			                </div>
			            </a>
					</c:forEach>
				</table>
				<br>
				<div class="all-see">
					<a href="fishReservation">민물낚시터 바로가기 ></a>
				</div>
			</div>
	
			<br><br>

			<div id="shop-board" class="shop-board">
				<div class="board-title">
					<h5>낚시 용품</h5>
				</div>
				<table class="shop_table">
					<div class="fishBox">
					<c:if test="${empty shopList}">
					    <p>검색 결과가 없습니다.</p>
					</c:if>
						<c:forEach var="s" items="${shopList}">
							<a class="list-box-area2" href="detail.sh?sno=${s.productNo}">
								<div class="list-visual-box2">
									<img alt="조황사진" src="/bigFish${s.changeName}">
								</div>
								<div class="list-box2">
									<p class="list-name">${s.productName}</p>
									<p class="list-price"><fmt:formatNumber value="${s.productPrice}" type="currency" /></p>
								</div>
							</a>	
						</c:forEach>
					</div>
				</table>
				<br>
				<div class="all-see">
					<a href="list.sh">낚시용품 바로가기 ></a>
				</div>
			</div>
	
			<br><br>

			<div id="study-board" class="study-board">
				<div class="board-title">
					<h5>학습동영상</h5>
				</div>
				<table class="study_table">
					<div class="fishBox">
					<c:if test="${empty list}">
					    <p>검색 결과가 없습니다.</p>
					</c:if>
						<c:forEach var="s" items="${list}">
							<a class="list-box-area2" href="detail.st?sno=${s.studyNo}">
								<div class="list-visual-box2">
									${s.studyLink}
								</div>
								<div class="list-box2">
									<p class="list-name">${s.studyTitle}</p>
								</div>
							</a>
						</c:forEach>
					</div>
				</table>
				<br>
				<div class="all-see">
					<a href="list.st">학습동영상 바로가기 ></a>
				</div>
			</div>
	
			<br><br>

			<div id="fishing-board" class="fishing-board">
				<div class="board-title">
					<h5>조황게시판</h5>
				</div>
				<table class="fishing-table">
					<div class="fishBox">
					<c:if test="${empty list1}">
					    <p>검색 결과가 없습니다.</p>
					</c:if>
						<c:forEach var="b" items="${list1}">
							<a class="list-box-area2" href="detail.fibo?bno=${b.fishingNo}">
								<div class="list-visual-box2">
									<img alt="조황사진" src="/bigFish${b.changeName}">
								</div>
								<div class="list-box2">
									<p class="list-name">${b.fishingTitle}</p>
									<p class="lsit-writer">${b.fishingWriter}</p>
								</div>
							</a>
						</c:forEach>
					</div>
				</table>
				<br>
				<div class="all-see">
					<a href="list.fibo">조황게시판 바로가기 ></a>
				</div>
			</div>
			
			<br><br>

			<div id="free-board" class="free-board">
				<div class="board-title">
					<h5>자유게시판</h5>
				</div>
				<table class="free_table">
					<div class="freeList">
					<c:if test="${empty list2}">
					    <p>검색 결과가 없습니다.</p>
					</c:if>
						<c:forEach var="b" items="${list2}">
							<a class="freeArea" href="detail.fbo?bno=${b.freeNo}">
								<p class="freeTitle">${b.freeTitle}</p>
								<p class="freeWriter">
									<span>${b.freeWriter}</span>
									<span>| ${b.createDate}</span>
								</p>
							</a>
						</c:forEach>
					</div>
				</table>
				<br>
				<div class="all-see">
					<a href="list.fbo">자유게시판 바로가기 ></a>
				</div>
			</div>
		</div>
	</form>
	</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>