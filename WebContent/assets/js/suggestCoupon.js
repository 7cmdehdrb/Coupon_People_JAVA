const finalForm = document.querySelector(".js_tradeSuggestion");
const actionForm = finalForm.querySelector(".js_actionForm");
const couponForm = finalForm.querySelector(".js_couponForm");

makeSuggestion = (action) => {
    if (action === "" || action === null) {
        alert("ERROR");
        return;
    }

    actionForm.value = action;
    finalForm.submit();
};
