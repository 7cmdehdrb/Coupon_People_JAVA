package com.couponPeople.app.coupon;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.coupon.dao.CouponDAO;

public class DeleteCouponOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");

		CouponDAO coupon_dao = new CouponDAO();
		ActionForward forward = null;
		HashMap<String, String> data = new HashMap<>();

		String coupon_id = request.getParameter("id");
		String user_id = (String) request.getSession().getAttribute("email");

		data.put("coupon_num", coupon_id);
		data.put("coupon_owner", user_id);
		
		if(coupon_id == null || user_id == null) {
			//
			return null;
		}

		if(coupon_dao.removeCoupon(data)) {
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/app/coupons/couponList.jsp");
			
		}else {
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('Fail to delete coupon...')");
			out.println("location.href='http://localhost:8085/Coupon_People_Ver2/app/core/index.jsp'");
			out.println("</script>");
			out.close();
			
		}

		return forward;
	}

}
