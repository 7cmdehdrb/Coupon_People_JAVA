package com.couponPeople.app.coupon;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.comment.dao.CommentBean;
import com.couponPeople.app.comment.dao.CommentDAO;
import com.couponPeople.app.coupon.dao.CouponBean;
import com.couponPeople.app.coupon.dao.CouponDAO;

public class GetCouponDetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forword = new ActionForward();
		CouponBean coupon = new CouponBean();
		CouponDAO coupon_dao = new CouponDAO();
		List<CommentBean> comments = new ArrayList<>();
		CommentDAO comment_dao = new CommentDAO();
		
		String coupon_num = request.getParameter("id");
		
		if(coupon_num == null) {
			
			return null;
		}
		
		coupon = coupon_dao.getCouponDetail(Integer.parseInt(coupon_num));
		comments = comment_dao.getComments(Integer.parseInt(coupon_num));
		
		request.setAttribute("coupon", coupon);
		request.setAttribute("comment", comments);
		
		forword.setRedirect(false);
		forword.setPath("/app/coupons/couponDetail.jsp");
		
		return forword;
	}

}
