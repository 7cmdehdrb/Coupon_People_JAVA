package com.couponPeople.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.user.dao.UserBean;
import com.couponPeople.app.user.dao.UserDAO;
import com.couponPeople.utils.Utils;

public class ResetPasswordOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		UserBean user = new UserBean();
		UserDAO user_dao = new UserDAO();
		Utils utils = new Utils();
		String emailSecret = request.getParameter("emailSecret");
		
		if(emailSecret == null || emailSecret.equals("")) {
			return null;
		}
		
		user.setEmail_secret(emailSecret);
		user.setPassword(utils.hashFunction("0000"));
		
		boolean result = user_dao.resetPassword(user);
		
		if(result) {
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('Your password is reseted as 0000')");
			out.println("location.href='http://localhost:8085/Coupon_People_Ver2/app/users/login.jsp'");
			out.println("</script>");
			out.close();
			
		}else {
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('Error!\nInvalid email secret')");
			out.println("location.href='http://localhost:8085/Coupon_People_Ver2/app/users/login.jsp'");
			out.println("</script>");
			out.close();
			
		}
		
		return null;
	}

}
