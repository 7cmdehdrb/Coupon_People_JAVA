package com.couponPeople.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.user.dao.UserBean;
import com.couponPeople.app.user.dao.UserDAO;
import com.couponPeople.utils.Utils;

public class SignupOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");

		UserBean user = new UserBean();
		UserDAO user_dao = new UserDAO();
		Utils utils = new Utils();

		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String profileImage = request.getParameter("profileImage");
		String password = request.getParameter("password");
//		String[] interests = request.getParameterValues("interest");

		user.setEmail(email);
		user.setNickname(nickname);
		user.setProfile_image(profileImage);
		user.setPassword(utils.hashFunction(password));
		user.setMoney(10000);
		user.setLogin_method("LOCAL");
		user.setEmail_secret(utils.createUUID());
		user.setEmail_valid(0);
		user.setIs_activated(1);
		user.setIs_admin(0);
		user.setIs_email_public(1);
		user.setIs_interest_public(1);
		user.setIs_money_public(1);

		if (!user_dao.checkEmailValid(user.getEmail())) {

			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('This user is already existed')");
			out.println("location.href='http://localhost:8085/Coupon_People_Ver2/app/users/login.jsp'");
			out.println("</script>");
			out.close();

			return null;

		}

		try {

			if (user_dao.signup(user)) {

				utils.sendVerifyGmail(user.getEmail(), user.getEmail_secret());

				PrintWriter out = response.getWriter();
				response.setContentType("text/html;charset=UTF-8");
				out.println("<script>");
				out.println("alert('Please check your email to verify your account')");
				out.println("location.href='http://localhost:8085/Coupon_People_Ver2/app/users/login.jsp'");
				out.println("</script>");
				out.close();

			} else {
				throw new Exception();
			}

		} catch (Exception e) {
			// TODO: handle exception
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('Unknown Error...')");
			out.println("location.href='http://localhost:8085/Coupon_People_Ver2/app/core/index.jsp'");
			out.println("</script>");
			out.close();
		}

		return null;

	}

}
