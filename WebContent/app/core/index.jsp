<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../partial/head.jsp"%>
</head>
<body>
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
								<li class="category-list"><a href="#"> <i
										class="far fa-gem"></i> <span>카테고리1</span>
								</a></li>
								<li class="category-list"><a href="#"> <i
										class="far fa-gem"></i> <span>카테고리2</span>
								</a></li>
								<li class="category-list"><a href="#"> <i
										class="far fa-gem"></i> <span>카테고리3</span>
								</a></li>
								<li class="category-list"><a href="#"> <i
										class="far fa-gem"></i> <span>카테고리4</span>
								</a></li>
								<li class="category-list"><a href="#"> <i
										class="far fa-gem"></i> <span>카테고리5</span>
								</a></li>
								<%--
								<li class="category-list"><a href="#"> <i
										class="far fa-gem"></i> <span>카테고리6</span>
								</a></li>
								<li class="category-list"><a href="#"> <i
										class="far fa-gem"></i> <span>카테고리7</span>
								</a></li>
								<li class="category-list"><a href="#"> <i
										class="far fa-gem"></i> <span>카테고리8</span>
								</a></li>
								<li class="category-list"><a href="#"> <i
										class="far fa-gem"></i> <span>카테고리9</span>
								</a></li>
								<li class="category-list"><a href="#"> <i
										class="far fa-gem"></i> <span>카테고리10</span>
								</a></li>
								<li class="category-list"><a href="#"> <i
										class="far fa-gem"></i> <span>카테고리11</span>
								</a></li>
								<li class="category-list"><a href="#"> <i
										class="far fa-gem"></i> <span>카테고리12</span>
								</a></li>
								<li class="category-list"><a href="#"> <i
										class="far fa-gem"></i> <span>카테고리13</span>
								</a></li>
								<li class="category-list"><a href="#"> <i
										class="far fa-gem"></i> <span>카테고리14</span>
								</a></li>
								<li class="category-list"><a href="#"> <i
										class="far fa-gem"></i> <span>카테고리15</span>
								</a></li>
								 --%>
							</ul>
						</div>
						<!-- <a href="#" class="category-link">
                        <span>
                            더보기 +
                        </span>
                    </a> -->
					</div>
				</section>
				<!-- category section end -->

				<!-- promotion section start -->
				<section class="promotion">
					<div class="container">
						<h2 class="promotion-tit">BEST</h2>
						<div class="promotion-wrap page-content item-list">
							<ul>
								<!-- 아이템 리스트 아이템 시작 -->
								<li class="promotion-item">
									<div class="demo-card-square mdl-card mdl-shadow--2dp">
										<a href="#">
											<div class="mdl-card__title mdl-card--expand"
												style="background-image: url(${pageContext.request.contextPath}/assets/imgs/test_coupon.svg);
					                                background-position: center;
					                                background-size: 80% auto;
					                                background-repeat: no-repeat;">
												<h2 class="mdl-card__title-text">
													테스트 아이템 하나
												</h2>
											</div> 
											<span class="item-owner">wanni</span>
											<div class="mdl-card__supporting-text">
												사고 싶으면 사든가. 맘에 안들면 신고해보시던가
											</div> 
											<span class="item-price">4000 won</span> 
											<span class="item-cate"> 
												<span class="material-icons">
													card_giftcard 
												</span>
												gift
											</span>
										</a>
										<div class="mdl-card__actions mdl-card--border">
											<button
												class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
												Favorite</button>
											<!--admin function-->
											<button
												class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
												Penalty User</button>
										</div>
									</div>
								</li>
								<!-- 아이템 리스트 아이템 끝 -->
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