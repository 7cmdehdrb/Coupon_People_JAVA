package com.couponPeople.app.user;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.user.dao.UserDAO;
import com.couponPeople.utils.Utils;

public class ChangePasswordOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forword = new ActionForward();
		Utils utils = new Utils();
		UserDAO user_dao = new UserDAO();
		HashMap<String, String> data = new HashMap<>();
		
		String user_email = (String)request.getSession().getAttribute("email");
		String old_pw = request.getParameter("pw_1");
		String new_pw = request.getParameter("pw_2");
		
		data.put("email", user_email);
		data.put("old_pw", utils.hashFunction(old_pw));
		data.put("new_pw", utils.hashFunction(new_pw));
		
		if(user_dao.changePassword(data)) {
			forword.setPath(request.getContextPath() + "/app/core/index.jsp");
			forword.setRedirect(true);
		}else {
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('Maybe your current password is not valid')");
			out.println("location.href='http://localhost:8085/Coupon_People_Ver2/app/user/changePw.jsp'");
			out.println("</script>");
			out.close();
			
			return null;
			
		}
		
		return forword;
	}

}
