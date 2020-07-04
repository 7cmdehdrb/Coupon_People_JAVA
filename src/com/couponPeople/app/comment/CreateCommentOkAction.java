package com.couponPeople.app.comment;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.comment.dao.CommentBean;
import com.couponPeople.app.comment.dao.CommentDAO;

public class CreateCommentOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		CommentBean comment = new CommentBean();
		CommentDAO comment_dao = new CommentDAO();
		
		String comment_user = request.getParameter("comment_user");
		int comment_coupon = Integer.parseInt(request.getParameter("commnet_coupon"));
		String comment_text = request.getParameter("comment_text");
		int is_secret = Integer.parseInt(request.getParameter("is_secret"));
		
		comment.setComment_user(comment_user);
		comment.setComment_coupon(comment_coupon);
		comment.setComment_text(comment_text);
		comment.setIs_secret(is_secret);
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		out.println("<script>");
		
		if(!comment_dao.createComment(comment)) {
			out.println("alert('ERROR')");
		}
		
		out.println("location.href = 'http://localhost:8085/Coupon_People_Ver2/app/coupon/couponDetail.jsp?id=" + comment.getComment_coupon() + "'");
		out.println("</script>");
		out.close();
		
		return null;
	}

}
