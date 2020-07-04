package com.couponPeople.app.coupon;

import java.io.PrintWriter;
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

		String coupon_id = request.getParameter("id");

		ActionForward forword = new ActionForward();
		CouponBean coupon = null;
		List<CommentBean> comments = null;
		CouponDAO coupon_dao = new CouponDAO();
		CommentDAO comment_dao = new CommentDAO();

		try {

			if (coupon_id != null) {
				coupon = coupon_dao.getCouponDetail(Integer.parseInt(coupon_id));
				comments = comment_dao.getComments(Integer.parseInt(coupon_id));

				request.setAttribute("coupon", coupon);
				request.setAttribute("comments", comments);

				forword.setRedirect(false);
				forword.setPath("/app/coupon/couponDetail.jsp");
				
				return forword;
			} else {
				throw new Exception();
			}

		} catch (Exception e) {

			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('ERROR')");
			out.println("location.href='http://localhost:8085/Coupon_People_Ver2/coupons/couponListAction.cu'");
			out.println("</script>");
			out.close();

			return null;
		}

	}

}
