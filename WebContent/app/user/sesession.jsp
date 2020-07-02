<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <h2>secession</h2>
                        <p>secession complete</p>
                        <a href="${pageContext.request.contextPath}/core/index.jsp" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
                        	안녕히 가십시오
                        </a>
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