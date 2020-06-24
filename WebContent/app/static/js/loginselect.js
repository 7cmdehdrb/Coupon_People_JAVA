const loginSelector = document.querySelectorAll(".login_select");
const isAdmin = document.querySelector(".isAdmin");
const userId = document.querySelector("#userId");
const userPw = document.querySelector("#userPw");

changeSelector = (bool) => {
    switch (bool) {
        case true:
            isAdmin.value = "normal";
            loginSelector[0].style.backgroundColor = "#f5f5f5";
            loginSelector[1].style.backgroundColor = "#E6E6E6";
            break;

        case false:
            isAdmin.value = "admin";
            loginSelector[0].style.backgroundColor = "#E6E6E6";
            loginSelector[1].style.backgroundColor = "#f5f5f5";
            break;

        default:
            break;
    }
};
