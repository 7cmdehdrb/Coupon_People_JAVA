const IMP = window.IMP;

init = () => {
    IMP.init(IMP_KEY.trim());
};

kakaoPay = (price, charge) => {
    IMP.request_pay(
        {
            pg: "kakao",
            pay_method: "card",
            merchant_uid: "merchant_" + new Date().getTime(),
            name: `쿠폰의 민족 ${charge} 포인트`,
            amount: price,
            buyer_email: BUYER_EMAIL,
            buyer_name: BUYER_NICKNAME,
            m_redirect_url: "http://localhost:8085/Coupon_People_Ver2/app/core/index.jsp",
        },
        function (rsp) {
            if (rsp.success) {
                var msg = `${price}원 결제가 완료되었습니다`;

                $.ajax({
                    type: "post",
                    url: `http://localhost:8085/Coupon_People_Ver2/users/payOkAction.us`,
                    data: {
                        user: BUYER_EMAIL,
                        charge: charge,
                    },
                    success: function (response) {
                        if (response == 1) {
                            alert(msg);
                            location.href = "http://localhost:8085/Coupon_People_Ver2/app/core/index.jsp";
                        } else {
                            alert("Unknown Error... Please contact admin");
                        }
                    },
                    fail: function (err) {
                        console.log("ajax error");
                        console.log(err);
                        alert("Unknown Error... Please contact admin");
                    },
                });
            } else {
                var msg = `결제 실패: ${rsp.error_msg}`;
                alert(msg);
            }
        }
    );
};

init();

document.addEventListener("submit", (ev) => {
    ev.preventDefault();

    const temp = document.getElementsByName("money");

    temp.forEach((element) => {
        if (element.checked) {
            kakaoPay(element.value, element.value);
            return;
        }
    });

    // const selected = temp.filter((element) => element.checked);

    // console.log(selected);
});
