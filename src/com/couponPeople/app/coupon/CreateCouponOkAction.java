package com.couponPeople.app.coupon;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.coupon.dao.CouponBean;
import com.couponPeople.app.coupon.dao.CouponDAO;

public class CreateCouponOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");

		ActionForward forword = new ActionForward();
		CouponBean coupon = new CouponBean();
		CouponDAO coupon_dao = new CouponDAO();

		coupon.setCoupon_name(request.getParameter("coupon_name"));
		coupon.setCoupon_serial(request.getParameter("coupon_serial"));
		coupon.setCoupon_image(request.getParameter("coupon_image"));
		coupon.setCoupon_description(request.getParameter("coupon_description"));
		coupon.setCoupon_price(Integer.parseInt(request.getParameter("coupon_price")));
		coupon.setCoupon_type(request.getParameter("coupon_type"));
		coupon.setCoupon_owner(request.getParameter("coupon_owner"));
		coupon.setCoupon_finish_date(request.getParameter("coupon_finish_date"));

		if (coupon_dao.createCoupon(coupon)) {
			forword.setPath(request.getContextPath() + "/app/core/index.jsp");
			forword.setRedirect(true);
		} else {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('ERROR')");
			out.println("location.href='http://localhost:8085/Coupon_People_Ver2/app/core/index.jsp'");
			out.println("</script>");
			out.close();
			return null;
		}

		return forword;
	}

}
