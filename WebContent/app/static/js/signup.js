window.addEventListener("submit", (ev) => {
    const loginForm = document.querySeletor(".loginForm");
	const email = document.getElementById("email");
    const password = document.getElementById("password");
    const re_password = document.getElementById("re_password");

    if (password.value !== re_password.value) {
        ev.preventDefault();
        alert("비밀번호가 서로 일치하지 않습니다");
        return;
    }


});