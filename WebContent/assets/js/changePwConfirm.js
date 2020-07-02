const form = document.querySelector(".js_changePasswordForm");

form.addEventListener("submit", (ev) => {
    const password0 = document.querySelector(".js_password0").value;
    const password1 = document.querySelector(".js_password1").value;
    const password2 = document.querySelector(".js_password2").value;

    if (password1 !== password2) {
        ev.preventDefault();
        alert("비밀번호가 서로 일치하지 않습니다!");
        return;
    }

    if (password0.length < 4 || password1.length < 4 || password2.length < 4) {
        ev.preventDefault();
        alert("비밀번호의 길이는 최소 4글자입니다");
        return;
    }
});
