<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../partial/head.jsp" %>
</head>
<body>
    <div class="custom" id="wrap">
        <!--Material Design Lite -warterfall layout start--->
        <div class="demo-layout-waterfall mdl-layout mdl-js-layout">
            <!--header start-->
            
            <!--header end-->

             <!-- main start -->
            <main class="mdl-layout__content custom">
                <div class="page-content item-list">
                    <div class="container">
                        <!--item start-->
                        <div class="demo-card-square mdl-card mdl-shadow--2dp">
                            <a href="#">
                                <div class="mdl-card__title mdl-card--expand" style="background-image: url(${pageContext.request.contextPath}/assets/imgs/test_coupon.svg);
                                background-position: center;
                                background-size: 80% auto;
                                background-repeat: no-repeat;">
                                    <h2 class="mdl-card__title-text">기프티콘</h2>
                                </div>
                                <span class="item-owner">wanni</span>
                                <div class="mdl-card__supporting-text">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                        Aenan convallis.
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
                                <button class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                                    Favorite
                                </button>
                                <!--admin function-->
                                <button class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                                    Penalty User
                                </button>
                            </div>
                        </div>
                        <!--item end-->
                    </div>
                </div>
            </main>
            <!-- main end -->

        <%@ include file="../partial/footer.jsp" %>   

          </div>
          <!--Material Design Lite -warterfall layout end--->
    </div>
</body>
</html>