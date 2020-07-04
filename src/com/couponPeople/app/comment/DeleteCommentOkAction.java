package com.couponPeople.app.comment;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.comment.dao.CommentBean;
import com.couponPeople.app.comment.dao.CommentDAO;

public class DeleteCommentOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");

		CommentBean comment = new CommentBean();
		CommentDAO comment_dao = new CommentDAO();

		String comment_coupon = request.getParameter("comment_coupon");
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		String comment_user = request.getParameter("comment_user");

		comment.setComment_num(comment_num);
		comment.setComment_user(comment_user);

		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		out.println("<script>");
		
		out.println("alert('" + (comment_dao.deleteComment(comment) ? "DELETE!" : "ERROR...") + "')");
		out.println("location.href = 'http://localhost:8085/Coupon_People_Ver2/coupons/getCouponDetail.cu?id=" + comment_coupon + "'");
		
		out.println("</script>");
		out.close();

		return null;
	}

}
