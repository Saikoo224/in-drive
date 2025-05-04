let cart = [];
let totalPrice = 0;

function addToCart(bookName, price) {
    cart.push({ bookName, price });
    totalPrice += price;
    updateCart();
}

function updateCart() {
    let cartList = document.getElementById("cart-list");
    let totalElement = document.getElementById("total-price");

    cartList.innerHTML = "";
    cart.forEach(item => {
        let li = document.createElement("li");
        li.textContent = ${item.bookName} - ${item.price} جنيه;
        cartList.appendChild(li);
    });

    totalElement.textContent = الإجمالي: ${totalPrice}جنيه;
}