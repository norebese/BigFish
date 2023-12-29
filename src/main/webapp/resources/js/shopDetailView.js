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

function buyShop(sno) {
    const quantity = document.getElementById("quantity").value
    const total_amount = document.getElementById("total_amount").value

    console.log(quantity)
    console.log(total_amount)
    location.href="listasdf.SHbo?sno=" + sno + "&quantity=" + quantity + "&total_amount=" + total_amount;
}