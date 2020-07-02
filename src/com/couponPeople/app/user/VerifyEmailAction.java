package com.couponPeople.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.user.dao.UserDAO;

public class VerifyEmailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		UserDAO user_dao = new UserDAO();
		
		String emailSecret = request.getParameter("emailSecret");
		
		try {
			if(user_dao.verifyEmail(emailSecret)) {
				PrintWriter out = response.getWriter();
				response.setContentType("text/html;charset=UTF-8");
				out.println("<script>");
				out.println("alert('Email Verification succeed!')");
				out.println("location.href='http://localhost:8085/Coupon_People_Ver2/app/user/loginForm.jsp'");
				out.println("</script>");
				out.close();
			}else {
				throw new Exception();
			}
		} catch (Exception e) {
			// TODO: handle exception
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('Email Secret is not valid')");
			out.println("location.href='http://localhost:8085/Coupon_People_Ver2/app/core/index.jsp'");
			out.println("</script>");
			out.close();
		}
		
		return null;
	}

}
