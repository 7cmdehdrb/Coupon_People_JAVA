package com.couponPeople.app.comment.dao;

public class CommentBean {

	private int comment_num;
	private String comment_user;
	private int comment_coupon;
	private String comment_text;
	private String comment_datetime;
	private int is_deleted;
	private int is_secret;

	public CommentBean() {
		// TODO Auto-generated constructor stub
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public String getComment_user() {
		return comment_user;
	}

	public void setComment_user(String comment_user) {
		this.comment_user = comment_user;
	}

	public int getComment_coupon() {
		return comment_coupon;
	}

	public void setComment_coupon(int comment_coupon) {
		this.comment_coupon = comment_coupon;
	}

	public String getComment_text() {
		return comment_text;
	}

	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}

	public String getComment_datetime() {
		return comment_datetime;
	}

	public void setComment_datetime(String comment_datetime) {
		this.comment_datetime = comment_datetime;
	}

	public int getIs_deleted() {
		return is_deleted;
	}

	public void setIs_deleted(int is_deleted) {
		this.is_deleted = is_deleted;
	}

	public int getIs_secret() {
		return is_secret;
	}

	public void setIs_secret(int is_secret) {
		this.is_secret = is_secret;
	}

}
