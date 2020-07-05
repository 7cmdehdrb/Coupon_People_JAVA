package com.couponPeople.app.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.review.dao.ReviewBean;
import com.couponPeople.app.review.dao.ReviewDAO;

public class DoReview implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forword = new ActionForward();
		ReviewBean review = new ReviewBean();
		ReviewDAO review_dao = new ReviewDAO();
		
		String review_to = request.getParameter("review_to");
		String review_from = (String)request.getSession().getAttribute("email");
		
		review.setReview_from(review_from);
		review.setReview_to(review_to);
		
		if(review_dao.checkDupReview(review)) {
			// go to create review
			request.setAttribute("review_from", review.getReview_from());
			request.setAttribute("review_to", review.getReview_to());
			request.setAttribute("action", "create");
		}else {
			// go to update review
			request.setAttribute("review_from", review.getReview_from());
			request.setAttribute("review_to", review.getReview_to());
			request.setAttribute("action", "update");
		}
		forword.setRedirect(false);
		forword.setPath("/app/review/reviewCoupon.jsp");
		
		return forword;
	}

}
