package com.couponPeople.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.user.dao.UserBean;
import com.couponPeople.app.user.dao.UserDAO;

public class KakaoLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("SSSS");
		
		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		UserBean user = new UserBean();
		UserDAO user_dao = new UserDAO();

		String kakao_email = request.getParameter("kakao_email");
		String kakao_username = request.getParameter("kakao_username");
		String kakao_userImage = request.getParameter("kakao_userImage");

		user.setEmail(kakao_email);
		user.setNickname(kakao_username);
		user.setProfile_image(kakao_userImage);
		user.setMoney(10000);
		user.setLogin_method("KAKAO");
		user.setEmail_valid(1);
		user.setIs_activated(1);
		user.setIs_admin(0);
		user.setIs_email_public(1);
		user.setIs_interest_public(1);
		user.setIs_money_public(1);

		try {

			int db_login_method = user_dao.checkKakaoExisted(user.getEmail());
			// 0: not existed, 1: kakao, 2: local
			
			System.out.println(db_login_method);

			if (db_login_method == 1) {
				// already signed up

				session.setAttribute("email", user.getEmail());
				session.setAttribute("nickname", user.getNickname());
				session.setAttribute("loginMethod", user.getLogin_method());
				session.setAttribute("isAdmin", user.getIs_admin());

				forward.setRedirect(false);
				forward.setPath("/app/core/index.jsp");

			} else if (db_login_method == 0) {

				if (user_dao.kakaoSignup(user)) {
					// successfully created

					session.setAttribute("email", user.getEmail());
					session.setAttribute("nickname", user.getNickname());
					session.setAttribute("loginMethod", user.getLogin_method());
					session.setAttribute("isAdmin", user.getIs_admin());

					forward.setRedirect(false);
					forward.setPath("/app/core/index.jsp");

				} else {
					throw new Exception();
				}

			} else {
				throw new Exception();
			}

		} catch (Exception e) {
			// TODO: handle exception

			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('You have might signed up with local account')");
			out.println("location.href = 'http://localhost:8085/Coupon_People_Ver2/app/core/index.jsp'");
			out.println("</script>");
			out.close();
			
			return null;

		}

		return forward;
	}

}
