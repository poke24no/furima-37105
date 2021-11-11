const pay = () => {
  Payjp.setPublicKey("pk_test_f139c2af8333855463fc37d9");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    console.log("フォーム送信時にイベント発火")
  });
};

window.addEventListener("load", pay);