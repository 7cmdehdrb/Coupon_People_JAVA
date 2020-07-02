package com.couponPeople.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.user.dao.UserBean;
import com.couponPeople.app.user.dao.UserDAO;
import com.couponPeople.utils.Utils;

public class ResetPasswordAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");

		UserBean user = new UserBean();
		UserDAO user_dao = new UserDAO();
		Utils utils = new Utils();

		String userEmail = request.getParameter("userEmail");

		user.setEmail(userEmail);
		user.setEmail_secret(utils.createUUID());

		try {
			
			if (user_dao.setEmailSecret(user)) {
				
				if(utils.sendPasswordResetGmail(user.getEmail(), user.getEmail_secret())) {
					
					PrintWriter out = response.getWriter();
					response.setContentType("text/html;charset=UTF-8");
					out.println("<script>");
					out.println("alert('Check your email to reset password')");
					out.println("location.href='http://localhost:8085/Coupon_People_Ver2/app/core/index.jsp'");
					out.println("</script>");
					out.close();
					
					return null;
					
				}

			}
			
			throw new Exception();

		} catch (Exception e) {
			// TODO: handle exception

			System.out.println(e);
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('Error! Your email is invalid!')");
			out.println("location.href='http://localhost:8085/Coupon_People_Ver2/app/user/loginForm.jsp'");
			out.println("</script>");
			out.close();

		}

		return null;
	}

}
