package com.couponPeople.app.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.couponPeople.mybatis.config.SqlMapConfig;

public class ReviewDAO {

	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public ReviewDAO() {
		// TODO Auto-generated constructor stub
		sqlsession = sessionf.openSession(true);
	}

	public boolean checkDupReview(ReviewBean review) {
		int result = -1;

		try {
			result = (Integer) sqlsession.selectOne("Review.checkDupReview", review);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON CHECKDUP REVIEW");
		}

		return result == 0;
	}

	public boolean createReview(ReviewBean review) {
		int result = 0;

		try {
			result = sqlsession.insert("Review.createReview", review);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON CREATE REVIEW");
		}

		return result == 1;
	}

	public boolean updateReview(ReviewBean review) {
		int result = 0;

		try {
			result = sqlsession.update("Review.updateReview", review);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON UPDATE REVIEW");
		}

		return result == 1;
	}

	public double getAverageReview(String email) {
		double result = 0.0;
		List<Object> temp = null;
		int total = 0;

		try {

			temp = sqlsession.selectList("Review.getAverageReview", email);
			for (Object element : temp) {
				total += (Integer) element;
			}

			if(temp.size() != 0) {
				result = Double.parseDouble(String.format("%.2f", (double) total / temp.size()));
				return result;
			}


		} catch (ArithmeticException me) {
			// TODO: handle exception
			System.err.println(me);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
		}

		return result;
	}

}
