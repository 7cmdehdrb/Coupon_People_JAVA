package com.couponPeople.app.trade.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.couponPeople.app.user.dao.UserBean;
import com.couponPeople.app.user.dao.UserDAO;
import com.couponPeople.mybatis.config.SqlMapConfig;

public class TradeDAO {

	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public TradeDAO() {
		// TODO Auto-generated constructor stub
		sqlsession = sessionf.openSession(true);
	}

	public boolean createTrade(TradeBean trade, int price) {
		sqlsession = sessionf.openSession(false);

		UserBean user = new UserBean();
		user.setEmail(trade.getTrade_buyer());

		try {
			if (new UserDAO().getCurrentMoney(user.getEmail()) < price) {
				throw new Exception();
			}

			// 1. 거래 생성
			if ((Integer) sqlsession.insert("Trade.createTrade", trade) == 1) {
				// 2. 쿠폰 구매자 변경
				if ((Integer) sqlsession.update("Coupon.createTrade", trade) == 1) {
					// 3. 돈 감소
					if (new UserDAO().chargeMoney(user, price * (-1))) {
						sqlsession.commit();
						return true;
					}
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON CREATE TRADE");
		}

		return false;
	}

	public boolean determineCoupon(TradeBean trade) {
		int result = 0;
		// 1. 쿠폰 상태 변경

		try {
			result = sqlsession.update("Coupon.determineCoupon", trade);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON DETERMINE COUPON");
		}

		return result == 1;
	}

	public boolean makeCheatedCoupon(TradeBean trade) {
		int result = 0;

		try {
			result = sqlsession.update("Coupon.makeCheatedCoupon", trade);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON MAKE CHEATED COUPON");
		}

		return result == 1;
	}

	public boolean refundCoupon(TradeBean trade, int price) {
		sqlsession = sessionf.openSession(false);

		UserBean user = new UserBean();
		user.setEmail(trade.getTrade_buyer());

		// 1. 거래 삭제
		if ((Integer) sqlsession.insert("Trade.deleteTrade", trade) == 1) {
			// 2. 쿠폰 구매자 NULL
			if ((Integer) sqlsession.update("Coupon.deleteTrade", trade) == 1) {
				// 3. 돈 증가
				if (new UserDAO().chargeMoney(user, price)) {
					sqlsession.commit();
					return true;
				}
			}
		}

		return false;
	}

	public boolean finishCoupon(TradeBean trade, String owner, int price) {
		sqlsession = sessionf.openSession(false);

		UserBean user = new UserBean();
		user.setEmail(owner);

		// 1. 쿠폰 finish
		if ((Integer) sqlsession.update("Coupon.finishTrade", trade) == 1) {
			// 2. 돈 증가
			if (new UserDAO().chargeMoney(user, price)) {
				sqlsession.commit();
				return true;
			}
		}

		return false;
	}

	public boolean manualFinishCoupon(TradeBean trade, String owner, int price) {
		sqlsession = sessionf.openSession(false);

		UserBean user = new UserBean();
		user.setEmail(owner);

		// 0. Valid Check
		if (checkOutdatedTrade(trade.getTrade_num())) {
			// 1. 쿠폰 finish
			if ((Integer) sqlsession.update("Coupon.manualFinishTrade", trade) == 1) {
				// 2. 돈 증가
				if (new UserDAO().chargeMoney(user, price)) {
					sqlsession.commit();
					return true;
				}
			}
		}

		return false;
	}

	public boolean checkOutdatedTrade(int coupon_num) {
		int result = 0;

		try {
			result = (Integer) sqlsession.selectOne("Trade.checkOutdatedTrade", coupon_num);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON CHECK OUTDATED COUPON");
		}

		return result != 0;
	}

}
