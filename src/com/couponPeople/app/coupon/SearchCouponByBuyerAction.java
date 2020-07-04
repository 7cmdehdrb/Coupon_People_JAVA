package com.couponPeople.app.coupon;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.coupon.dao.CouponBean;
import com.couponPeople.app.coupon.dao.CouponDAO;

public class SearchCouponByBuyerAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		ActionForward forword = new ActionForward();
		List<CouponBean> coupons = new ArrayList<>();
		CouponDAO coupon_dao = new CouponDAO();

		String id = (String) request.getSession().getAttribute("email");

		if(id != null && id != "") {
			coupons = coupon_dao.searchCouponListByBuyer(id);
			request.setAttribute("coupons", coupons);

			forword.setRedirect(false);
			forword.setPath("/app/coupon/couponList.jsp");
		}else {
			forword.setRedirect(true);
			forword.setPath(request.getContextPath() + "/app/core/index.jsp");
			
		}
		
		return forword;
	}

}
