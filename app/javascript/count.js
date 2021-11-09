function count (){
  const price      = document.getElementById("item-price");
  price.addEventListener("keyup",() =>{
    const commission = document.getElementById("add-tax-price");
    commission.innerHTML = Math.floor(`${(price.value) * 0.1}`)
    const profit     = document.getElementById("profit");
    profit.innerHTML = `${(price.value) - Math.floor((price.value) * 0.1)}`;
  });
};

window.addEventListener('load', count);

