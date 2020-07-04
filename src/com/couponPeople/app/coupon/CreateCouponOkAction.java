package com.couponPeople.app.coupon;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couponPeople.action.Action;
import com.couponPeople.action.ActionForward;
import com.couponPeople.app.coupon.dao.CouponBean;
import com.couponPeople.app.coupon.dao.CouponDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CreateCouponOkAction implements Action {

	public static String nullOrEmptyToReplaceString(String str, String replaceStr) {
		if (str == null || "".equals(str)) {
			return replaceStr;
		}
		return str;
	}

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");

		String saveFolder = "C:\\Users\\3cmde\\Desktop\\동규\\Study\\Korea IT Acamedy\\workspace\\Coupon_People_Ver2\\WebContent\\public\\image\\couponimage";
		int fileSize = 5 * 1024 * 1024; // 5M

		ActionForward forword = new ActionForward();
		CouponBean coupon = new CouponBean();
		CouponDAO coupon_dao = new CouponDAO();

		// TO_DATE('${coupon_finish_date} 00:00:00', ''YYYY-MM-DD HH24:MI:SS')

		try {

			MultipartRequest multi = null;
			multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());

			String coupon_name = multi.getParameter("coupon_name");
			String coupon_serial = multi.getParameter("coupon_serial");
			String coupon_image = multi.getFilesystemName("coupon_image");
			String coupon_description = multi.getParameter("coupon_description");
			String coupon_price = multi.getParameter("coupon_price");
			String coupon_type = multi.getParameter("coupon_type");
			String coupon_catagory = multi.getParameter("coupon_catagory");
			String coupon_owner = multi.getParameter("coupon_owner");
			String coupon_finish_date = multi.getParameter("coupon_finish_date");

			String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date()); // 현재시간
			String realFileName = now + "_" + coupon_owner;

			if (coupon_image != "" && coupon_image != null) {

				String fileName = nullOrEmptyToReplaceString(coupon_image, "");

				File oldFile = new File(saveFolder + "/" + fileName);
				File newFile = new File(saveFolder + "/" + realFileName + ".png");

				oldFile.renameTo(newFile);

				coupon.setCoupon_image("'" + realFileName + ".png" + "'");

			} else {
				coupon.setCoupon_image("NULL");
			}

			coupon.setCoupon_name(coupon_name);
			coupon.setCoupon_serial(coupon_serial);
			coupon.setCoupon_description(coupon_description);
			coupon.setCoupon_price(Integer.parseInt(coupon_price));
			coupon.setCoupon_type(coupon_type);
			coupon.setCoupon_catagory(coupon_catagory);
			coupon.setCoupon_owner(coupon_owner);
			coupon.setCoupon_finish_date(coupon_finish_date);

			if (coupon_dao.createCoupon(coupon)) {
				forword.setPath(request.getContextPath() + "/coupons/couponListAction.cu");
				forword.setRedirect(true);
				return forword;
			}
			
			throw new Exception();

		} catch (Exception e) {

			System.out.println(e);

			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('ERROR')");
			out.println("location.href='http://localhost:8085/Coupon_People_Ver2/app/core/index.jsp'");
			out.println("</script>");
			out.close();
			return null;

		}

	}

}
