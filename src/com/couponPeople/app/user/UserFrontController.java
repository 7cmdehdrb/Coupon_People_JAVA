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

		case "/users/checkEmailValidOkAction.us":
			action = new CheckEmailValidOkAction();

			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON FRONT CONTROLLOR - CHECK EMAIL VALID");
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
