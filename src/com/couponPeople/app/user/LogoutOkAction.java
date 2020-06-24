package com.couponPeople.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;

public class LogoutOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forword = new ActionForward();
		
		request.setCharacterEncoding("UTF-8");
		request.getSession().invalidate();
		
		forword.setPath(request.getContextPath() + "/app/core/index.jsp");
		forword.setRedirect(true);
		
		return forword;
	}

}
