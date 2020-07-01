<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../partial/head.jsp"%>
<jsp:useBean id="env" class="com.couponPeople.utils.Myproperties"></jsp:useBean>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap"
	rel="stylesheet" />
<style>
body {
	background-color: #d5d5d5;
}

h1 {
	font-family: "Fredoka One", cursive;
}

.login_box {
	background-color: #f5f5f5;
}

.login_input {
	background-color: #f5f5f5;
}

.login_input:focus {
	background-color: #f5f5f5;
	outline: none;
}

.login_btn {
	background-color: #0eb4b4;
}

.login_btn:hover {
	background-color: #099b9b;
}
</style>
</head>
<body>

	<c:if test="${email ne null}">
		<script>
			location.href = "http://localhost:8085/Coupon_People_Ver2/app/core/index.jsp";
		</script>
	</c:if>

	<form id="kakao"
		action="${pageContext.request.contextPath}/users/kakaoLoginOkAction.us"
		method="post">
		<input type="hidden" id="kakao_email" name="kakao_email" /> <input
			type="hidden" id="kakao_username" name="kakao_username" /> <input
			type="hidden" id="kakao_userImage" name="kakao_userImage" />
	</form>

	<div class="container w-1/3 mx-auto my-10">
		<h1 class="text-center text-5xl mt-10">LOGIN</h1>
		<h2 class="text-center mt-5 mb-10">
			<a href="${pageContext.request.contextPath}/app/core/index.jsp">쿠폰의
				민족으로</a>
		</h2>
		<div class="w-2/3 mx-auto shadow-2xl">
			<div
				class="login_box flex w-full h-16 mx-auto content-center text-center">
				<div style="cursor: default; line-height: 4rem;"
					class="login_select flex-1 h-full self-center text-xl"
					onclick="changeSelector(true)">
					<span>일반사용자</span>
				</div>
				<div
					style="cursor: default; line-height: 4rem; background-color: #e6e6e6;"
					class="login_select flex-1 h-full self-center text-xl"
					onclick="changeSelector(false)">관리자</div>
			</div>
			<div class="login_box container w-full mx-auto">
				<form
					action="${pageContext.request.contextPath}/users/loginOkAction.us"
					method="post" class="loginForm py-5">
					<input type="hidden" class="isAdmin" name="isAdmin" value="normal" />
					<input
						class="login_input block w-2/3 mx-auto my-10 text-center text-xl border-b-4"
						placeholder="이메일" type="email" name="userId" id="userId" required="required" /> <input
						class="login_input block w-2/3 mx-auto my-10 text-center text-xl border-b-4"
						placeholder="비밀번호" type="password" name="userPw" id="userPw" required="required" />
					<button
						class="login_btn block w-2/3 h-12 mx-auto mt-16 text-center text-xl rounded-lg">로그인</button>
				</form>
			</div>

			<div
				class="login_box container flex w-full justify-between text-center mx-auto py-2">
				<a href="${pageContext.request.contextPath}/app/users/signup.jsp"
					class="flex-1"><i class="fas fa-sign-in-alt"></i> 회원가입</a> <a
					href="${pageContext.request.contextPath}/app/users/resetPassword.jsp" class="flex-1"><i
					class="fas fa-user-secret"></i> 비밀번호 재설정</a>
			</div>

			<hr />
			<hr />
			<hr />

			<div class="login_box container w-full mx-auto pb-5">
				<h2 class="text-center pt-10">이미 SNS계정으로 가입했다면</h2>

				<div class="w-1/2 mx-auto text-center">
					<div
						class="block my-6 py-4 rounded-lg bg-yellow-400 hover:bg-yellow-500"
						onclick="kakaoLogin()">
						<i class="fas fa-sms"></i> 카카오로 로그인
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		const KAKAO_KEY = "<%= env.getProperties().getProperty("KAKAO_API") %>";
	</script>
	<script src="${pageContext.request.contextPath}/app/static/js/loginselect.js"></script>
	<script src="${pageContext.request.contextPath}/app/static/js/kakaoLogin.js"></script>
</body>
</html>