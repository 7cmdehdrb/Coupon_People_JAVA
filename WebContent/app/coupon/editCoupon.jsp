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
            <header class="mdl-layout__header mdl-layout__header--waterfall">
              <!-- Top row, always visible -->
              <div class="mdl-layout__header-row">
                <!-- Title -->
                <span class="mdl-layout-title">Title</span>
                <div class="mdl-layout-spacer"></div>
                <!--search-->
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable
                            mdl-textfield--floating-label mdl-textfield--align-right">
                    <form action="./test.html" method="get">
                        <fieldset>
                            <label class="mdl-button mdl-js-button mdl-button--icon"
                                    for="waterfall-exp">
                                <i class="material-icons">search</i>
                            </label>
                            <div class="mdl-textfield__expandable-holder">
                                <input class="mdl-textfield__input" type="text" name="sample"
                                    id="waterfall-exp">
                            </div>
                        </fieldset>
                    </form>
                </div>

                <!--user-->
                <div class="user-tool">
                    <!-- <button class="mdl-button mdl-js-button mdl-button--icon">
                        <i class="material-icons">person</i>
                    </button> -->
                    <button id="demo-menu-lower-right"
                            class="mdl-button mdl-js-button mdl-button--icon">
                        <i class="material-icons">person</i>
                    </button>

                    <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                        for="demo-menu-lower-right">
                        <li class="mdl-menu__item">
                            <a href="./loginForm.html">
                                Log In
                            </a>
                        </li>
                        <li class="mdl-menu__item">
                            <a href="./joinForm.html">
                                Join
                            </a>
                        </li>
                    </ul>
                </div>
              </div>
            </header>
            <!-- header drawer layout start -->
            <div class="mdl-layout__drawer">
              <span class="mdl-layout-title">Title</span>
              <nav class="mdl-navigation">
                <a class="mdl-navigation__link" href="">Buy</a>
                <a class="mdl-navigation__link" href="">Sell</a>
                <a class="mdl-navigation__link" href="">Charge</a>
              </nav>
            </div>
            <!-- header drawer layout end -->
            <!--header end-->

             <!-- main start -->
            <main class="mdl-layout__content custom">
                <div class="page-content">
                    <div class="container">
                        <h2>Coupon</h2>
                        <!--profile card start-->
                        <div class="demo-card-square mdl-card mdl-shadow--2dp">
                            <form action="#">
                                <fieldset>
                                    <div class="mdl-card__supporting-text">
                                        <!-- <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="file" id="coupon_img" name="coupon_img">
                                            <label class="mdl-textfield__label" for="coupon_img"></label>
                                        </div> -->
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" id="couponDesc" name="coupon_serial">
                                            <label class="mdl-textfield__label" for="couponDesc">coupon serial...</label>
                                        </div>
                                    </div>
                                    <div class="mdl-card__supporting-text">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" id="couponDesc" name="coupon_desc">
                                            <label class="mdl-textfield__label" for="couponDesc">coupon desc...</label>
                                        </div>
                                    </div>
                                    <div class="mdl-card__supporting-text">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" id="couponPrice" name="coupon_price">
                                            <label class="mdl-textfield__label" for="couponPrice">coupon price</label>
                                        </div>
                                    </div>
                                    <!--public radio start-->
                                    <div class="mdl-card__title mdl-card--expand">
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-1">
                                            <input type="radio" id="option-1" class="mdl-radio__button" name="coupon_cate" value="gift_card" checked>
                                            <span class="mdl-radio__label">상품권</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-2">
                                            <input type="radio" id="option-2" class="mdl-radio__button" name="coupon_cate" value="movie">
                                            <span class="mdl-radio__label">영화/공연</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-3">
                                            <input type="radio" id="option-3" class="mdl-radio__button" name="coupon_cate" value="beauty">
                                            <span class="mdl-radio__label">뷰티</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-4">
                                            <input type="radio" id="option-4" class="mdl-radio__button" name="coupon_cate" value="desert">
                                            <span class="mdl-radio__label">디저트</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-5">
                                            <input type="radio" id="option-5" class="mdl-radio__button" name="coupon_cate" value="dish">
                                            <span class="mdl-radio__label">식사</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-6">
                                            <input type="radio" id="option-6" class="mdl-radio__button" name="coupon_cate" value="mart">
                                            <span class="mdl-radio__label">편의점/마트</span>
                                        </label>
                                    </div>
                                    <div class="mdl-card__title mdl-card--expand">
                                        <label for="jsCouponExpire"> 기간 :
                                            <input type="date" id="jsCouponExpire" name="coupon_expire"
                                                value="2020-06-15"
                                                min="2020-06-15" max="2030-12-31">
                                        </label>
                                    </div>
                                    <div class="mdl-card__actions mdl-card--border">
                                        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                                            Confirm
                                        </button>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        <!--profile card end-->
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