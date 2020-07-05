package com.couponPeople.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.user.dao.UserBean;
import com.couponPeople.app.user.dao.UserDAO;

public class PayOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		boolean result = false;
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String userEmail = (String)request.getSession().getAttribute("email");
		String chargeMoney = request.getParameter("charge");
		
		UserDAO user_dao = new UserDAO();
		UserBean user = new UserBean();
		
		user.setEmail(userEmail);
		
		result = user_dao.chargeMoney(user, Integer.parseInt(chargeMoney));
		
		PrintWriter out = response.getWriter();
		out.println(result ? 1 : 0);
		out.close();
		
		return null;
	}

}
