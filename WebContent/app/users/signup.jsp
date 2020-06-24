<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../partial/head.jsp"%>
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

.extraLogin {
	color: #a3aebe;
}
</style>
</head>
<body>

	<c:if test="${email ne null}">
		<script>
			location.href = "http://localhost:8085/Coupon_People_Ver2/app/core/index.jsp";
		</script>
	</c:if>

	<div class="container w-1/3 mx-auto my-10">
		<h1 class="text-center text-5xl mt-10">SIGN UP</h1>

		<h2 class="text-center mt-5 mb-10">
			<a href="${pageContext.request.contextPath}/app/core/index.jsp">쿠폰의 민족으로</a>
		</h2>

		<div class="w-2/3 mx-auto shadow-2xl">
			<div class="login_box container w-full mx-auto">
				<form
					action="${pageContext.request.contextPath}/users/signupOkAction.us"
					method="post" class="loginForm py-5">
					<div class="text-center text-3xl my-5 mx-auto">계정정보</div>
					<input
						class="login_input block w-2/3 mx-auto my-10 text-center text-xl border-b-4"
						placeholder="(필수)이메일" type="email" name="email" id="email"
						required="required" />
					<div class="text-center" id="emailValidAlert"></div>
					<input
						class="login_input block w-2/3 mx-auto my-10 text-center text-xl border-b-4"
						placeholder="(필수)닉네임" type="text" name="nickname" id="nickname"
						required="required" />
					<div
						class="login_input block w-2/3 mx-auto my-10 text-center text-xl">
						<label class="extraLogin" for="profileImage">(필수)프로필 사진</label> <br>
						<input class="extraLogin text-base" type="file"
							name="profileImage" id="profileImage" required="required" />
					</div>
					<input
						class="login_input block w-2/3 mx-auto my-10 text-center text-xl border-b-4"
						placeholder="(필수)비밀번호" type="password" name="password"
						id="password" required="required" /> <input
						class="login_input block w-2/3 mx-auto my-10 text-center text-xl border-b-4"
						placeholder="(필수)비밀번호 확인" type="password" name="re_password"
						id="re_password" required="required" /> <label
						class="extraLogin block w-2/3 mx-auto my-5 text-center text-xl">관심분야</label>

					<div class="login_input block w-2/3 mx-auto text-center text-xl">
						<label class="extraLogin" for="interest1">상품권</label> <input
							type="checkbox" name="interest" id="interest1" value="상품권" /> <label
							class="extraLogin" for="interest2">영화/공연</label> <input
							type="checkbox" name="interest" id="interest2" value="영화/공연" />
						<label class="extraLogin" for="interest3">뷰티</label> <input
							type="checkbox" name="interest" id="interest3" value="뷰티" /> <br />
						<label class="extraLogin" for="interest4">디저트</label> <input
							type="checkbox" name="interest" id="interest4" value="디저트" /> <label
							class="extraLogin" for="interest5">식사</label> <input
							type="checkbox" name="interest" id="interest5" value="식사" /> <label
							class="extraLogin" for="interest6">편의점/마트</label> <input
							type="checkbox" name="interest" id="interest6" value="편의점/마트" />
					</div>

					<div class="text-center text-3xl my-5 mx-auto">약관동의</div>
					<div class="block my-4 text-center text-xl">
						<input type="checkbox" name="agreement1" id="agreement1"
							required="required" /><label for="agreement1"> <span
							class="font-bold text-red-600">[필수]</span>서비스 이용약관 동의
						</label>
					</div>
					<div class="block my-4 text-center text-xl">
						<input type="checkbox" name="agreement2" id="agreement2" required="required" /><label
							for="agreement2"> <span class="font-bold text-red-600">[필수]</span>개인정보
							취급방침 동의
						</label>
					</div>
					<div class="block my-4 text-center text-xl">
						<input type="checkbox" name="agreement3" id="agreement3" required="required" /><label
							for="agreement3"> <span class="font-bold text-red-600">[필수]</span>개인정보
							이용/수집 동의
						</label>
					</div>

					<button
						class="login_btn block w-2/3 h-12 mx-auto mt-16 text-center text-xl rounded-lg">회원가입</button>
				</form>
			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/app/static/js/signup.js"></script>

</body>
</html>