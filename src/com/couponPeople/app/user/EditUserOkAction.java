package com.couponPeople.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.user.dao.UserBean;
import com.couponPeople.app.user.dao.UserDAO;

public class EditUserOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forword = new ActionForward();
		UserBean user = new UserBean();
		UserDAO user_dao = new UserDAO();
		
		String email = (String) request.getSession().getAttribute("email");
		String nickName = request.getParameter("nickName");
		int is_money_public = Integer.parseInt(request.getParameter("is_money_public"));
		
		user.setEmail(email);
		user.setNickname(nickName);
		user.setIs_money_public(is_money_public);
		
		if(user_dao.updateUser(user)) {
			
			forword.setPath(request.getContextPath() + "/app/core/index.jsp");
			forword.setRedirect(true);
			
		}else {
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('ERROR')");
			out.println("location.href='http://localhost:8085/Coupon_People_Ver2/app/user/editUser.jsp'");
			out.println("</script>");
			out.close();
			
			return null;
			
		}
		
		return forword;
	}

}
