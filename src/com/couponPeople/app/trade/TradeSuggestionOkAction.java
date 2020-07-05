package com.couponPeople.app.trade;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.trade.dao.TradeBean;
import com.couponPeople.app.trade.dao.TradeDAO;

public class TradeSuggestionOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");

		String trade_user = (String) request.getSession().getAttribute("email");
		String trade_coupon = request.getParameter("trade_coupon");
		String owner = request.getParameter("owner");
		String action = request.getParameter("action");
		int price = Integer.parseInt(request.getParameter("price"));

		TradeBean trade = new TradeBean();
		TradeDAO trade_dao = new TradeDAO();

		trade.setTrade_buyer(trade_user);
		trade.setTrade_coupon(Integer.parseInt(trade_coupon));

		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		out.println("<script>");

		switch (action) {
		case "determine":
			if (trade_dao.determineCoupon(trade)) {
				out.println("alert('Determining Succeed')");
			} else {
				out.println("alert('Error')");
			}
			break;

		case "cheat":
			if (trade_dao.makeCheatedCoupon(trade)) {
				out.println("alert('Reporting Succeed')");
			} else {
				out.println("alert('Error')");
			}
			break;

		case "refund":
			if (trade_dao.refundCoupon(trade, price)) {
				out.println("alert('Refunding Succeed')");
			} else {
				out.println("alert('Error')");
			}
			break;

		case "finish":
			if (trade_dao.finishCoupon(trade, owner, price)) {
				out.println("alert('Finishing Succeed')");
			} else {
				out.println("alert('Error')");
			}
			break;

		case "manualFinish":
			if (trade_dao.manualFinishCoupon(trade, owner, price)) {
				out.println("alert('Manual Finishing Succeed')");
			} else {
				out.println("alert('Error')");
			}
			break;

		default:
			out.println("alert('Error')");
			break;
		}

		out.println("location.href='http://localhost:8085/Coupon_People_Ver2/coupons/getCouponDetail.cu?id="
				+ trade.getTrade_coupon() + "'");
		out.println("</script>");
		out.close();

		return null;
	}

}
