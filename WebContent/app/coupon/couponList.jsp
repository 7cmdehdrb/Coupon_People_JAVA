<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.couponPeople.app.coupon.dao.CouponBean"%>
<%@page import="com.couponPeople.app.coupon.dao.CouponDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../partial/head.jsp"%>
</head>
<body>

	<%
		String session_email = (String) request.getSession().getAttribute("email");
		CouponDAO coupon_dao = new CouponDAO();
		List<CouponBean> coupons = new ArrayList<CouponBean>();
		coupons = (ArrayList<CouponBean>) request.getAttribute("coupons");
	%>

	<div class="custom item-list" id="wrap">
		<!--Material Design Lite -warterfall layout start--->
		<div class="demo-layout-waterfall mdl-layout mdl-js-layout">
			<!--header start-->
			<%@ include file="../partial/header.jsp"%>
			<!--header end-->

			<!-- 상품 검색바 시작 -->
			<!-- Expandable Textfield -->
			<div class="container">
				<form
					action="${pageContext.request.contextPath}/coupons/searchCoupon.cu"
					method="get">
					<div
						class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
						<label class="mdl-button mdl-js-button mdl-button--icon"
							for="sample6"> <i class="material-icons">search</i>
						</label>
						<div class="mdl-textfield__expandable-holder">
							<input class="mdl-textfield__input" type="text" id="sample6"
								name="search_value" placeholder="검색할 쿠폰 이름" /> <label
								class="mdl-textfield__label" for="sample-expandable">Expandable
								Input</label>
						</div>
					</div>
				</form>
			</div>
			<!-- 상품 검색바 끝 -->

			<!-- main start -->
			<main class="mdl-layout__content custom">
			<div class="page-content item-list">
				<div class="container">
					<h2>구매하기</h2>
					<!--item start-->
					<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
						<colgroup>
							<col width="10%">
							<col width="65%">
							<col width="15%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th class="center">no.</th>
								<th class="mdl-data-table__cell--non-numeric">상품이름</th>
								<th class="center">타입</th>
								<th class="center">카테고리</th>
								<th class="center">작성자</th>
								<th class="center">가격</th>
							</tr>
						</thead>

						<tbody>

							<%
								for (CouponBean coupon : coupons) {
							%>

							<tr>
								<td class="center"><%=coupon.getCoupon_num()%></td>
								<td class="mdl-data-table__cell--non-numeric"><a
									href="${pageContext.request.contextPath}/coupons/getCouponDetail.cu?id=<%= coupon.getCoupon_num() %>">
										<c:if test="<%=coupon.getCoupon_buyer() != null%>">
											<%-- 필요한거: 판매완료 / 구매완료 / 사용완료 --%>
											<c:if test="<%=session_email != null%>">
												<%-- 판매완료 --%>
												<c:if
													test="<%=coupon.getCoupon_buyer().equals(session_email)%>">
													<c:choose>
														<c:when test="<%=coupon.getIs_coupon_finished() == 0%>">
															<strong>[구매완료]</strong>
														</c:when>
														<c:otherwise>
															<strong>[사용완료]</strong>
														</c:otherwise>
													</c:choose>
												</c:if>
												<c:if
													test="<%=coupon.getCoupon_owner().equals(session_email)%>">
													<c:choose>
														<c:when test="<%=coupon.getIs_coupon_finished() == 0%>">
															<strong>[승인전]</strong>
														</c:when>
														<c:otherwise>
															<strong>[승인완료]</strong>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:if>
										</c:if> <%=coupon.getCoupon_name()%></a></td>
								<td class="center"><a
									href="${pageContext.request.contextPath}/coupons/searchCouponBy.cu?search_field=COUPON_TYPE&search_value=<%=coupon.getCoupon_type()%>"><%=coupon_dao.alterCouponType(coupon.getCoupon_type())%></a></td>
								<td class="center"><a
									href="${pageContext.request.contextPath}/coupons/searchCouponBy.cu?search_field=COUPON_CATAGORY&search_value=<%=coupon.getCoupon_catagory()%>"><%=coupon_dao.alterCouponCatagory(coupon.getCoupon_catagory())%></a></td>
								<td class="center"><a
									href="${pageContext.request.contextPath}/app/user/userDetail.jsp?id=<%= coupon.getCoupon_owner() %>"><%=coupon.getCoupon_owner()%></a></td>
								<td class="center"><%=coupon.getCoupon_price()%>원</td>
							</tr>

							<%
								}
							%>

						</tbody>

					</table>
					<!--item end-->
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
</body>
</html>