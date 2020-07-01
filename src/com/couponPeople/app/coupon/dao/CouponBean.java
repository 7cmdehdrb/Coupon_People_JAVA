package com.couponPeople.app.coupon.dao;

public class CouponBean {

	private int coupon_num;
	private String coupon_name;
	private String coupon_image;
	private String coupon_serial;
	private String coupon_description;
	private int coupon_price;
	private String coupon_type;
	private String coupon_owner;
	private String coupon_buyer;
	private String coupon_finish_date;
	private int is_coupon_finished;
	private int is_coupon_determined;
	private int is_coupon_cheated;
	
	public CouponBean() {
		// TODO Auto-generated constructor stub
	}

	public int getCoupon_num() {
		return coupon_num;
	}

	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	
	public String getCoupon_serial() {
		return coupon_serial;
	}
	
	public void setCoupon_serial(String coupon_serial) {
		this.coupon_serial = coupon_serial;
	}

	public String getCoupon_image() {
		return coupon_image;
	}

	public void setCoupon_image(String coupon_image) {
		this.coupon_image = coupon_image;
	}

	public String getCoupon_description() {
		return coupon_description;
	}

	public void setCoupon_description(String coupon_description) {
		this.coupon_description = coupon_description;
	}

	public int getCoupon_price() {
		return coupon_price;
	}

	public void setCoupon_price(int coupon_price) {
		this.coupon_price = coupon_price;
	}

	public String getCoupon_type() {
		return coupon_type;
	}

	public void setCoupon_type(String coupon_type) {
		this.coupon_type = coupon_type;
	}

	public String getCoupon_owner() {
		return coupon_owner;
	}

	public void setCoupon_owner(String coupon_owner) {
		this.coupon_owner = coupon_owner;
	}

	public String getCoupon_buyer() {
		return coupon_buyer;
	}

	public void setCoupon_buyer(String coupon_buyer) {
		this.coupon_buyer = coupon_buyer;
	}

	public String getCoupon_finish_date() {
		return coupon_finish_date;
	}

	public void setCoupon_finish_date(String coupon_finish_date) {
		this.coupon_finish_date = coupon_finish_date;
	}

	public int getIs_coupon_finished() {
		return is_coupon_finished;
	}

	public void setIs_coupon_finished(int is_coupon_finished) {
		this.is_coupon_finished = is_coupon_finished;
	}

	public int getIs_coupon_determined() {
		return is_coupon_determined;
	}

	public void setIs_coupon_determined(int is_coupon_determined) {
		this.is_coupon_determined = is_coupon_determined;
	}

	public int getIs_coupon_cheated() {
		return is_coupon_cheated;
	}

	public void setIs_coupon_cheated(int is_coupon_cheated) {
		this.is_coupon_cheated = is_coupon_cheated;
	}

}
