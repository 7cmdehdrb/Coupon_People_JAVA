const tradeForm = document.querySelector(".js_tradeForm");
const expectedMoney = document.querySelector(".js_expectedMoney");

buyCoupon = () => {
    if (parseInt(expectedMoney.innerText) >= 0) {
        tradeForm.submit();
    } else {
        alert("잔액이 부족합니다");
        location.href = "http://localhost:8085/Coupon_People_Ver2/app/user/chargeMoney.jsp";
    }
};
