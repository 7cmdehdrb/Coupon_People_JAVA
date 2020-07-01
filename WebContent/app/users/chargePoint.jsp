<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../partial/head.jsp"%>
        <jsp:useBean id="env" class="com.couponPeople.utils.Myproperties"></jsp:useBean>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet" />
        <style>
            body {
                background-color: #d5d5d5;
            }

            h1 {
                font-family: "Fredoka One", cursive;
            }

            .pointBlock-block {
                background-color: white;
                border: 1;
                border-color: #0eb4b4;
                border-width: 10px;
                border-style: solid;
                border-collapse: inherit;
            }
        </style>
    </head>
    <body>
        <c:if test="${email eq null}">
            <script>
                location.href = "http://localhost:8085/Coupon_People_Ver2/app/core/index.jsp";
            </script>
        </c:if>

        <div class="container w-1/3 mx-auto my-10">
            <h1 class="text-center text-5xl mt-10">BUY POINT</h1>
            <h2 class="text-center mt-5 mb-10">
                <a href="${pageContext.request.contextPath}/app/core/index.jsp">쿠폰의 민족으로</a>
            </h2>

            <div class="py-10 shadow-2xl text-4xl text-center rounded-lg" style="background-color: #f9f9f9;">
                <div onclick="kakaoPay(4500, 5000)" class="pointBlock-block w-3/4 py-8 my-10 mx-auto items-center" style="cursor: pointer; background-color: #b8d6e8;">
                    <span class="block"><i class="fas fa-coins"></i> 5000포인트 충전</span>
                    <span class="block text-base"
                        ><span class="text-red-500"><i class="fas fa-gift"></i> [이벤트!] </span><del>5000원</del> → 4500원</span
                    >
                </div>
                <div onclick="kakaoPay(9000, 10000)" class="pointBlock-block w-3/4 py-10 my-10 mx-auto items-center" style="cursor: pointer; background-color: #94e98b;">
                    <span class="block"><i class="fas fa-money-bill-alt"></i> 10000포인트 충전</span>
                    <span class="block text-base"
                        ><span class="text-red-500"><i class="fas fa-gift"></i> [이벤트!] </span><del>10000원</del> → 9000원</span
                    >
                </div>
                <div onclick="kakaoPay(45000, 50000)" class="pointBlock-block w-3/4 py-10 my-10 mx-auto items-center" style="cursor: pointer; background-color: #e8d7c8;">
                    <span class="block"><i class="fas fa-money-bill-wave"></i> 50000포인트 충전</span>
                    <span class="block text-base"
                        ><span class="text-red-500"><i class="fas fa-gift"></i> [이벤트!] </span><del>50000원</del> → 45000원</span
                    >
                </div>
                <div onclick="kakaoPay(90000, 100000)" class="pointBlock-block w-3/4 py-10 my-10 mx-auto items-center" style="cursor: pointer; background-color: #f2ca58;">
                    <span class="block"><i class="far fa-gem"></i> 100000포인트 충전</span>
                    <span class="block text-base"
                        ><span class="text-red-500"><i class="fas fa-gift"></i> [이벤트!] </span><del>100000원</del> → 90000원</span
                    >
                </div>
            </div>

            <%-- 
            <button onclick="test()">TEST</button>
            --%>
        </div>

        <script>
            const IMP_KEY = "<%= env.getProperties().getProperty("IMPORT_API") %>";
            const BUYER_EMAIL = "${email}";
            const BUYER_NICKNAME = "${nickname}";
        </script>
        <script src="${pageContext.request.contextPath}/app/static/js/kakaoPay.js"></script>
    </body>
</html>
