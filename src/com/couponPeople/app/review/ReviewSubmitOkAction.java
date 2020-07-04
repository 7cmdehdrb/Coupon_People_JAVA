package com.couponPeople.app.review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.review.dao.ReviewBean;
import com.couponPeople.app.review.dao.ReviewDAO;

public class ReviewSubmitOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");

		ActionForward forword = new ActionForward();
		ReviewBean review = new ReviewBean();
		ReviewDAO review_dao = new ReviewDAO();
		
		String review_to = request.getParameter("review_to");
		String review_from = request.getParameter("review_from");
		String review_score = request.getParameter("review");
		String action = request.getParameter("action");

		review.setReview_to(review_to);
		review.setReview_from(review_from);
		review.setReview(Integer.parseInt(review_score));

		try {

			switch (action) {
			case "create":
				if (!review_dao.createReview(review)) {
					throw new Exception();
				}
				break;

			case "update":
				if (!review_dao.updateReview(review)) {
					throw new Exception();
				}
				break;

			default:
				throw new Exception();

			}
			
			forword.setRedirect(true);
			forword.setPath(request.getContextPath() + "/app/core/index.jsp");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('You have might signed up with local account')");
			out.println("location.href = 'http://localhost:8085/Coupon_People_Ver2/app/core/index.jsp'");
			out.println("</script>");
			out.close();

			return null;
		}

		return forword;
	}

}
