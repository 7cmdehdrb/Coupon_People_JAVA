package com.couponPeople.app.trade;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.trade.dao.TradeDAO;

public class CheckOutdatedTradeOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		TradeDAO trade_dao = new TradeDAO();
		
		int coupon_num = Integer.parseInt(request.getParameter("id"));
		
		PrintWriter out = response.getWriter();
		
		if(trade_dao.checkOutdatedTrade(coupon_num)) {
			out.println("ok");
		}else {
			out.println("notok");
		}
		
		out.close();
		
		
		return null;
	}

}
