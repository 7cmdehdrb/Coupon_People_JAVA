<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<%@ include file="../partial/head.jsp"%>
</head>
<body>

	<c:if test="${email ne null}">
		<script>
			alert("강제 로그아웃 합니다");
			location.href = `${pageContext.request.contextPath}/users/logoutOkAction.us`;
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
					<h2>PASSWORD RESET</h2>
					<form class="custom-form"
						action="${pageContext.request.contextPath}/users/resetPasswordAction.us"
						method="POST">
						<fieldset>
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input" type="email"
									id="jsInputAccount" name="userEmail"> <label
									class="mdl-textfield__label" for="jsInputAccount">이메일</label>
							</div>
							<button type="submit"
								class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
								RESET</button>
						</fieldset>
					</form>
				</div>
			</div>
			</main>
			<!-- main end -->

			<%@ include file="../partial/footer.jsp"%>

		</div>
		<!--Material Design Lite -warterfall layout end--->
	</div>

	<script src="changePwConfirm.js"></script>
</body>
</html>