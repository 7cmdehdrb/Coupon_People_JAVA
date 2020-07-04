<%@page import="com.couponPeople.app.user.dao.UserDAO"%>
<%@page import="com.couponPeople.app.coupon.dao.CouponBean"%>
<%@page import="com.couponPeople.app.coupon.dao.CouponDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../partial/head.jsp"%>
</head>
<body>

	<%
		CouponDAO coupon_dao = new CouponDAO();
		List<CouponBean> coupons = coupon_dao.getCouponList();
		UserDAO user_dao = new UserDAO();
	%>

	<div class="custom" id="wrap">
		<!--Material Design Lite -warterfall layout start--->
		<div class="demo-layout-waterfall mdl-layout mdl-js-layout">
			<!-- header -->
			<%@ include file="../partial/header.jsp"%>

			<!-- mainVisual -->
			<div class="mainVisual">
				<div class="container">
					<h2 class="main-tit">쿠폰의 민족</h2>
					<p class="main-para">
						내가 쓰긴 좀 뭐하고, 남주긴 아까울 때....<br> 우리 쿠폰의 민족에 팔아보는 건 어떠신지..?
					</p>
					<a href="#" class="main-btn"> <span>더보기 +</span>
					</a>
				</div>
			</div>

			<!-- main start -->
			<main class="mdl-layout__content custom">
			<div class="page-content">
				<!-- category section start -->
				<section class="category">
					<div class="container">
						<h2 class="category-tit">카테고리</h2>
						<div class="category-wrap">
							<ul>
								<li class="category-list">
								<a href="${pageContext.request.contextPath}/coupons/searchCouponBy.cu?search_field=COUPON_TYPE&search_value=KAKAO"> <i
										class="far fa-gem"></i> <span>카카오 키프티콘</span>
								</a></li>
								<li class="category-list">
								<a href="${pageContext.request.contextPath}/coupons/searchCouponBy.cu?search_field=COUPON_TYPE&search_value=BOOK"> <i
										class="far fa-gem"></i> <span>도서문화 상품권</span>
								</a></li>
								<li class="category-list">
								<a href="${pageContext.request.contextPath}/coupons/searchCouponBy.cu?search_field=COUPON_TYPE&search_value=CULTURE"> <i
										class="far fa-gem"></i> <span>컬쳐랜드 문화상품권</span>
								</a></li>
								<li class="category-list">
								<a href="${pageContext.request.contextPath}/coupons/searchCouponBy.cu?search_field=COUPON_CATAGORY&search_value=CARD"> <i
										class="far fa-gem"></i> <span>상품권</span>
								</a></li>
								<li class="category-list"><a href="${pageContext.request.contextPath}/coupons/searchCouponBy.cu?search_field=COUPON_CATAGORY&search_value=MOVIE"> <i
										class="far fa-gem"></i> <span>영화/공연</span>
								</a></li>
								<li class="category-list"><a href="${pageContext.request.contextPath}/coupons/searchCouponBy.cu?search_field=COUPON_CATAGORY&search_value=BEAUTY"> <i
										class="far fa-gem"></i> <span>뷰티</span>
								</a></li>
								<li class="category-list"><a href="${pageContext.request.contextPath}/coupons/searchCouponBy.cu?search_field=COUPON_CATAGORY&search_value=DESSERT"> <i
										class="far fa-gem"></i> <span>디저트</span>
								</a></li>
								<li class="category-list"><a href="${pageContext.request.contextPath}/coupons/searchCouponBy.cu?search_field=COUPON_CATAGORY&search_value=FOOD"> <i
										class="far fa-gem"></i> <span>식사</span>
								</a></li>
								<li class="category-list"><a href="${pageContext.request.contextPath}/coupons/searchCouponBy.cu?search_field=COUPON_CATAGORY&search_value=MART"> <i
										class="far fa-gem"></i> <span>편의점/마트</span>
								</a></li>
							</ul>
						</div>
					</div>
				</section>
				<!-- category section end -->

				<!-- promotion section start -->
				<section class="promotion">
					<div class="container">
						<h2 class="promotion-tit">NEW!!</h2>
						<div class="promotion-wrap page-content item-list">
							<ul>
								<!-- 아이템 리스트 아이템 시작 -->
								<%=coupons.size()%>

								<%
									for (int i = 0; i < coupons.size(); i++) {
										if (i > 5) {
											break;
										}
								%>

								<li class="promotion-item">
									<div class="demo-card-square mdl-card mdl-shadow--2dp">
										<div class="mdl-card__title mdl-card--expand"
											style="background-image: url(${pageContext.request.contextPath}/assets/imgs/test_coupon.svg);
					                                background-position: center;
					                                background-size: 80% auto;
					                                background-repeat: no-repeat;">
											<h2 class="mdl-card__title-text">
												<strong><%=coupons.get(i).getCoupon_name()%></strong>
											</h2>
										</div>
										<div class="mdl-card__supporting-text">
											<div class="item-owner">
												<a
													href="${pageContext.request.contextPath}/app/user/userDetail.jsp?id=<%=coupons.get(i).getCoupon_owner() %>"><%=user_dao.getUserProfile(coupons.get(i).getCoupon_owner()).getNickname()%></a>
											</div>
											<div class="item-price"><%=coupons.get(i).getCoupon_price()%>원
											</div>
										</div>

										<div class="mdl-card__actions mdl-card--border">
											<a
												href="${pageContext.request.contextPath}/app/coupon/couponDetail.jsp?id=<%=coupons.get(i).getCoupon_num()%>"
												class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
												보러가기</a>
										</div>
									</div>
								</li>
								<!-- 아이템 리스트 아이템 끝 -->

								<%
									}
								%>
							</ul>
						</div>
					</div>
				</section>
				<!-- promotion section end -->
			</div>
			</main>
			<!-- main end -->

			<%@ include file="../partial/footer.jsp"%>

		</div>
		<!--Material Design Lite -warterfall layout end--->
	</div>
</body>
</html>