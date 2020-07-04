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
		String session_email = null;
		String coupon_id = request.getParameter("id");
		UserBean user = null;
		UserDAO user_dao = new UserDAO();
		CouponDAO coupon_dao = new CouponDAO();
		CommentDAO comment_dao = new CommentDAO();

		CouponBean coupon = null;
		List<CommentBean> comments = new ArrayList<>();

		session_email = (String) request.getSession().getAttribute("email");
		coupon = (CouponBean) request.getAttribute("coupon");
		comments = (ArrayList<CommentBean>) request.getAttribute("comments");
	%>

	<c:choose>
		<c:when test="<%=coupon == null%>">
			<script>
				alert("Invalid URL");
				location.href = "http://localhost:8085/Coupon_People_Ver2/coupons/couponListAction.cu";
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
										<c:choose>
											<c:when test="<%=coupon.getCoupon_buyer() != null%>">
												<c:choose>
													<c:when
														test="<%=coupon.getCoupon_buyer().equals(session_email)
											&& coupon.getIs_coupon_determined() == 1
											&& coupon.getCoupon_image() != null%>">
														<img
															src="${pageContext.request.contextPath}/public/image/couponimage/<%=coupon.getCoupon_image() %>"
															alt="쿠폰 이미지">
													</c:when>
													<c:otherwise>
														<img
															src="${pageContext.request.contextPath}/assets/imgs/test_coupon.svg"
															alt="">
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<img
													src="${pageContext.request.contextPath}/assets/imgs/test_coupon.svg"
													alt="">
											</c:otherwise>
										</c:choose>
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
										<p>
											FINISH DATE : <span><%=coupon.getCoupon_finish_date()%></span>
										</p>
										<c:if test="<%=coupon.getCoupon_buyer() != null%>">
											<c:if
												test="<%=coupon.getCoupon_buyer().equals(session_email)%>">
												<p>
													SERIAL_NUMBER : <strong> <%=coupon.getIs_coupon_determined() == 0 ? "구매 확정이 필요합니다" : coupon.getCoupon_serial()%>
													</strong>
												</p>
											</c:if>
										</c:if>
									</div>
								</div>
								<div class="mdl-card__supporting-text"><%=coupon.getCoupon_description()%></div>
								<c:if test="${email ne null}">
									<c:choose>
										<c:when test="<%=coupon.getCoupon_buyer() == null%>">
											<div class="mdl-card__actions mdl-card--border">
												<form class="js_tradeForm"
													action="${pageContext.request.contextPath}/trades/createTrade.tr"
													method="POST">
													<%-- 구매하기 만들자! --%>
													<input type="hidden" name="price"
														value=<%=coupon.getCoupon_price()%> /> <input
														type="hidden" name="trade_coupon" value="<%=coupon_id%>" />
													<input type="hidden" name="trade_buyer" value="${email}" />
												</form>

												<a
													class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
													data-toggle="modal" data-target="#exampleModal"> 구매하기 </a>

											</div>
											<c:if
												test="<%=coupon.getCoupon_owner().equals(session_email)%>">

												<form class="js_delete_form" method="post"
													action="${pageContext.request.contextPath}/coupons/deleteCouponOkAction.cu">
													<input type="hidden" name="id" value="<%=coupon_id%>" />
												</form>
												<div class="mdl-card__actions mdl-card--border">
													<a onclick="deleteCoupon()"
														class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
														삭제하기 </a>
												</div>
												<script
													src="${pageContext.request.contextPath}/assets/js/deleteCoupon.js"></script>

											</c:if>
											<%-- owner is session user --%>
										</c:when>
										<c:otherwise>
											<%-- buyer is not null --%>
											<c:if
												test="<%=coupon.getCoupon_buyer().equals(session_email)%>">
												<c:choose>
													<c:when test="<%=coupon.getIs_coupon_determined() == 0%>">
														<div class="mdl-card__actions mdl-card--border">
															<a
																class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
																data-toggle="modal" data-target="#determineCoupon">
																구매결정 </a>

														</div>
														<div class="mdl-card__actions mdl-card--border">
															<a
																class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
																data-toggle="modal" data-target="#requestRefund">
																환불요청 </a>

														</div>
													</c:when>
													<c:otherwise>
														<div class="mdl-card__actions mdl-card--border">
															<a
																class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
																data-toggle="modal" data-target="setIsFinished">
																구매확정 </a>

														</div>
														<div class="mdl-card__actions mdl-card--border">
															<a
																class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
																data-toggle="modal" data-target="setIsCheated"> 허위매물
																신고 </a>

														</div>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:otherwise>
									</c:choose>
									<%-- buyer is not null --%>


								</c:if>
								<%-- user is logged in --%>

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

									<script
										src="${pageContext.request.contextPath}/assets/js/createComment.js"></script>


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
								? ("src=\"" + request.getContextPath() + "/assets/imgs/profile_test.png\"")
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
													test="<%=comment.getIs_secret() == 0 || comment.getComment_user().equals(session_email)%>">
													<%=comment.getComment_text()%>
												</c:when>
												<c:otherwise>
													<span>비밀댓글입니다</span>
												</c:otherwise>
											</c:choose>
										</div>


										<c:if
											test="<%=comment.getComment_user().equals(session_email)%>">
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
										</c:if>
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

					<!-- Modal 거래 -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">구매하기</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<p>
										<span>쿠폰명 : <%=coupon.getCoupon_name()%></span> <br> <span>판매자
											: <%=coupon.getCoupon_owner()%></span> <br> <span>잔여 포인트
											: <%=user_dao.getCurrentMoney((String) request.getSession().getAttribute("email"))%>원
											<br> <span>가격 : <%=coupon.getCoupon_price()%>원
										</span><br> <span>예상 잔여 금액 : <span
												class="js_expectedMoney"><%=user_dao.getCurrentMoney((String) request.getSession().getAttribute("email"))
							- coupon.getCoupon_price()%></span>원
										</span><br> <span>유효기간 : <%=coupon.getCoupon_finish_date()%></span>
										</span>
									</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소하기</button>
									<button type="button" class="btn btn-primary"
										onclick="buyCoupon()">구매하기</button>
								</div>
							</div>
						</div>
					</div>

					<!-- Modal 구매 결정 -->
					<div class="modal fade" id="determineCoupon" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">구매 결정</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">구매결정을 할 경우, 더 이상의 환불 요청은 불가능하며,
									구매하신 쿠폰의 이미지와 쿠폰 번호를 볼 수 있습니다</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary">구매결정</button>
								</div>
							</div>
						</div>
					</div>

					<!-- Modal 환불 요청 -->
					<div class="modal fade" id="requestRefund" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">환불요청</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">환불요청을 한 경우, 차감된 포인트가 다시 돌아옵니다</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary">환불요청</button>
								</div>
							</div>
						</div>
					</div>

					<!-- Modal 구매 확정 -->
					<div class="modal fade" id="setIsFinished" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">구매확정</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									구매 확정은 반드시 해당 쿠폰을 사용하고 나서 진행해주십시오 <br> 구매 확정을 할 경우, 쿠폰의
									판매자에서 대금이 전달되어 문제가 있을 경우 환불에 어려움이 있을 수 있습니다 <br> 또한, 구매
									확정을 하지 않으실 경우, 판매자가 구입일 기준 1주일 뒤에 구매 확정을 할 수 있습니다
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary">구매 확정</button>
								</div>
							</div>
						</div>
					</div>

					<!-- Modal 사기 신고 -->
					<div class="modal fade" id="setIsCheated" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">허위매물 신고</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									본 쿠폰을 허위매물로 신고합니다 <br> 신고가 접수되면, 관리자의 확인 후에 환불 여부를 결정합니다 <br>
									비정상적인 허위매물 신고는 이용 재제에 처해질 수 있습니다
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary">신고하기</button>
								</div>
							</div>
						</div>
					</div>

					<%@ include file="../partial/footer.jsp"%>

					<script
						src="${pageContext.request.contextPath}/assets/js/buyCoupon.js"></script>
				</div>
				<!--Material Design Lite -warterfall layout end--->


				<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
					integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
					crossorigin="anonymous"></script>
				<script
					src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
					integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
					crossorigin="anonymous"></script>
				<script
					src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
					integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
					crossorigin="anonymous"></script>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>