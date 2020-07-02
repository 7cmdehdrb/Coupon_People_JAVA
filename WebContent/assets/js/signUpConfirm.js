const form = document.querySelector(".js_joinForm");
const inputs = form.getElementsByTagName("input");

form.addEventListener("submit", (ev) => {
    if (inputs[0].value == "") {
        alert("이메일은 필수항목입니다");
        ev.preventDefault();
        return;
    }

    if (inputs[1].value.length < 3) {
        alert("닉네임은 최소 3글자입니다");
        ev.preventDefault();
        return;
    }

    if (inputs[2].value !== inputs[3].value) {
        alert("비밀번호가 서로 일치하지 않습니다");
        ev.preventDefault();
        return;
    }

    if (inputs[2].value.length < 4) {
        alert("비밀번호는 최소 4글자입니다");
        ev.preventDefault();
        return;
    }

    if (!inputs[4].checked) {
        alert("이용약관에 동의해주세요");
        ev.preventDefault();
        return;
    }
});
