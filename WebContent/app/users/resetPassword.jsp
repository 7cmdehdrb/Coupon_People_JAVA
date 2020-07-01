<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../partial/head.jsp"%>
<jsp:useBean id="env" class="com.couponPeople.utils.Myproperties"></jsp:useBean>
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

.form {
	background-color: #f5f5f5;
}

.form:focus {
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

	<div class="container w-1/3 mx-auto my-10">
		<h1 class="text-center text-5xl mt-10">RESET PASSWORD</h1>
		<h2 class="text-center mt-5 mb-10">
			<a href="${pageContext.request.contextPath}/app/core/index.jsp">쿠폰의
				민족으로</a>
		</h2>
		<div class="w-2/3 mx-auto shadow-2xl">
			
			<div class="login_box container w-full mx-auto">
				<form
					action="${pageContext.request.contextPath}/users/resetPasswordAction.us"
					method="post" class="loginForm py-5">
					<input
						class="form block w-2/3 mx-auto my-10 text-center text-xl border-b-4"
						placeholder="이메일" type="email" name="userEmail" id="userEmail" required="required" />
					<button
						class="login_btn block w-2/3 h-12 mx-auto mt-16 text-center text-xl rounded-lg">인증메일 발송</button>
				</form>
			</div>

		</div>
	</div>
</body>
</html>