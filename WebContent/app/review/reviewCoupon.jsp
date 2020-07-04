<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
		String review_to = (String) request.getAttribute("review_to");
		String review_from = (String) request.getAttribute("review_from");
		String action = (String) request.getAttribute("action");
	%>

	<div class="custom" id="wrap">
		<!--Material Design Lite -warterfall layout start--->
		<div class="demo-layout-waterfall mdl-layout mdl-js-layout">

			<!-- header -->
			<%@ include file="../partial/header.jsp"%>


			<!-- main start -->
			<main class="mdl-layout__content custom">
			<div class="page-content">
				<div class="container">
					<!-- <h2>User Profile</h2> -->
					<!--profile card start-->
					<h2>Review</h2>
					<div class="demo-card-square mdl-card mdl-shadow--2dp">
						<form method="POST"
							action="${pageContext.request.contextPath}/reviews/submitReview.re">
							<fieldset>
								<!--public radio start-->
								<div class="mdl-card__title mdl-card--expand">
									<h5>평가하기 :</h5>
									<input type="hidden" name="action" value="<%=action%>" /> <input
										type="hidden" name="review_to" value="<%=review_to%>" /> <input
										type="hidden" name="review_from" value="<%=review_from%>" />
									<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-2"> <input type="radio" id="option-2"
										class="mdl-radio__button" name="review" value="1"> <span
										class="mdl-radio__label">1</span>
									</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-3"> <input type="radio" id="option-3"
										class="mdl-radio__button" name="review" value="2"> <span
										class="mdl-radio__label">2</span>
									</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-4"> <input type="radio" id="option-4"
										class="mdl-radio__button" name="review" value="3"> <span
										class="mdl-radio__label">3</span>
									</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-5"> <input type="radio" id="option-5"
										class="mdl-radio__button" name="review" value="4"> <span
										class="mdl-radio__label">4</span>
									</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-6"> <input type="radio" id="option-6"
										class="mdl-radio__button" name="review" value="5"
										checked="checked"> <span class="mdl-radio__label">5</span>
									</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-7"> <input type="radio" id="option-7"
										class="mdl-radio__button" name="review" value="6"> <span
										class="mdl-radio__label">6</span>
									</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-8"> <input type="radio" id="option-8"
										class="mdl-radio__button" name="review" value="7"> <span
										class="mdl-radio__label">7</span>
									</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-9"> <input type="radio" id="option-9"
										class="mdl-radio__button" name="review" value="8"> <span
										class="mdl-radio__label">8</span>
									</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-10"> <input type="radio" id="option-10"
										class="mdl-radio__button" name="review" value="9"> <span
										class="mdl-radio__label">9</span>
									</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-11"> <input type="radio" id="option-11"
										class="mdl-radio__button" name="review" value="10"> <span
										class="mdl-radio__label">10</span>
									</label>
								</div>
								<div class="mdl-card__actions mdl-card--border">
									<button type="submit"
										class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
										평가하기</button>
								</div>
							</fieldset>
						</form>
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
</body>
</html>