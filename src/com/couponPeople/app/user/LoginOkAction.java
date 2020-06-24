package com.couponPeople.app.user;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.user.dao.UserBean;
import com.couponPeople.app.user.dao.UserDAO;
import com.couponPeople.utils.Utils;

public class LoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		HashMap<String, Object> resultUser = null;
		UserBean user = new UserBean();
		UserDAO user_dao = new UserDAO();
		Utils utils = new Utils();

		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		int isAdmin = request.getParameter("isAdmin").equals("normal") ? 0 : 1;

		user.setEmail(userId);
		user.setPassword(utils.hashFunction(userPw));
		user.setIs_admin(isAdmin);

		resultUser = user_dao.localLogin(user);

		if (resultUser == null) {

			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('Login Fail')");
			out.println("location.href='http://localhost:8085/Coupon_People_Ver2/app/users/login.jsp'");
			out.println("</script>");
			out.close();

			return null;

		} else {

			if (String.valueOf(resultUser.get("EMAIL_VALID")).equals("1")) {
				
				session.setAttribute("email", user.getEmail());
				session.setAttribute("nickname", String.valueOf(resultUser.get("NICKNAME")));
				session.setAttribute("loginMethod", "LOCAL");
				session.setAttribute("isAdmin", user.getIs_admin());

				forward.setRedirect(false);
				forward.setPath("/app/core/index.jsp");
				return forward;

			} else {

				PrintWriter out = response.getWriter();
				response.setContentType("text/html;charset=UTF-8");
				out.println("<script>");
				out.println("alert('Please verify your email before trying login')");
				out.println("location.href='http://localhost:8085/Coupon_People_Ver2/app/users/login.jsp'");
				out.println("</script>");
				out.close();

				return null;

			}

		}

	}

}
