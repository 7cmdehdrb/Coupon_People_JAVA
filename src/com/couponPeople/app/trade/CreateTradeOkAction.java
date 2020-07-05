package com.couponPeople.app.trade;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.trade.dao.TradeBean;
import com.couponPeople.app.trade.dao.TradeDAO;

public class CreateTradeOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		TradeBean trade = new TradeBean();
		TradeDAO trade_dao = new TradeDAO();
		
		int price = Integer.parseInt(request.getParameter("price"));
		String trade_coupon = request.getParameter("trade_coupon");
		String trade_buyer = (String)request.getSession().getAttribute("email");
		
		trade.setTrade_coupon(Integer.parseInt(trade_coupon));
		trade.setTrade_buyer(trade_buyer);
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		out.println("<script>");
		
		if(trade_dao.createTrade(trade, price)) {
			out.println("alert('SUCCESS')");
			out.println("location.href='http://localhost:8085/Coupon_People_Ver2/app/user/userDetail.jsp?id=" + trade.getTrade_buyer() + "'");
		}else {
			out.println("alert('ERROR')");
			out.println("location.href='http://localhost:8085/Coupon_People_Ver2/coupons/getCouponDetail.cu?id=" + trade.getTrade_coupon() + "'");
		}
		
		out.println("</script>");
		out.close();
		
		return null;
	}

}
