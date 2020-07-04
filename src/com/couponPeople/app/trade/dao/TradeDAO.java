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

}
