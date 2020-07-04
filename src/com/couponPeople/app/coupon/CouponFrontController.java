package com.couponPeople.app.coupon;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;

@SuppressWarnings("serial")
public class CouponFrontController extends HttpServlet {

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
		case "/coupons/createCouponOkAction.cu":
			action = new CreateCouponOkAction();
			
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON COUPON FRONT CONTROLLER - CREATE COUPON");
			}
			
			break;
			
		case "/coupons/getCouponDetail.cu":
			action = new GetCouponDetail();
			
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON COUPON FRONT CONTROLLER - DELETE COUPON");
			}
			
			break;
			
		case "/coupons/deleteCouponOkAction.cu":
			action = new DeleteCouponOkAction();
			
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON COUPON FRONT CONTROLLER - DELETE COUPON");
			}
			
			break;
			
		case "/coupons/searchCoupon.cu":
			action = new SearchCouponAction();
			
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON COUPON FRONT CONTROLLER - SEARCH COUPON");
			}
			
			break;
			
		case "/coupons/searchCouponBy.cu":
			action = new SearchCouponByAction();
			
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON COUPON FRONT CONTROLLER - SEARCH BY COUPON");
			}
			
			break;
			
		case "/coupons/searchCouponByUser.cu":
			action = new SearchCouponByUserAction();
			
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON COUPON FRONT CONTROLLER - SEARCH BY COUPON");
			}
			
			break;
			
		case "/coupons/searchCouponByBuyer.cu":
			action = new SearchCouponByBuyerAction();
			
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON COUPON FRONT CONTROLLER - SEARCH BY BUYER COUPON");
			}
			
			break;
			
		case "/coupons/couponListAction.cu":
			action = new CouponListAction();
			
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
				System.out.println("ERROR ON COUPON FRONT CONTROLLER - COUPON LIST");
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
