<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIG FISH</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="<%=contextPath%>/resources/css/fishReservation.css">
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<div style="display: flexbox; ">
        <div style="margin: 150px 100px 10px 100px; padding: 0; border-bottom: 1px solid; min-width: 100vh;">
            <p class="page-title">민물 낚시</p>
        </div>
        
        
        <div class="shop-list">
            <div class="filter-area">
                <div>
                    <button type="button" class="btn btn-primary" style="width: 300px; margin-bottom: 30px;">지역별</button>
                </div>
                <div>
                    <select class="form-select" style="width: 300px;">
                        <option>전체</option>
                        <option>붕어</option>
                        <option>항어</option>
                        <option>...</option>
                    </select>
                </div>
            </div>
            
            <a class="list-box-area" href="">
                <div class="list-img-box">
                    <div class="img-box">
                        <img src="<%=contextPath%>/resources/images/shop-example.jpg" alt="">
                    </div>
                    <div class="list-txt-box">
                        <p class="list-name">
                            	가게 이름
                        </p>
                        <p class="fish-info">
                            <span class="information">어종정보</span>
                            <span class="reply">
                                <img style="height: 12px;" src="<%=contextPath%>/resources/images/reply.png" alt="">
                                22
                            </span>
                            <span class="like">
                                <img style="height: 12px;" src="<%=contextPath%>/resources/images/like.png" alt="">
                                111
                            </span>
                        </p>
                        <p class="address">
                            <span>서울 관악구</span>
                        </p>
                        <div class="price-area">
                            <p>
                                9,000
                                <span>원</span>
                            </p>
                        </div>
                    </div>
                </div>
            </a>
            <a class="list-box-area" href="">
                <div class="list-img-box">
                    <div class="img-box">
                        <img src="<%=contextPath%>/resources/images/shop-example.jpg" alt="">
                    </div>
                    <div class="list-txt-box">
                        <p class="list-name">
                            가게 이름
                        </p>
                        <p class="fish-info">
                            <span class="information">어종정보</span>
                            <span class="reply">
                                <img style="height: 12px;" src="<%=contextPath%>/resources/images/reply.png" alt="">
                                22
                            </span>
                            <span class="like">
                                <img style="height: 12px;" src="<%=contextPath%>/resources/images/like.png" alt="">
                                111
                            </span>
                        </p>
                        <p class="address">
                            <span>서울 관악구</span>
                        </p>
                        <div class="price-area">
                            <p>
                                9,000
                                <span>원</span>
                            </p>
                        </div>
                    </div>
                </div>
            </a>
            <a class="list-box-area" href="">
                <div class="list-img-box">
                    <div class="img-box">
                        <img src="<%=contextPath%>/resources/images/shop-example.jpg" alt="">
                    </div>
                    <div class="list-txt-box">
                        <p class="list-name">
                            가게 이름
                        </p>
                        <p class="fish-info">
                            <span class="information">어종정보</span>
                            <span class="reply">
                                <img style="height: 12px;" src="<%=contextPath%>/resources/images/reply.png" alt="">
                                22
                            </span>
                            <span class="like">
                                <img style="height: 12px;" src="<%=contextPath%>/resources/images/like.png" alt="">
                                111
                            </span>
                        </p>
                        <p class="address">
                            <span>서울 관악구</span>
                        </p>
                        <div class="price-area">
                            <p>
                                9,000
                                <span>원</span>
                            </p>
                        </div>
                    </div>
                </div>
            </a>
            <a class="list-box-area" href="">
                <div class="list-img-box">
                    <div class="img-box">
                        <img src="<%=contextPath%>/resources/images/shop-example.jpg" alt="">
                    </div>
                    <div class="list-txt-box">
                        <p class="list-name">
                            가게 이름
                        </p>
                        <p class="fish-info">
                            <span class="information">어종정보</span>
                            <span class="reply">
                                <img style="height: 12px;" src="/images/reply.png" alt="">
                                22
                            </span>
                            <span class="like">
                                <img style="height: 12px;" src="/images/like.png" alt="">
                                111
                            </span>
                        </p>
                        <p class="address">
                            <span>서울 관악구</span>
                        </p>
                        <div class="price-area">
                            <p>
                                9,000
                                <span>원</span>
                            </p>
                        </div>
                    </div>
                </div>
            </a>
            <a class="list-box-area" href="">
                <div class="list-img-box">
                    <div class="img-box">
                        <img src="/images/shop-example.jpg" alt="">
                    </div>
                    <div class="list-txt-box">
                        <p class="list-name">
                            가게 이름
                        </p>
                        <p class="fish-info">
                            <span class="information">어종정보</span>
                            <span class="reply">
                                <img style="height: 12px;" src="/images/reply.png" alt="">
                                22
                            </span>
                            <span class="like">
                                <img style="height: 12px;" src="/images/like.png" alt="">
                                111
                            </span>
                        </p>
                        <p class="address">
                            <span>서울 관악구</span>
                        </p>
                        <div class="price-area">
                            <p>
                                9,000
                                <span>원</span>
                            </p>
                        </div>
                    </div>
                </div>
            </a>
            <a class="list-box-area" href="">
                <div class="list-img-box">
                    <div class="img-box">
                        <img src="/images/shop-example.jpg" alt="">
                    </div>
                    <div class="list-txt-box">
                        <p class="list-name">
                            가게 이름
                        </p>
                        <p class="fish-info">
                            <span class="information">어종정보</span>
                            <span class="reply">
                                <img style="height: 12px;" src="/images/reply.png" alt="">
                                22
                            </span>
                            <span class="like">
                                <img style="height: 12px;" src="/images/like.png" alt="">
                                111
                            </span>
                        </p>
                        <p class="address">
                            <span>서울 관악구</span>
                        </p>
                        <div class="price-area">
                            <p>
                                9,000
                                <span>원</span>
                            </p>
                        </div>
                    </div>
                </div>
            </a>
            <a class="list-box-area" href="">
                <div class="list-img-box">
                    <div class="img-box">
                        <img src="/images/shop-example.jpg" alt="">
                    </div>
                    <div class="list-txt-box">
                        <p class="list-name">
                            가게 이름
                        </p>
                        <p class="fish-info">
                            <span class="information">어종정보</span>
                            <span class="reply">
                                <img style="height: 12px;" src="/images/reply.png" alt="">
                                22
                            </span>
                            <span class="like">
                                <img style="height: 12px;" src="/images/like.png" alt="">
                                111
                            </span>
                        </p>
                        <p class="address">
                            <span>서울 관악구</span>
                        </p>
                        <div class="price-area">
                            <p>
                                9,000
                                <span>원</span>
                            </p>
                        </div>
                    </div>
                </div>
            </a>
            <a class="list-box-area" href="">
                <div class="list-img-box">
                    <div class="img-box">
                        <img src="/images/shop-example.jpg" alt="">
                    </div>
                    <div class="list-txt-box">
                        <p class="list-name">
                            가게 이름
                        </p>
                        <p class="fish-info">
                            <span class="information">어종정보</span>
                            <span class="reply">
                                <img style="height: 12px;" src="/images/reply.png" alt="">
                                22
                            </span>
                            <span class="like">
                                <img style="height: 12px;" src="/images/like.png" alt="">
                                111
                            </span>
                        </p>
                        <p class="address">
                            <span>서울 관악구</span>
                        </p>
                        <div class="price-area">
                            <p>
                                9,000
                                <span>원</span>
                            </p>
                        </div>
                    </div>
                </div>
            </a>
            <a class="list-box-area" href="">
                <div class="list-img-box">
                    <div class="img-box">
                        <img src="/images/shop-example.jpg" alt="">
                    </div>
                    <div class="list-txt-box">
                        <p class="list-name">
                            가게 이름
                        </p>
                        <p class="fish-info">
                            <span class="information">어종정보</span>
                            <span class="reply">
                                <img style="height: 12px;" src="/images/reply.png" alt="">
                                22
                            </span>
                            <span class="like">
                                <img style="height: 12px;" src="/images/like.png" alt="">
                                111
                            </span>
                        </p>
                        <p class="address">
                            <span>서울 관악구</span>
                        </p>
                        <div class="price-area">
                            <p>
                                9,000
                                <span>원</span>
                            </p>
                        </div>
                    </div>
                </div>
            </a>
            <a class="list-box-area" href="">
                <div class="list-img-box">
                    <div class="img-box">
                        <img src="/images/shop-example.jpg" alt="">
                    </div>
                    <div class="list-txt-box">
                        <p class="list-name">
                            가게 이름
                        </p>
                        <p class="fish-info">
                            <span class="information">어종정보</span>
                            <span class="reply">
                                <img style="height: 12px;" src="/images/reply.png" alt="">
                                22
                            </span>
                            <span class="like">
                                <img style="height: 12px;" src="/images/like.png" alt="">
                                111
                            </span>
                        </p>
                        <p class="address">
                            <span>서울 관악구</span>
                        </p>
                        <div class="price-area">
                            <p>
                                9,000
                                <span>원</span>
                            </p>
                        </div>
                    </div>
                </div>
            </a>
            
        </div>
        <div class="insert-btn">
                <button type="button" class="btn btn-primary" style="width: 300px;">등록하기</button>
        </div>
        
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>