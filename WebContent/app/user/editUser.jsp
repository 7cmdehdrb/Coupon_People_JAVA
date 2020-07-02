<%@page import="com.couponPeople.app.user.dao.UserBean"%>
<%@page import="com.couponPeople.app.user.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../partial/head.jsp"%>
</head>
<body>

	<%-- java --%>


	<c:choose>
		<c:when test="${email eq null}">
			<script>
				alert("로그인이 필요합니다");
				location.href = "http://localhost:8085/Coupon_People_Ver2/app/user/loginForm.jsp";
			</script>
		</c:when>
		<c:otherwise>

			<%
				String session_email = (String) request.getSession().getAttribute("email");

						UserBean user = null;
						UserDAO user_dao = new UserDAO();

						try {
							user = user_dao.getUserProfile(session_email);
						} catch (Exception e) {
							;
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
							<!-- <h2>User Profile</h2> -->
							<!--profile card start-->
							<h2>Edit User</h2>
							<div class="demo-card-square mdl-card mdl-shadow--2dp">
								<form name="editUserForm"
									action="${pageContext.request.contextPath}/user/UserEditOk.us"
									method="post">
									<fieldset>
										<div class="mdl-card__supporting-text">
											<div
												class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
												<input class="mdl-textfield__input" type="text"
													id="nickName" name="nickName"
													value="<%=user.getNickname()%>"> <label
													class="mdl-textfield__label" for="nickName">nickName...</label>
											</div>
										</div>

										<!--public radio start-->
										<h4>개인정보 공개범위</h4>

										<div class="mdl-card__title mdl-card--expand">
											<h5>잔액 :</h5>
											<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
												for="option-5"> <input type="radio" id="option-5"
												class="mdl-radio__button" name="is_money_public" value="1"
												<%=user.getIs_money_public() == 1 ? "checked" : ""%>>
												<span class="mdl-radio__label">공개</span>
											</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
												for="option-6"> <input type="radio" id="option-6"
												class="mdl-radio__button" name="is_money_public" value="0"
												<%=user.getIs_money_public() == 0 ? "checked" : ""%>>
												<span class="mdl-radio__label">비공개</span>
											</label>
										</div>

										<div class="mdl-card__actions mdl-card--border">
											<a href="javascript:editUserForm.submit()"
												class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
												Confirm </a>
										</div>
									</fieldset>
								</form>
								<div class="mdl-card__actions mdl-card--border">
									<a class="mdl-button mdl-js-button mdl-js-ripple-effect"
										href="${pageContext.request.contextPath}/app/user/changePw.jsp">
										Change Password </a>
								</div>
							</div>
							<!--profile card end-->
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
		</c:otherwise>
	</c:choose>


</body>
</html>