package com.couponPeople.app.trade.dao;

public class TradeBean {

	private int trade_num;
	private int trade_coupon;
	private String trade_buyer;
	private String trade_date;

	public TradeBean() {
		// TODO Auto-generated constructor stub
	}

	public int getTrade_num() {
		return trade_num;
	}

	public void setTrade_num(int trade_num) {
		this.trade_num = trade_num;
	}

	public int getTrade_coupon() {
		return trade_coupon;
	}

	public void setTrade_coupon(int trade_coupon) {
		this.trade_coupon = trade_coupon;
	}

	public String getTrade_buyer() {
		return trade_buyer;
	}

	public void setTrade_buyer(String trade_buyer) {
		this.trade_buyer = trade_buyer;
	}

	public String getTrade_date() {
		return trade_date;
	}

	public void setTrade_date(String trade_date) {
		this.trade_date = trade_date;
	}

}
