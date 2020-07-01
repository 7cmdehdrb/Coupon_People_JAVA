package com.couponPeople.app.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.couponPeople.mybatis.config.SqlMapConfig;

public class UserDAO {

	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public UserDAO() {
		// TODO Auto-generated constructor stub
		sqlsession = sessionf.openSession(true);
	}

	public int getTotalUser() {
		int result = 0;

		try {
			result = (Integer) sqlsession.selectOne("User.totalUser");
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON GET TOTAL USER");
		}

		return result;
	}

	public boolean signup(UserBean user) {
		int result = -1;

		try {
			result = sqlsession.insert("User.signup", user);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON SIGN UP");
		}

		return result == 1;
	}

	public boolean kakaoSignup(UserBean user) {
		int result = -1;

		try {
			result = sqlsession.insert("User.kakaoSignup", user);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON SIGN UP");
		}

		return result == 1;
	}
	
	public boolean checkEmailValid(String email) {
		int result = -1;

		try {
			result = (Integer) sqlsession.selectOne("User.checkEmailValid", email);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON CHECK EMAIL VALID");
		}

		return result == 0;
	}

	public int checkKakaoExisted(String email) {
		int result = 0;

		try {
			Object temp = sqlsession.selectOne("User.checkKakaoExisted", email);
			if(temp != null) {
				if(((String)temp).equals("KAKAO")) {
					result = 1;
				}else {
					result = 2;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON CHECK KAKAO EXIST");
		}

		// 0: not existed, 1: kakao, 2: local
		
		return result;
	}

	public HashMap<String, Object> localLogin(UserBean user) {

		HashMap<String, Object> result = null;

		try {
			result = sqlsession.selectOne("User.login", user);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON LOCAL LOGIN");
		}

		return result;
	}

	public boolean verifyEmail(String emailSecret) {
		int result = 0;

		try {
			result = sqlsession.update("User.verifyEmail", emailSecret);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON VERIFY EMAIL");
		}

		return result == 1;
	}
	
	public boolean setEmailSecret(UserBean user) {
		int result = 0;
		
		try {
			result = sqlsession.update("User.setEmailSecret", user);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON SET EMAIL SECRET");
		}
		
		return result == 1;
	}
	
	public boolean resetPassword(UserBean user) {
		
		int result = 0;
		
		try {
			result = sqlsession.update("User.resetPassword", user);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON RESET PASSWORD");
		}
		
		return result == 1;
	}
	
	public int getCurrentMoney(String email) {
		int currentMoney = 0;
		
		try {
			currentMoney = (Integer)sqlsession.selectOne("User.getCurrentMoney", email);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON GET CURRNENT MONEY");
		}
		
		return currentMoney;
	}
	
	public boolean chargeMoney(UserBean user, int chargeMoney) {
		
		int currentMoney = 0;
		int result = 0;
		
		try {
			currentMoney = getCurrentMoney(user.getEmail());
			
			user.setMoney(currentMoney + chargeMoney);
			
			result = sqlsession.update("User.chargeMoney", user);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON CHARGE MONEY");
			return false;
		}
		
		return result == 1 ? true : false;
	}

}
