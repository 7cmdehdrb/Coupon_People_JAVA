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
            <main class="mdl-layout__content custom trade">
                <div class="page-content">
                    <div class="container">
                        <div class="demo-card-wide mdl-card mdl-shadow--2dp">
                            <div class="mdl-card__actions mdl-card--border bottom">
                                <div class="detail-img">
                                    <img src="${pageContext.request.contextPath}/assets/imgs/test_coupon.svg" alt="">
                                </div>
                            </div>
                            <div class="detail-info">
                                <h4>Coupon 팜</h4>
                                <p>Coupon</p>
                                <p>price : <span>9999 won</span></p>
                                <p>owner : <span>wanni</span></p>
                                <p>category : <span>gift</span></p>
                                <p>policy : <span>살 때는 네 맘대로 였지만 취소할 땐 아니란다.</span></p>
                            </div>
                            <div class="mdl-card__actions mdl-card--border">
                                <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                                    Confirm
                                </a>
                                <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                                    Cancle
                                </a>
                                <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                                    Complain
                                </a>
                            </div>
                        </div>
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