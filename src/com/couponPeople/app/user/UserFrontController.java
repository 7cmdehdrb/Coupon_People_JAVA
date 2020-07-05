package com.couponPeople.app.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;

@SuppressWarnings("serial")
public class UserFrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		ActionForward forward = null;
		Action action = null;

		// Condition will be here ///

		switch (command) {
		case "/users/signupOkAction.us":
			action = new SignupOkAction();

			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON FRONT CONTROLLOR - SIGNUP");
			}

			break;

		case "/users/loginOkAction.us":
			action = new LoginOkAction();

			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON FRONT CONTROLLOR - LOGIN");
			}

			break;

		case "/users/kakaoLoginOkAction.us":
			action = new KakaoLoginOkAction();

			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON FRONT CONTROLLOR - LOGIN");
			}

			break;

		case "/users/logoutOkAction.us":
			action = new LogoutOkAction();

			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON FRONT CONTROLLOR - LOGOUT");
			}

			break;

		case "/users/verifyEmailAction.us":
			action = new VerifyEmailAction();

			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON FRONT CONTROLLOR - VERIFY EMAIL");
			}

			break;

		case "/users/resetPasswordAction.us":
			action = new ResetPasswordAction();

			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON FRONT CONTROLLOR - RESET PASSWORD");
			}

			break;

		case "/users/resetPasswordOkAction.us":
			action = new ResetPasswordOkAction();

			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON FRONT CONTROLLOR - RESET PASSWORD OK");
			}

			break;

		case "/users/payOkAction.us":
			action = new PayOkAction();

			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON FRONT CONTROLLOR - PAY OK");
			}

			break;

		case "/users/changePasswordOkAction.us":
			action = new ChangePasswordOkAction();

			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON FRONT CONTROLLOR - CHANGE PW");
			}

			break;
			
		case "/user/UserEditOk.us":
			action = new EditUserOkAction();
			
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON FRONT CONTROLLOR - EDIT USER");
			}
			
			break;

		default:
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/error/404.jsp");
			break;
		}

		//
		if (forward != null) {
			if (forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispather = req.getRequestDispatcher(forward.getPath());
				dispather.forward(req, resp);
			}
		}
	}

}
