package com.couponPeople.app.coupon.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.couponPeople.mybatis.config.SqlMapConfig;

public class CouponDAO {

	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public CouponDAO() {
		// TODO Auto-generated constructor stub
		sqlsession = sessionf.openSession(true);
	}

	public boolean createCoupon(CouponBean coupon) {
		int result = 0;

		try {
			result = sqlsession.insert("Coupon.createCoupon", coupon);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON CREATE COUPON");
		}

		return result == 1;
	}

	public List<CouponBean> getCouponList() {

		List<Object> temp = null;
		List<CouponBean> result = new ArrayList<CouponBean>();

		try {
			temp = sqlsession.selectList("Coupon.getCouponList");

			for (int i = 0; i < temp.size(); i++) {
				result.add((CouponBean) temp.get(i));
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON GET COUPON LIST");
		}

		return result;
	}

	public List<CouponBean> searchCouponList(String searchValue) {

		List<Object> temp = null;
		List<CouponBean> result = new ArrayList<CouponBean>();

		try {
			temp = sqlsession.selectList("Coupon.searchCoupon", searchValue);

			for (int i = 0; i < temp.size(); i++) {
				result.add((CouponBean) temp.get(i));
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON GET SEARCH COUPON");
		}

		return result;
	}
	
	public List<CouponBean> searchCouponListBy(HashMap<String, String> data) {

		List<Object> temp = null;
		List<CouponBean> result = new ArrayList<CouponBean>();

		try {
			temp = sqlsession.selectList("Coupon.searchCouponBy", data);

			for (int i = 0; i < temp.size(); i++) {
				result.add((CouponBean) temp.get(i));
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON GET SEARCH COUPON");
		}

		return result;
	}
	
	public List<CouponBean> searchCouponListByUser(String email) {

		List<Object> temp = null;
		List<CouponBean> result = new ArrayList<CouponBean>();

		try {
			temp = sqlsession.selectList("Coupon.searchCouponUser", email);

			for (int i = 0; i < temp.size(); i++) {
				result.add((CouponBean) temp.get(i));
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON GET SEARCH COUPON");
		}

		return result;
	}

	public CouponBean getCouponDetail(int coupon_num) {

		CouponBean result = null;

		try {
			result = sqlsession.selectOne("Coupon.getCouponDetail", coupon_num);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON GET COUPON DETAIL");
		}

		return result;
	}

	public boolean removeCoupon(HashMap<String, String> data) {

		int result = 0;

		try {
			result = sqlsession.delete("Coupon.removeCoupon", data);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON REMOVE COUPON");
		}

		return result == 1;
	}

	public String alterCouponType(String type) {

		switch (type) {
		case "KAKAO":
			return "카카오 키프티콘";

		case "BOOK":
			return "도서문화 상품권";

		case "CULTURE":
			return "컬쳐랜드 문화상품권";

		default:
			return "오류";
		}

	}

	public String alterCouponCatagory(String catagory) {

		switch (catagory) {
		case "CARD":
			return "상품권";

		case "MOVIE":
			return "영화/공연";

		case "BEAUTY":
			return "뷰티";

		case "DESSERT":
			return "디저트";

		case "FOOD":
			return "식사";

		case "MART":
			return "편의점/마트";

		default:
			return "오류";

		}

	}

}
