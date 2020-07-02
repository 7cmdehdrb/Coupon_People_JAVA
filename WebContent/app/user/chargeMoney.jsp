<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../partial/head.jsp"%>
<jsp:useBean id="env" class="com.couponPeople.utils.Myproperties"></jsp:useBean>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap"
	rel="stylesheet" />
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
			<!--header start-->
			<%@ include file="../partial/header.jsp"%>
			<!--header end-->

			<!-- main start -->
			<main class="mdl-layout__content custom">
			<div class="page-content">
				<div class="container">
					<h2>충전하기</h2>
					<!-- card -->
					<form method="get">
						<fieldset>
							<div class="demo-card-square mdl-card mdl-shadow--2dp">
								<ul class="demo-list-control mdl-list">
									<li class="mdl-list__item"><span
										class="mdl-list__item-primary-content"> <i
											class="material-icons mdl-list__item-avatar">
												attach_money </i> 5,000 원
									</span> <span class="mdl-list__item-secondary-action"> <label
											class="demo-list-radio mdl-radio mdl-js-radio mdl-js-ripple-effect"
											for="list-option-1"> <input type="radio"
												id="list-option-1" class="mdl-radio__button" name="money"
												value="5000" checked />
										</label>
									</span></li>
									<li class="mdl-list__item"><span
										class="mdl-list__item-primary-content"> <i
											class="material-icons mdl-list__item-avatar">
												attach_money </i> 10,000 원
									</span> <span class="mdl-list__item-secondary-action"> <label
											class="demo-list-radio mdl-radio mdl-js-radio mdl-js-ripple-effect"
											for="list-option-2"> <input type="radio"
												id="list-option-2" class="mdl-radio__button" name="money"
												value="10000" />
										</label>
									</span></li>
									<li class="mdl-list__item"><span
										class="mdl-list__item-primary-content"> <i
											class="material-icons mdl-list__item-avatar">
												attach_money </i> 50,000 원
									</span> <span class="mdl-list__item-secondary-action"> <label
											class="demo-list-radio mdl-radio mdl-js-radio mdl-js-ripple-effect"
											for="list-option-3"> <input type="radio"
												id="list-option-3" class="mdl-radio__button" name="money"
												value="50000" />
										</label>
									</span></li>
									<li class="mdl-list__item"><span
										class="mdl-list__item-primary-content"> <i
											class="material-icons mdl-list__item-avatar">
												attach_money </i> 100,000 원
									</span> <span class="mdl-list__item-secondary-action"> <label
											class="demo-list-radio mdl-radio mdl-js-radio mdl-js-ripple-effect"
											for="list-option-4"> <input type="radio"
												id="list-option-4" class="mdl-radio__button" name="money"
												value="100000" />
										</label>
									</span></li>
								</ul>
							</div>

							<button type="submit"
								class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
								충전하기</button>
						</fieldset>
					</form>
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
	<script>
        const IMP_KEY = "<%=env.getProperties().getProperty("IMPORT_API")%>";
		const BUYER_EMAIL = "${email}";
		const BUYER_NICKNAME = "${nickname}";
	</script>
	<script
		src="${pageContext.request.contextPath}/assets/js/chargeMoney.js"></script>
</body>
</html>
