<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../partial/head.jsp" %>
</head>
<body>
    <div class="custom" id="wrap">
        <!--Material Design Lite -warterfall layout start ì¨ë 씨발°--->
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
                <div class="page-content detail">
                    <div class="container">
                        <div class="demo-card-square mdl-card w100 mdl-shadow--2dp">
                            <div class="mdl-card__actions mdl-card--border bottom">
                                <div class="detail-img">
                                    <img src="${pageContext.request.contextPath}/assets/imgs/test_coupon.svg" alt="">
                                </div>
                                <div class="detail-info">
                                    <h4>Coupon í</h4>
                                    <p>Coupon</p>
                                    <p>price : <span>9999 won</span></p>
                                    <p>owner : <span>wanni</span></p>
                                    <p>category : <span>gift</span></p>
                                </div>
                            </div>
                            <div class="mdl-card__supporting-text">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                Mauris sagittis pellentesque lacus eleifend lacinia...
                            </div>
                            <div class="mdl-card__actions mdl-card--border">
                                <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                                    buy
                                </a>
                                <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                                    favorite
                                </a>
                            </div>

                            <!-- comment container start -->
                            <div class="mdl-card__actions mdl-card--border comment-container">
                                <!-- comment form -->
                                <form action="#">
                                    <fieldset>
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" id="inputComment" name="coupon_comment">
                                            <label class="mdl-textfield__label" for="inputComment">Comment</label>
                                          </div>
                                          <!-- <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="commentPublic">
                                              <input type="checkbox" id="commentPublic" class="mdl-checkbox__input" name="comment_public" checked>
                                              <span class="mdl-checkbox__label">public</span>
                                          </label> -->
                                          <!-- FAB button with ripple -->
                                          <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect">
                                              <i class="material-icons">check</i>
                                          </button>
                                    </fieldset>
                                </form>

                                <!-- comment list start -->
                                <div class="comment mdl-color-text--grey-700">
                                    <!-- comment profile start -->
                                    <header class="comment__header">
                                      <img src="${pageContext.request.contextPath}/assets/imgs/profile_test.png" class="comment__avatar">
                                      <div class="comment__author">
                                        <strong>James Splayd</strong>
                                        <span>2 days ago</span>
                                      </div>
                                    </header>
                                    <!-- comment profile end -->
                                    
                                    <div class="comment__text">
                                        In in culpa nulla elit esse. Ex cillum enim aliquip sit sit ullamco ex eiusmod fugiat. Cupidatat ad minim officia mollit laborum magna dolor tempor cupidatat mollit. Est velit sit ad aliqua ullamco laborum excepteur dolore proident incididunt in labore elit.
                                    </div>
                                    <div class="comment__action">
                                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" data-upgraded=",MaterialButton,MaterialRipple">
                                            <i class="material-icons" role="presentation">delete</i>
                                            <span class="visuallyhidden">
                                                delete comment
                                            </span>
                                            <span class="mdl-button__ripple-container">
                                                <span class="mdl-ripple is-animating" style="width: 92.5097px; height: 92.5097px; transform: translate(-50%, -50%) translate(13px, 15px);">
                                                </span>
                                            </span>
                                        </button>
                                    </div>
                                </div>
                                <!-- comment list end -->
                            </div>
                            <!-- comment container end -->
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