<!DOCTYPE html>
<%@page import="com.couponPeople.app.user.dao.UserDAO"%>
<%@page import="com.couponPeople.app.user.dao.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<%@ include file="../partial/head.jsp"%>
</head>
<body>

	<%-- java --%>

	<c:if test="${email eq null}">
		<script>
			alert("로그인이 필요합니다");
			location.href = "http://localhost:8085/Coupon_People_Ver2/app/user/loginForm.jsp";
		</script>
	</c:if>

	<%
		String user_email = (String) request.getSession().getAttribute("email");

		UserBean user = null;
		UserDAO user_dao = new UserDAO();

		try {
			if (user_email != null) {
				user = user_dao.getUserProfile(user_email);
			}
		} catch (Exception e) {
			;
		}
	%>

	<%
		if (user == null) {
	%>

	<script>
		alert("로그인이 필요합니다");
		location.href = "http://localhost:8085/Coupon_People_Ver2/app/user/loginForm.jsp";
	</script>

	<%
		} else if (user.getLogin_method().toUpperCase().contains("KAKAO")) {
	%>

	<script>
		alert("로컬 유저만 변경할 수 있습니다");
		location.href = "http://localhost:8085/Coupon_People_Ver2/app/core/index.jsp";
	</script>

	<%
		}
	%>

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
					<h2>Change Password</h2>
					<form id="js_changePasswordForm" class="custom-form"
						action="${pageContext.request.contextPath}/users/changePasswordOkAction.us"
						method="POST">
						<fieldset>
							<input type="hidden" name="userEmail" value="${email}" />
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input js_password0" type="password"
									id="jsInputAccount" name="pw_1"> <label
									class="mdl-textfield__label" for="jsInputAccount">현재
									비밀번호</label>
							</div>
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input js_password1" type="password"
									id="jsInputAccount" name="pw_2"> <label
									class="mdl-textfield__label" for="jsInputAccount">새
									비밀번호</label>
							</div>
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input js_password2" type="password"
									id="jsInputAccount" name="pw_3"> <label
									class="mdl-textfield__label" for="jsInputAccount">새
									비밀번호 확인</label>
							</div>

							<button type="submit"
								class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
								변경하기</button>
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

	<script
		src="${pageContext.request.contextPath}/assets/js/changePwConfirm.js"></script>
</body>
</html>