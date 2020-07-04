package com.couponPeople.app.coupon;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.coupon.dao.CouponBean;
import com.couponPeople.app.coupon.dao.CouponDAO;

public class CouponListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forword = new ActionForward();
		CouponDAO coupon_dao = new CouponDAO();
		
		List<CouponBean> coupons = coupon_dao.getCouponList();
		
		request.setAttribute("coupons", coupons);
		
		forword.setRedirect(false);
		forword.setPath("/app/coupon/couponList.jsp");
		
		return forword;
	}

}
