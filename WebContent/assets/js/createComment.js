const form = document.querySelector(".js_comment_form");

form.addEventListener("submit", (ev) => {
    const textForm = form.querySelector(".js_comment_text");

    if (textForm.value === "로그인 후에 작성해주세요") {
        ev.preventDefault();
        alert("로그인 후에 작성해주세요");
        location.href = "http://localhost:8085/Coupon_People_Ver2/app/user/loginForm.jsp";
        return;
    }
});
