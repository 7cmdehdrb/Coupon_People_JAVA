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
			<!-- header -->
			<%@ include file="../partial/header.jsp"%>

			<!-- main start -->
			<main class="mdl-layout__content custom trade">
			<div class="page-content">
				<div class="container">
					<div class="demo-card-wide mdl-card mdl-shadow--2dp">
						<div class="mdl-card__actions mdl-card--border bottom">
							<div class="detail-img">
								<img
									src="${pageContext.request.contextPath}/assets/imgs/test_coupon.svg"
									alt="">
							</div>
						</div>
						<div class="detail-info">
							<h4>Coupon í</h4>
							<p>Coupon</p>
							<p>
								price : <span>9999 won</span>
							</p>
							<p>
								owner : <span>wanni</span>
							</p>
							<p>
								category : <span>gift</span>
							</p>
							<p>
								policy : <span>ì´ ëë ë¤ ë§ëë¡ ìì§ë§
									ì·¨ìí  ë ìëëë¤.</span>
							</p>
						</div>
						<div class="mdl-card__actions mdl-card--border">
							<a
								class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
								Confirm </a> <a
								class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
								Cancle </a> <a
								class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
								Complain </a>
						</div>
					</div>
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