package com.couponPeople.app.trade.dao;

public class TradeBean {

	private int trade_num;
	private int trade_coupon;
	private String trade_buyer;
	private String trade_date;
	private int is_finished;
	private int is_determined;
	private int is_cheated;

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

	public int getIs_finished() {
		return is_finished;
	}

	public void setIs_finished(int is_finished) {
		this.is_finished = is_finished;
	}

	public int getIs_determined() {
		return is_determined;
	}

	public void setIs_determined(int is_determined) {
		this.is_determined = is_determined;
	}

	public int getIs_cheated() {
		return is_cheated;
	}

	public void setIs_cheated(int is_cheated) {
		this.is_cheated = is_cheated;
	}

}
