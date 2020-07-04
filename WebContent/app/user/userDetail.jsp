<!DOCTYPE html>
<%@page import="com.couponPeople.app.review.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.couponPeople.app.user.dao.UserDAO"%>
<%@page import="com.couponPeople.app.user.dao.UserBean"%>
<html lang="en">
<head>
<%@ include file="../partial/head.jsp"%>
</head>
<body>

	<c:if test="${email eq null}">
		<script>
			alert("로그인이 필요합니다");
			location.href = "http://localhost:8085/Coupon_People_Ver2/app/user/loginForm.jsp";
		</script>
	</c:if>

	<%
		String page_email = request.getParameter("id");
		UserBean user = null;
		UserDAO user_dao = new UserDAO();
		ReviewDAO review_dao = new ReviewDAO();

		if (page_email != null) {
			try {
				user = new UserBean();
				user = user_dao.getUserProfile(page_email);
			} catch (Exception e) {
				;
			}
		}
	%>

	<c:set var="page_user_email"><%=page_email%></c:set>

	<c:choose>
		<c:when test="<%=user == null%>">
			<script>
				alert("Invalid Email");
				location.href = "http://localhost:8085/Coupon_People_Ver2/app/core/index.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<div class="custom user-detail" id="wrap">
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
							<div class="demo-card-square mdl-card mdl-shadow--2dp">
								<div class="avartar-container">
									<c:choose>
										<c:when test="<%=user.getProfile_image() == null%>">
											<img
												src="${pageContext.request.contextPath}/assets/imgs/profile_test.jpg"
												alt="">
										</c:when>
										<c:otherwise>
											<img src="<%=user.getProfile_image()%>" alt="">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="mdl-card__supporting-text">email</div>
								<div class="mdl-card__title mdl-card--expand">
									<h2 class="mdl-card__title-text">
										<%=user.getEmail()%>
									</h2>
								</div>

								<div class="mdl-card__supporting-text">nickname</div>
								<div class="mdl-card__title mdl-card--expand">
									<h2 class="mdl-card__title-text">
										<%=user.getNickname()%>
									</h2>
								</div>

								<div class="mdl-card__supporting-text">score</div>
								<div class="mdl-card__title mdl-card--expand">
									<h2 class="mdl-card__title-text"><%=review_dao.getAverageReview(page_email)%></h2>
								</div>

								<div class="mdl-card__supporting-text">point</div>
								<div class="mdl-card__title mdl-card--expand">
									<h2 class="mdl-card__title-text">
										<c:choose>
											<c:when test="${ page_user_email eq email }">
												<%=user.getMoney()%>
											</c:when>
											<c:otherwise>
												<%=user.getIs_money_public() == 1 ? user.getMoney() : "비공개"%>
											</c:otherwise>
										</c:choose>
									</h2>
								</div>

								<c:if test="${ page_user_email eq email }">
									<div class="mdl-card__actions mdl-card--border">
										<a
											href="${pageContext.request.contextPath}/coupons/searchCouponByBuyer.cu"
											class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
											See My Bought Coupons </a>
									</div>
									<div class="mdl-card__actions mdl-card--border">
										<a
											href="${pageContext.request.contextPath}/app/user/editUser.jsp"
											class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
											Edit Profile </a>
									</div>

									<%
										if (user.getLogin_method().toUpperCase().equals("LOCAL")) {
									%>
									<div class="mdl-card__actions mdl-card--border">
										<a
											href="${pageContext.request.contextPath}/app/user/changePw.jsp"
											class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
											Change PassWord </a>
									</div>
									<%
										}
									%>
								</c:if>
								<div class="mdl-card__actions mdl-card--border">
									<a
										href="${pageContext.request.contextPath}/coupons/searchCouponByUser.cu?id=<%=page_email %>"
										class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
										See ${email}'s Coupons </a>
								</div>
								<form class="js_doReview" method="POST"
									action="${pageContext.request.contextPath}/reviews/doReview.re">
									<input type="hidden" name="review_to"
										value="<%=user.getEmail()%>" /> <input type="hidden"
										name="review_from" value="${email}" />
								</form>
								<div class="mdl-card__actions mdl-card--border">
									<a onclick="doReview()"
										class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
										Do Survey </a>
								</div>


							</div>
							<!--profile card end-->


						</div>
					</div>
					</main>
					<!-- main end -->

					<%@ include file="../partial/footer.jsp"%>

				</div>
				<!--Material Design Lite -warterfall layout end--->
			</div>

			<script
				src="${pageContext.request.contextPath}/assets/js/doReview.js"></script>
		</c:otherwise>
	</c:choose>
</body>
</html>