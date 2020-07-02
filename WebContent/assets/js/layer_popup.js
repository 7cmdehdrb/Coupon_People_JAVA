function layerLoad(strUrl) {
	var $modalWrap = $(".modal-fixed-pop-wrapper");

	$("html").css({
		"margin-right":"17px",
		"overflow-y":"hidden"
	});
	$modalWrap.fadeIn();
	
	$.ajax({
		type: "POST",
		url: strUrl,
		data: "",
		success: function(resultText){
			$modalWrap.find(".modal-inner-content").html(resultText);
		},
		error: function() {
			alert("오류!");
			$(".modal-fixed-pop-wrapper").hide();
			$("html").css({
				"margin-right":"0",
				"overflow-y":"scroll"
			});
		},
		beforeSend:function(){ 
			$('.modal-loading').fadeIn(); 
		},
		complete:function(){ 
			$('.modal-loading').hide();
		}
	});
}
$(document).ready(function  () {
	var $modalWrap = $(".modal-fixed-pop-wrapper");
	$(".modal-close-btn").click(function  () {
		$(".modal-inner-content").empty();
		$modalWrap.css("display","none");
		$("html").css({
			"margin-right":"0",
			"overflow-y":"scroll"
		});
		$modalWrap.fadeOut();
		return false;
	});
});