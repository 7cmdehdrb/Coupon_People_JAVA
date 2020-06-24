package com.couponPeople.app.user.dao;

public class UserBean {

	private String email;
	private String nickname;
	private String profile_image;
	private String password;
	private int money;
	private String login_method;
	private String email_secret;
	private int email_valid;
	private int is_activated;
	private int is_admin;
	private int is_email_public;
	private int is_interest_public;
	private int is_money_public;

	public UserBean() {
		// TODO Auto-generated constructor stub
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfile_image() {
		return profile_image;
	}

	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getLogin_method() {
		return login_method;
	}

	public void setLogin_method(String login_method) {
		this.login_method = login_method;
	}

	public String getEmail_secret() {
		return email_secret;
	}

	public void setEmail_secret(String email_secret) {
		this.email_secret = email_secret;
	}

	public int getEmail_valid() {
		return email_valid;
	}

	public void setEmail_valid(int email_valid) {
		this.email_valid = email_valid;
	}

	public int getIs_activated() {
		return is_activated;
	}

	public void setIs_activated(int is_activated) {
		this.is_activated = is_activated;
	}

	public int getIs_admin() {
		return is_admin;
	}

	public void setIs_admin(int is_admin) {
		this.is_admin = is_admin;
	}

	public int getIs_email_public() {
		return is_email_public;
	}

	public void setIs_email_public(int is_email_public) {
		this.is_email_public = is_email_public;
	}

	public int getIs_interest_public() {
		return is_interest_public;
	}

	public void setIs_interest_public(int is_interest_public) {
		this.is_interest_public = is_interest_public;
	}

	public int getIs_money_public() {
		return is_money_public;
	}

	public void setIs_money_public(int is_money_public) {
		this.is_money_public = is_money_public;
	}

}
