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

	<div class="custom" id="wrap">
		<!--Material Design Lite -warterfall layout start--->
		<div class="demo-layout-waterfall mdl-layout mdl-js-layout">
			<%@ include file="../partial/header.jsp"%>

			<!-- main start -->
			<main class="mdl-layout__content custom">
			<div class="page-content">
				<div class="container">
					<h2>Create Coupon</h2>
					<!--profile card start-->
					<div class="demo-card-square mdl-card mdl-shadow--2dp">
						<form
							action="${pageContext.request.contextPath}/coupons/createCouponOkAction.cu"
							method="POST" enctype="multipart/form-data">
							<fieldset>
								<div class="mdl-card__supporting-text">
									<div
										class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="js_input mdl-textfield__input" type="text"
											id="coupon_name" name="coupon_name" /> <label
											class="mdl-textfield__label" for="coupon_name">쿠폰이름</label>
									</div>
								</div>
								<div class="mdl-card__supporting-text">
									<div
										class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="js_input mdl-textfield__input" type="text"
											id="couponDesc" name="coupon_serial" /> <label
											class="mdl-textfield__label" for="couponDesc">쿠폰번호</label>
									</div>
								</div>
								<div class="mdl-card__supporting-text">
									<div
										class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="js_input mdl-textfield__input" type="file"
											id="coupon_image" name="coupon_image" /> <label
											class="mdl-textfield__label" for="coupon_image">(선택)
											쿠폰 이미지</label>
									</div>
								</div>
								<div class="mdl-card__supporting-text">
									<div
										class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<textarea class="js_input mdl-textfield__input" id="coupon_description"
											name="coupon_description"> </textarea>
										<label class="mdl-textfield__label" for="coupon_description">설명</label>
									</div>
								</div>

								<div class="mdl-card__title mdl-card--expand">
									<h6>상품권 분류</h6>
									<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-7"> <input type="radio" id="option-7"
										class="mdl-radio__button" name="coupon_type" value="KAKAO"
										checked /> <span class="mdl-radio__label">카카오 키프티콘</span>
									</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-8"> <input type="radio" id="option-8"
										class="mdl-radio__button" name="coupon_type" value="BOOK" />
										<span class="mdl-radio__label">도서문화 상품권</span>
									</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-9"> <input type="radio" id="option-9"
										class="mdl-radio__button" name="coupon_type" value="CULTURE" />
										<span class="mdl-radio__label">컬쳐랜드 문화상품권</span>
									</label>
								</div>

								<div class="mdl-card__title mdl-card--expand">
									<h6>카테고리</h6>
									<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-1"> <input type="radio" id="option-1"
										class="mdl-radio__button" name="coupon_catagory" value="CARD"
										checked /> <span class="mdl-radio__label">상품권</span>
									</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-2"> <input type="radio" id="option-2"
										class="mdl-radio__button" name="coupon_catagory" value="MOVIE" />
										<span class="mdl-radio__label">영화/공연</span>
									</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-3"> <input type="radio" id="option-3"
										class="mdl-radio__button" name="coupon_catagory"
										value="BEAUTY" /> <span class="mdl-radio__label">뷰티</span>
									</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-4"> <input type="radio" id="option-4"
										class="mdl-radio__button" name="coupon_catagory"
										value="DESSERT" /> <span class="mdl-radio__label">디저트</span>
									</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-5"> <input type="radio" id="option-5"
										class="mdl-radio__button" name="coupon_catagory" value="FOOD" />
										<span class="mdl-radio__label">식사</span>
									</label> <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
										for="option-6"> <input type="radio" id="option-6"
										class="mdl-radio__button" name="coupon_catagory" value="MART" />
										<span class="mdl-radio__label">편의점/마트</span>
									</label>
								</div>

								<div class="mdl-card__supporting-text">
									<div
										class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="js_input mdl-textfield__input" type="number"
											id="coupon_price" name="coupon_price" /> <label
											class="mdl-textfield__label" for="coupon_price">가격</label>
									</div>
								</div>
								<div class="mdl-card__supporting-text">
									<div
										class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<label class="mdl-datefield__label" for="coupon_finish_date">쿠폰
											유효기간</label><input class="js_input mdl-textfield__input" type="date"
											id="coupon_finish_date" name="coupon_finish_date" />
									</div>
								</div>
								<input type="hidden" name="coupon_owner" value="${email}" />
								<!--public radio start-->
								<div class="mdl-card__actions mdl-card--border">
									<button type="submit"
										class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
										Confirm</button>
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
	<script src="${pageContext.request.contextPath}/assets/js/createCoupon.js"></script>
</body>
</html>
