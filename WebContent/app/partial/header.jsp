<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--header start-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="mdl-layout__header mdl-layout__header--waterfall">
	<!-- Top row, always visible -->
	<div class="mdl-layout__header-row">
		<!-- Title -->
		<span class="mdl-layout-title">Coupon People</span>
		<div class="mdl-layout-spacer"></div>
		<!--search-->
		<!-- 		<div
			class="mdl-textfield mdl-js-textfield mdl-textfield--expandable
                            mdl-textfield--floating-label mdl-textfield--align-right">
			<form action="./test.html" method="get">
				<fieldset>
					<label class="mdl-button mdl-js-button mdl-button--icon"
						for="waterfall-exp"> <i class="material-icons">search</i>
					</label>
					<div class="mdl-textfield__expandable-holder">
						<input class="mdl-textfield__input" type="text" name="sample"
							id="waterfall-exp">
					</div>
				</fieldset>
			</form>
		</div> -->

		<!-- user : login / logout -->
		<div class="user-tool">
			<!-- <button class="mdl-button mdl-js-button mdl-button--icon">
                        <i class="material-icons">person</i>
                    </button> -->
			<button id="demo-menu-lower-right"
				class="mdl-button mdl-js-button mdl-button--icon">
				<i class="material-icons">person</i>
			</button>

			<ul
				class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
				for="demo-menu-lower-right">

				<li class="mdl-menu__item"><a
					href="${pageContext.request.contextPath}/app/core/index.jsp">
						MAIN </a></li>

				<!-- 비회원일때 -->
				<c:choose>
					<c:when test="${email eq null}">
						<li class="mdl-menu__item"><a
							href="${pageContext.request.contextPath}/app/user/loginForm.jsp">
								LOGIN </a></li>
						<li class="mdl-menu__item"><a
							href="${pageContext.request.contextPath}/app/user/joinForm.jsp">
								JOIN </a></li>
					</c:when>
					<c:otherwise>
						<!-- 로그인 상태 -->
						<li class="mdl-menu__item"><a
							href="${pageContext.request.contextPath}/app/user/userDetail.jsp?id=${email}">
								MY PAGE </a></li>
						<li class="mdl-menu__item"><a
							href="${pageContext.request.contextPath}/users/logoutOkAction.us">
								LOGOUT </a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</header>
<!-- header drawer layout start -->
<div class="mdl-layout__drawer">
	<span class="mdl-layout-title">Coupon People</span>
	<nav class="mdl-navigation">
		<a class="mdl-navigation__link"
			href="${pageContext.request.contextPath}/app/core/index.jsp">
			메인화면 </a>
		<c:choose>
			<c:when test="${email eq null}">
				<a class="mdl-navigation__link"
					href="${pageContext.request.contextPath}/app/user/loginForm.jsp">
					로그인 </a>
				<a class="mdl-navigation__link"
					href="${pageContext.request.contextPath}/app/user/joinForm.jsp">
					회원가입 </a>
			</c:when>
			<c:otherwise>
				<a class="mdl-navigation__link" href="${pageContext.request.contextPath}/app/coupon/couponList.jsp"> 구매하기 </a>
				<a class="mdl-navigation__link" href="${pageContext.request.contextPath}/app/coupon/createCoupon.jsp"> 판매하기 </a>
				<a class="mdl-navigation__link"
					href="${pageContext.request.contextPath}/app/user/chargeMoney.jsp">
					충전하기 </a>
			</c:otherwise>
		</c:choose>
	</nav>
</div>
<!-- header drawer layout end -->
<!--header end-->