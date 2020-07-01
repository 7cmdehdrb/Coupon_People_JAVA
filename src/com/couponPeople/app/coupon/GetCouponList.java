package com.couponPeople.app.coupon;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.coupon.dao.CouponBean;
import com.couponPeople.app.coupon.dao.CouponDAO;

public class GetCouponList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		List<CouponBean> coupons = new ArrayList<>();
		CouponDAO coupon_dao = new CouponDAO();
		
		coupons = coupon_dao.getCouponList();
		
		request.setAttribute("coupons", coupons);
		
		forward.setRedirect(false);
		forward.setPath("/app/coupons/couponList.jsp");
		
		return forward;
	}

}
