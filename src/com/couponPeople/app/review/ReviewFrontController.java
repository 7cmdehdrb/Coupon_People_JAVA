package com.couponPeople.app.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;

@SuppressWarnings("serial")
public class ReviewFrontController extends HttpServlet {

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
		case "/reviews/doReview.re":
			action = new DoReview();
			
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON REVIEW FRONT - DO REVIEW");
			}
			
			break;
			
		case "/reviews/submitReview.re":
			action = new ReviewSubmitOkAction();
			
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON REVIEW FRONT - REVIEW");
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
