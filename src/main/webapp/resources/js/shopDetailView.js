// 수량 필드와 버튼 요소 가져오기
const amountInput = document.querySelector('input[name="amount"]');
const addButton = document.querySelector('input[name="add"]');
const minusButton = document.querySelector('input[name="minus"]');
const sumInput = document.querySelector('input[name="sum"]');

// 수량 증가 버튼 클릭 시 이벤트 처리
addButton.addEventListener('click', function() {
    let amount = parseInt(amountInput.value);
    amount += 1;
    amountInput.value = amount;
    calculateTotal();
});

// 수량 감소 버튼 클릭 시 이벤트 처리
minusButton.addEventListener('click', function() {
    let amount = parseInt(amountInput.value);
    if (amount > 1) {
        amount -= 1;
        amountInput.value = amount;
        calculateTotal();
    }
});

// 수량 변경 시 이벤트 처리
amountInput.addEventListener('input', function() {
    let amount = parseInt(amountInput.value);
    if (amount < 1 || isNaN(amount)) {
        amount = 1;
        amountInput.value = amount;
    }
    calculateTotal();
});

// 총 상품 금액 계산 함수
function calculateTotal() {
    const sellPrice = parseInt(document.querySelector('input[name="sell_price"]').value);
    const amount = parseInt(amountInput.value);
    const total = sellPrice * amount;
    sumInput.value = total;
}
