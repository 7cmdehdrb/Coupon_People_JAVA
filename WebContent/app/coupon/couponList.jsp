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
		CouponDAO coupon_dao = new CouponDAO();
		List<CouponBean> coupons = coupon_dao.getCouponList();
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
					action="${pageContext.request.contextPath}/app/coupon/couponList.jsp"
					method="get">
					<div
						class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
						<label class="mdl-button mdl-js-button mdl-button--icon"
							for="sample6"> <i class="material-icons">search</i>
						</label>
						<div class="mdl-textfield__expandable-holder">
							<input class="mdl-textfield__input" type="text" id="sample6">
							<label class="mdl-textfield__label" for="sample-expandable">Expandable
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
								for(CouponBean coupon: coupons){
							%>

							<tr>
								<td class="center"><%= coupon.getCoupon_num() %></td>
								<td class="mdl-data-table__cell--non-numeric">
									<a href="${pageContext.request.contextPath}/app/coupon/couponDetail.jsp?id=<%= coupon.getCoupon_num() %>"><%= coupon.getCoupon_name() %></a>
								</td>
								<td class="center"><%= coupon_dao.alterCouponType(coupon.getCoupon_type()) %></td>
								<td class="center"><%= coupon_dao.alterCouponCatagory(coupon.getCoupon_catagory()) %></td>
								<td class="center"><a href="${pageContext.request.contextPath}/app/user/userDetail.jsp?id=<%= coupon.getCoupon_owner() %>"><%= coupon.getCoupon_owner() %></a></td>
								<td class="center"><%= coupon.getCoupon_price() %>원</td>
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