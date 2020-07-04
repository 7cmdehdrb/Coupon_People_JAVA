const inputs = document.querySelectorAll(".js_input");

document.addEventListener("submit", (ev) => {
    for (let index = 0; index < inputs.length; index++) {
        if (index !== 2) {
            if (inputs[index].value.length == 0) {
                ev.preventDefault();
                alert("필수 항목을 모두 작성해주세요");
                return;
            }
        }
    }
});
