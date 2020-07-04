const inputs = document.querySelectorAll(".js_input");
const dateInput = document.querySelector(".js_dateInput");

document.addEventListener("submit", (ev) => {
    const today = new Date();
    const limitDay = new Date();
    limitDay.setDate(today.getDate() + 7);
    const coupon_date = new Date(dateInput.value);

    for (let index = 0; index < inputs.length; index++) {
        if (index !== 2) {
            if (inputs[index].value.length == 0) {
                ev.preventDefault();
                alert("필수 항목을 모두 작성해주세요");
                return;
            }
        }
    }

    if (coupon_date < limitDay) {
        ev.preventDefault();
        alert("유효기간 만료일이 7일 미만 남은 쿠폰은 등록할 수 없습니다");
        return;
    }
});
