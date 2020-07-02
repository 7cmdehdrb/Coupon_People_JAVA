<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../partial/head.jsp"%>
</head>
<body>

	<c:if test="${email ne null}">
		<script>
			alert("강제 로그아웃 합니다");
			location.href = "http://localhost:8085/Coupon_People_Ver2/users/logoutOkAction.us";
		</script>
	</c:if>

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
					<h2>회원가입</h2>
					<form class="custom-form js_joinForm" action="${pageContext.request.contextPath}/users/signupOkAction.us" method="POST">
						<fieldset>
							<%--
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="file" id="avartar" name="avartar" /> <label class="mdl-textfield__label" for="avartar"></label>
                                    </div>
                                    --%>
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input" type="email"
									id="jsInputAccount" name="email" /> <label
									class="mdl-textfield__label" for="jsInputAccount">이메일</label>
							</div>
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input" type="text"
									id="jsInputAccount" name="nickname" /> <label
									class="mdl-textfield__label" for="jsInputAccount">닉네임</label>
							</div>
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input" type="password"
									id="jsInputAccount" name="password" /> <label
									class="mdl-textfield__label" for="jsInputAccount">비밀번호</label>
							</div>
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input" type="password"
									id="jsInputAccount" name="re_password" /> <label
									class="mdl-textfield__label" for="jsInputAccount">비밀번호
									확인</label>
							</div>
							<!--public radio start-->

							<div class="mdl-card__title mdl-card--expand">
								<label class="mdl-checkbox" for="agreement"> <input
									class="mdl-checkbox__button" type="checkbox" name="agreement"
									id="agreement" /> <span class="mdl-checkbox__label"><strong
										style="color: red;"> [필수] </strong> <a
										href="${pageContext.request.contextPath}/app/modal/privacy.jsp" target="_blank"><strong>이용약관</strong></a>에
										동의합니다 </span>
								</label>
								<%--
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-1">
                                            <input type="radio" id="option-1" class="mdl-radio__button" name="privacy" value="1" checked />
                                            <span class="mdl-radio__label">동의</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-2">
                                            <input type="radio" id="option-2" class="mdl-radio__button" name="privacy" value="0" /> <span class="mdl-radio__label">비동의</span>
                                        </label>
							<a class="form-guidance" href="javascript:;"
								onclick="${pageContext.request.contextPath}/app/modal/privacy.jsp'); return false;">
								개인정보처리방침 확인하기 </a>
                                        --%>
							</div>
							<button type="submit"
								class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
								Join</button>
						</fieldset>
					</form>
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
<script src="${pageContext.request.contextPath}/assets/js/signUpConfirm.js"></script>
</body>
</html>
