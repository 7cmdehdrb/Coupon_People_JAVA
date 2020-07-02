<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../partial/head.jsp"%>
<jsp:useBean id="env" class="com.couponPeople.utils.Myproperties"></jsp:useBean>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>

	<c:if test="${email ne null}">
		<script>
			alert("강제 로그아웃 합니다");
			location.href = "http://localhost:8085/Coupon_People_Ver2/users/logoutOkAction.us";
		</script>
	</c:if>

	<form id="kakao"
		action="${pageContext.request.contextPath}/users/kakaoLoginOkAction.us"
		method="post">
		<input type="hidden" id="kakao_email" name="kakao_email" /> <input
			type="hidden" id="kakao_username" name="kakao_username" /> <input
			type="hidden" id="kakao_userImage" name="kakao_userImage" />
	</form>

	<div class="custom" id="wrap">
		<!--Material Design Lite -warterfall layout start--->
		<div class="demo-layout-waterfall mdl-layout mdl-js-layout">
			<!--header start-->
			<%@ include file="../partial/header.jsp"%>
			<!--header end-->

			<!-- main start -->
			<main class="mdl-layout__content custom">
			<div class="page-content">
				<div class="container">
					<h2>LOGIN</h2>
					<form class="custom-form"
						action="${pageContext.request.contextPath}/users/loginOkAction.us"
						method="POST">
						<fieldset>
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input" type="email"
									id="jsInputAccount" name="userEmail"> <label
									class="mdl-textfield__label" for="jsInputAccount">이메일</label>
							</div>
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input" type="password"
									id="jsInputPw" name="userPw"> <label
									class="mdl-textfield__label" for="jsInputAccount"> 비밀번호
								</label>
							</div>
							<button type="submit"
								class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
								Login</button>
							<a type="button"
								href="${pageContext.request.contextPath}/app/user/joinForm.jsp"
								class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
								Sign in </a> <a type="button"
								onclick="kakaoLogin()"
								class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
								<span class="kakao-icon"> <img
									src="${pageContext.request.contextPath}/assets/imgs/kako_icon.svg">
							</span> kakao Login
							</a>
						</fieldset>
					</form>
					<a class="form-guidance"
						href="${pageContext.request.contextPath}/app/user/resetPassword.jsp">
						forgot password.... </a>
				</div>
			</div>
			</main>
			<!-- main end -->

			<%@ include file="../partial/footer.jsp"%>
			<!-- 모달팝업 레이아웃 -->
			<article class="modal-fixed-pop-wrapper">
				<div class="modal-fixed-pop-inner">
					<div class="modal-loading">
						<span class="loading"></span>
					</div>
					<div class="modal-inner-box">
						<div class="modal-inner-content">
							<!-- ajax 내용 -->
						</div>
					</div>
				</div>
			</article>

		</div>
		<!--Material Design Lite -warterfall layout end--->
	</div>
	
		<script>
		const KAKAO_KEY = "<%= env.getProperties().getProperty("KAKAO_API") %>";
	</script>
	<script src="${pageContext.request.contextPath}/assets/js/kakaoLogin.js"></script>
</body>
</html>