const m_finishForm = document.querySelector(".js_manualFinish");

init = () => {
    $.ajax({
        type: "GET",
        url: `${contextPath}/trades/checkOutdatedTrade.tr?id=${couponId}`,
        dataType: "text",
        success: function (response) {
            if (response == "ok") {
                m_finishForm.style.display = null;
                manualFinishCheck = true;
            }
        },
    });
};

init();
