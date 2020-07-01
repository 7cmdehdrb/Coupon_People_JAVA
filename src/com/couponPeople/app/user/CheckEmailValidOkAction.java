package com.couponPeople.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.user.dao.UserDAO;

public class CheckEmailValidOkAction implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
//		UserDAO user_dao = new UserDAO();
//		boolean result = false;
//		
//		request.setCharacterEncoding("UTF-8");
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("application/json");
//
//		result = user_dao.checkEmailValid(request.getParameter("email"));
//		
//		JSONObject json = new JSONObject();
//		json.put("emailValid", result ? "true" : "false");
//		
//		PrintWriter out = response.getWriter();
//		out.print(json);
//		out.flush();
//		
//		System.out.println(json);
		
		return null;
	}

}
