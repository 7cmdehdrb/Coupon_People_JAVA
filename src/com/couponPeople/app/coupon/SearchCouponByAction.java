package com.couponPeople.app.coupon;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.coupon.dao.CouponBean;
import com.couponPeople.app.coupon.dao.CouponDAO;

public class SearchCouponByAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		
		HashMap<String, String> data = new HashMap<>();
		ActionForward forword = new ActionForward();
		List<CouponBean> coupons = new ArrayList<>();
		CouponDAO coupon_dao = new CouponDAO();
		
		String search_field = request.getParameter("search_field");
		String search_value = request.getParameter("search_value");
		
		data.put("search_field", search_field);
		data.put("search_value", search_value);
		
		coupons = coupon_dao.searchCouponListBy(data);
		
		request.setAttribute("coupons", coupons);
		
		forword.setRedirect(false);
		forword.setPath("/app/coupon/couponList.jsp");
		
		return forword;
		
	}

}
