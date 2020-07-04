package com.couponPeople.app.review.dao;

public class ReviewBean {

	private String review_to;
	private String review_from;
	private int review;

	public ReviewBean() {
		// TODO Auto-generated constructor stub
	}

	public String getReview_to() {
		return review_to;
	}

	public void setReview_to(String review_to) {
		this.review_to = review_to;
	}

	public String getReview_from() {
		return review_from;
	}

	public void setReview_from(String review_from) {
		this.review_from = review_from;
	}

	public int getReview() {
		return review;
	}

	public void setReview(int review) {
		this.review = review;
	}

}
