<%@page import="com.couponPeople.app.user.dao.UserDAO"%>
<%@page import="com.couponPeople.app.user.dao.UserBean"%>
<%@page import="com.couponPeople.app.comment.dao.CommentDAO"%>
<%@page import="com.couponPeople.app.comment.dao.CommentBean"%>
<%@page import="com.couponPeople.app.coupon.dao.CouponDAO"%>
<%@page import="com.couponPeople.app.coupon.dao.CouponBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../partial/head.jsp"%>
</head>
<body>


	<%
		String coupon_id = request.getParameter("id");
		UserBean user = null;
		UserDAO user_dao = new UserDAO();
		CouponBean coupon = null;
		CouponDAO coupon_dao = new CouponDAO();
		List<CommentBean> comments = null;
		CommentDAO comment_dao = new CommentDAO();

		if (coupon_id != null) {
			try {
				coupon = coupon_dao.getCouponDetail(Integer.parseInt(coupon_id));
				comments = comment_dao.getComments(Integer.parseInt(coupon_id));
			} catch (Exception e) {
				;
			}
		}
	%>

	<c:set var="page_user_email"><%=coupon%></c:set>

	<c:choose>
		<c:when test="<%=coupon == null%>">
			<script>
				alert("Invalid ID");
				location.href = "http://localhost:8085/Coupon_People_Ver2/app/coupon/couponList.jsp";
			</script>
		</c:when>
		<c:otherwise>

			<div class="custom" id="wrap">
				<!--Material Design Lite -warterfall layout start Ã¬ÂÂ¨Ã« ì¨ë°Â°Â--->
				<div class="demo-layout-waterfall mdl-layout mdl-js-layout">

					<!--header start-->
					<%@ include file="../partial/header.jsp"%>
					<!--header end-->

					<!-- main start -->
					<main class="mdl-layout__content custom">
					<div class="page-content detail">
						<div class="container">
							<div class="demo-card-square mdl-card w100 mdl-shadow--2dp">
								<div class="mdl-card__actions mdl-card--border bottom">
									<div class="detail-img">
										<img
											src="${pageContext.request.contextPath}/assets/imgs/test_coupon.svg"
											alt="">
									</div>
									<div class="detail-info">
										<h4><%=coupon.getCoupon_name()%></h4>
										<p>
											PRICE : <span><%=coupon.getCoupon_price()%> 원</span>
										</p>
										<p>
											OWNER : <a
												href="${pageContext.request.contextPath}/app/user/userDetail.jsp?id=<%=coupon.getCoupon_owner()%>"><span><%=coupon.getCoupon_owner()%></span></a>
										</p>
										<p>
											TYPE : <span><%=coupon_dao.alterCouponType(coupon.getCoupon_type())%></span>
										</p>
										<p>
											CATAGORY : <span><%=coupon_dao.alterCouponCatagory(coupon.getCoupon_catagory())%></span>
										</p>
									</div>
								</div>
								<div class="mdl-card__supporting-text"><%=coupon.getCoupon_description()%></div>
								<c:if test="${email ne null}">
									<%
										if (coupon.getCoupon_buyer() == null) {
									%>
									<div class="mdl-card__actions mdl-card--border">
										<form method="POST" >
										</form>
										<a href="#"
											class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
											구매하기 </a>
									</div>
									<%
										if (request.getSession().getAttribute("email").equals(coupon.getCoupon_owner())) {
									%>
									<form class="js_delete_form" method="post"
										action="${pageContext.request.contextPath}/coupons/deleteCouponOkAction.cu">
										<input type="hidden" name="id" value="<%=coupon_id%>" />
									</form>
									<div class="mdl-card__actions mdl-card--border">
										<a onclick="deleteCoupon()"
											class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
											삭제하기 </a>
									</div>
									<%
											}
										}
									%>
								</c:if>

								<!-- comment container start -->
								<div
									class="mdl-card__actions mdl-card--border comment-container">

									<!-- comment form -->
									<form class="js_comment_form"
										action="${pageContext.request.contextPath}/comments/createComment.co"
										method="POST">
										<fieldset>
											<input type="hidden" name="comment_user" value="${email}" />
											<input type="hidden" name="commnet_coupon"
												value="<%=coupon_id%>" />
											<div
												class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
												<input class="js_comment_text mdl-textfield__input"
													type="text" id="comment_text" name="comment_text"
													<%=request.getSession().getAttribute("email") == null
							? ("readonly=\"readonly\" value=\"로그인 후에 작성해주세요\"")
							: ("")%> />
												<label class="mdl-textfield__label" for="comment_text">Comment</label>
											</div>

											<!-- FAB button with ripple -->
											<button type="submit"
												class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect">
												<i class="material-icons">check</i>
											</button>

											<div class="mdl-card__title mdl-card--expand">
												<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
													for="option-7"> <input type="radio" id="option-7"
													class="mdl-radio__button" name="is_secret" value=1 checked />
													<span class="mdl-radio__label">비밀댓글</span>
												</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
													for="option-8"> <input type="radio" id="option-8"
													class="mdl-radio__button" name="is_secret" value="0" /> <span
													class="mdl-radio__label">공개댓글</span>
												</label>
											</div>
										</fieldset>
									</form>

									<%
										for (CommentBean comment : comments) {
									%>

									<!-- comment list start -->

									<div class="comment mdl-color-text--grey-700">
										<!-- comment profile start -->
										<header class="comment__header">
											<%
												user = user_dao.getUserProfile(comment.getComment_user());
															String profile_image = user.getProfile_image();
											%>
											<img
												<%=profile_image == null
								? ("src=\"${pageContext.request.contextPath}/assets/imgs/profile_test.png\"")
								: ("src=\"" + profile_image + "\"")%>
												class="comment__avatar">
											<div class="comment__author">
												<a
													href="${pageContext.request.contextPath}/app/user/userDetail.jsp?id=<%=user.getEmail()%>"><strong><%=user.getNickname()%></strong></a>
												<span><%=comment.getComment_datetime()%></span>
											</div>
										</header>
										<!-- comment profile end -->

										<div class="comment__text">
											<c:choose>
												<c:when test="<%=comment.getIs_deleted() == 1%>">
													<span>삭제된 댓글입니다</span>
												</c:when>
												<c:when
													test="<%=comment.getIs_secret() == 0
										|| user.getEmail().equals(comment.getComment_user())%>">
													<%=comment.getComment_text()%>
												</c:when>
												<c:otherwise>
													<span>비밀댓글입니다</span>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="comment__action">
											<form method="POST"
												action="${pageContext.request.contextPath}/comments/deleteComment.co">
												<input type="hidden" name="comment_coupon"
													value="<%=coupon_id%>"> <input type="hidden"
													name="comment_num" value="<%=comment.getComment_num()%>">
												<input type="hidden" name="comment_user" value="${email}">
												<button
													class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon"
													data-upgraded=",MaterialButton,MaterialRipple">
													<i class="material-icons" role="presentation">delete</i> <span
														class="visuallyhidden"> delete comment </span> <span
														class="mdl-button__ripple-container"> <span
														class="mdl-ripple is-animating"
														style="width: 92.5097px; height: 92.5097px; transform: translate(-50%, -50%) translate(13px, 15px);">
													</span>
													</span>
												</button>
											</form>
										</div>
									</div>
									<!-- comment list end -->

									<%
										}
									%>

								</div>
								<!-- comment container end -->
							</div>
						</div>
					</div>
					</main>
					<!-- main end -->

					<%@ include file="../partial/footer.jsp"%>

				</div>
				<!--Material Design Lite -warterfall layout end--->
			</div>

			<script
				src="${pageContext.request.contextPath}/assets/js/createComment.js"></script>
			<script
				src="${pageContext.request.contextPath}/assets/js/deleteCoupon.js"></script>

		</c:otherwise>
	</c:choose>
</body>
</html>