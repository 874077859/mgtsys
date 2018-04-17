package com.vip.mgtsys.model;

import java.io.Serializable;

public class RegistInfo implements Serializable {

	private static final long serialVersionUID = -8823504831198719837L;
	
	private String userId;
	
	private String email;
	
	private String pwd;
	
	private String agreed;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getAgreed() {
		return agreed;
	}

	public void setAgreed(String agreed) {
		this.agreed = agreed;
	}
}
