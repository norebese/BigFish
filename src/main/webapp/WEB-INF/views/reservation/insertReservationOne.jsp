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
    <link rel="stylesheet" href="<%=contextPath%>/resources/css/insertReservationOne.css">
    <script src="<%=contextPath%>/resources/js/insertReservationOne.js"></script>
    
</head>
<body>
	<div style="margin: 0 100px; padding: 0; border-bottom: 1px solid;">
        <p class="page-title">예약하기</p>
    </div>
    <div class="fisrt-sec">
        <div class="center-title">
            <p>인원 선택</p>
            <p>남은 인원수</p>
        </div>
        <div class="center-content">
            <p>대인</p>
            <div>
                <select class="form-select" style="width: 100px;">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                </select>
            </div>
            <p style="margin-left: 260px;">xx좌석 남음</p>
        </div>
        <div class="center-content2">
            <p>소인</p>
            <div>
                <select class="form-select" style="width: 100px;">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                </select>
            </div>
        </div>
        <div class="tmi">
            단체손님 예약시 전화로 문의 후 예약해주세요.
        </div>
        
    </div>
    
    
    <div class="cal-area">
        <p>날짜 선택</p>
        <div class="table-area">
            <table class="Calendar">
                <thead>
                    <tr>
                        <td id="prev-btn" style="cursor:pointer;"></td>
                        <td colspan="5">
                            <span id="calYear"></span>년
                            <span id="calMonth"></span>월
                        </td>
                        <td id="next-btn" onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
                    </tr>
                    <tr>
                        <td>일</td>
                        <td>월</td>
                        <td>화</td>
                        <td>수</td>
                        <td>목</td>
                        <td>금</td>
                        <td>토</td>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <div> 
                <div class="time-area">
                    <span>시작시간</span>
                    <span style="margin-left: 170px;">종료시간</span>
                </div>
                <div class="start-time">
                    <select class="form-select" style="width: 200px;">
                        <option>24:00</option>
                        <option>23:00</option>
                        <option>22:00</option>
                        <option>21:00</option>
                        <option>20:00</option>
                        <option>19:00</option>
                        <option>18:00</option>
                        <option>17:00</option>
                        <option>16:00</option>
                        <option>15:00</option>
                        <option>14:00</option>
                        <option>13:00</option>
                        <option>12:00</option>
                        <option>11:00</option>
                        <option>10:00</option>
                        <option>09:00</option>
                        <option>08:00</option>
                        <option>07:00</option>
                        <option>06:00</option>
                        <option>05:00</option>
                        <option>04:00</option>
                        <option>03:00</option>
                        <option>02:00</option>
                        <option>01:00</option>
                    </select>
                    <span class="wave">~</span>
                    <select class="form-select" style="width: 200px; margin-left: 10px;">
                        <option>24:00</option>
                        <option>23:00</option>
                        <option>22:00</option>
                        <option>21:00</option>
                        <option>20:00</option>
                        <option>19:00</option>
                        <option>18:00</option>
                        <option>17:00</option>
                        <option>16:00</option>
                        <option>15:00</option>
                        <option>14:00</option>
                        <option>13:00</option>
                        <option>12:00</option>
                        <option>11:00</option>
                        <option>10:00</option>
                        <option>09:00</option>
                        <option>08:00</option>
                        <option>07:00</option>
                        <option>06:00</option>
                        <option>05:00</option>
                        <option>04:00</option>
                        <option>03:00</option>
                        <option>02:00</option>
                        <option>01:00</option>
                    </select>
                </div>
                
            </div>
        </div>
        
    </div>

    <div class="next-btn">
        
            <button type="button" class="btn btn-primary" style="position: absolute; right: 0; margin-top: 30px;">다음으로</button>
        
    </div>
</body>
</html>