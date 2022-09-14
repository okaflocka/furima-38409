window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const sellFee = document.getElementById("add-tax-price")
    sellFee.innerHTML = Math.floor(inputValue*0.1)
    const profit = document.getElementById("profit")
    profit.innerHTML =Math.floor(inputValue *0.9)
 })
})
