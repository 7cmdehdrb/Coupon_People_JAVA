<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../partial/head.jsp"%>
    </head>
    <body>
        <%--
        <c:if test="${email eq null}">
            <script>
                location.href = "http://localhost:8085/Coupon_People_Ver2/app/users/login.jsp";
            </script>
        </c:if>
        --%> <%@ include file="../partial/nav.jsp"%>

        <div class="container w-3/4 text-center mx-auto">
            <form action="${pageContext.request.contextPath}/coupons/createCouponOkAction.cu" method="POST">
                <input type="text" name="coupon_name" placeholder="coupon_name" />
                <br />
                <br />
                <input type="file" name="coupon_image" placeholder="coupon_image" />
                <br />
                <br />
                <textarea name="coupon_description" placeholder="coupon_description"> </textarea>
                <br />
                <br />
                <input type="text" name="coupon_serial" placeholder="coupon_serial" />
                <br />
                <br />
                <input type="number" name="coupon_price" placeholder="coupon_price" />
                <br />
                <br />
                <select name="coupon_type">
                    <option value="">카카오 기프티콘</option>
                    <option value="도서문화상품권">도서문화상품권</option>
                    <option value="컬쳐랜드문화상품권">컬쳐랜드문화상품권</option>
                </select>
                <br />
                <br />
                <input type="hidden" name="coupon_owner" value="${email}" placeholder="coupon_owner" />
                <br />
                <br />
                <input type="datetime-local" name="coupon_finish_date" placeholder="coupon_finish_date" />
                <br />
                <br />
                <button>SUBMIT</button>
            </form>
        </div>

        <%@ include file="../partial/footer.jsp"%>
    </body>
</html>
