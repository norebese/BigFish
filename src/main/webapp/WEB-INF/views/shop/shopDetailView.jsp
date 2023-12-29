<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
String alertMsg = (String) session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIG FISH</title>

<!-- JS
<script src="<%=contextPath%>/resources/js/shopDetailView.js"></script> -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
    <br><br><br><br><br><br><br>
    <div>
        <div class="file-img" style="width: 50%; margin-bottom: 40px;">
            <img src="<%=contextPath%>${s.changeName}" alt="Your Image"
                style="float: left; width: 40%; height: 60%; margin-left: 25%; border: solid 1px black;">
        </div>
        <div class="files" style="float: right; margin-right: 25%;">
            <div style="border: solid 1px black;">
            <table>
                <thead>
                    <p>${s.productName}</p>
                    <p>판매가 : ${s.productPrice}</p>
                </thead>
                <tbody>
                    <p>원산지 : ${s.productOrigin}</p>
                    <p>브랜드 : ${s.productBrand}</p>
                    <p>배송비 : 총 결제금액이 50,000원 미만 시 배송 비 3000원이 청구됩니다.</p>
                </tbody>
            </table>
            </div>
            <br>
            <div class="quantity-container" align="right"> 
                수량 : <input type="hidden"  name="sell_price" value="${s.productPrice}">
                <input type="text" id="quantity" name="quantity" value="1" size="3">
                <input type="button" value=" + " name="add">
                <input type="button" value=" - " name="minus">
                총 상품 금액 : <input type="text" id="total_amount" name="sum" value="${s.productPrice}" size="11" readonly>원
            </div>
            
              <br>
            <c:choose>
                <c:when test="${loginUser.memAdmin eq 'Y'}">
                    <div align="right">
                        <a class="btn btn-primary" onclick="postFormSubmit(1)">상품 수정</a>
                        <a class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteProduct">상품 삭제</a>
                    </div>
                    <br>
                    <div align="right"><button class="btn btn-secondary" onclick="location.href='list.sh'">목록으로</button></div>
                </c:when>
                <c:otherwise>
                    <button align="center" class="btn" onclick="buyShop(${s.productNo})" style="background-color: rgb(52, 152, 219); color: white; float:right;">구매하기</button>
                    <div style="margin-left: 52%;"><button class="btn btn-secondary" onclick="location.href='list.st'">목록으로</button></div>
                </c:otherwise>
            </c:choose>  
        </div>
    </div>
    <form action="" method="post" id="postForm">
        <input type="hidden" name="sno" value="${s.productNo}">
    </form>

    <script>
        function postFormSubmit(num) {
            if(num === 1) {
                $("#postForm").attr('action', 'updateForm.sh');
            } $("#postForm").submit();
        }
    </script>
    <div
        style="flex: 1; display: flex; margin-top: 20px; justify-content: flex-start;">
        <!-- 이미지를 감싸는 div -->
        <div
            style="width: 100%; height: 400px; margin-bottom: 20px; overflow: hidden; display: flex; justify-content: flex-start;">
            <!-- 실제로는 이미지의 경로를 적어주세요. -->
            <img src="<%=contextPath%>/${b.changeName}" alt=""
                style="height: 352px;">
        </div>
    </div>

    <div style="display: flex; justify-content: center;">
        <tr>
            <td colspan="4">${s.productDetail}
                </p>
            </td>
        </tr>
    </div>
    <!-- The Modal -->
    <div class="modal" id="deleteProduct">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">게시글 삭제</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
              	  해당 게시글을 삭제 하시겠습니까?
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer">
            <button class="btn btn-secondary" onclick="location.href='delete.sh?sno=${s.productNo}'" type="submit" style="border: none; background-color: rgb(52, 152, 219); color: white;">네</button>                
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">아니오</button>
            </div>
    
        </div>
        </div>
    </div>

    <script>
        function buyShop(sno) {
            const quantity = document.getElementById("quantity").value
            const total_amount = document.getElementById("total_amount").value

            console.log(quantity)
            console.log(total_amount)
            location.href="listasdf.SHbo?sno=" + sno + "&quantity=" + quantity + "&total_amount=" + total_amount;
        }

        // + 버튼 클릭 시 수량 증가
        document.querySelector('input[name="add"]').addEventListener('click', function() {
            var quantityInput = document.querySelector('input[name="quantity"]');
            var sumInput = document.querySelector('input[name="sum"]');
            var sellPriceInput = document.querySelector('input[name="sell_price"]');
    
            var quantity = parseInt(quantityInput.value);
            var sellPrice = parseInt(sellPriceInput.value);
    
            quantity++;
            quantityInput.value = quantity;
            sumInput.value = quantity * sellPrice;

            
        });
    
        // - 버튼 클릭 시 수량 감소
        document.querySelector('input[name="minus"]').addEventListener('click', function() {
            var quantityInput = document.querySelector('input[name="quantity"]');
            var sumInput = document.querySelector('input[name="sum"]');
            var sellPriceInput = document.querySelector('input[name="sell_price"]');
    
            var quantity = parseInt(quantityInput.value);
            var sellPrice = parseInt(sellPriceInput.value);
    
            if (quantity > 1) {
                quantity--;
                quantityInput.value = quantity;
                sumInput.value = quantity * sellPrice;
            }
        });

    </script>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>