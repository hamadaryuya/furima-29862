function price() {
  const market_price = document.getElementById("item-price");
  const add_tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  market_price.addEventListener("keyup", () => {
    const selling_price = market_price.value;
    let fee = selling_price * 0.1
    let gains = selling_price * 0.9
    add_tax.textContent = fee;
    profit.textContent = gains;
  });
}
window.addEventListener("load", price);

